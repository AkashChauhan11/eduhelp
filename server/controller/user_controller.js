const bcrypt = require('bcrypt');
const User = require('../models/user');
const Resource=require('../models/resource_folder');
const jwt = require('jsonwebtoken');
const { where } = require('sequelize');



//login existing user 
const login = async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    try {
        const user = await User.findOne({
            where: {
                user_email: email
            }
        });
        if (user === null) {
            res.status(400).json({
                "status": "unsuccessful",
                "message": "User not found"
            });
        }
        else if (await bcrypt.compare(password, user.user_password)) {
            const payload = {
                user_email: user.email
            }
            const accessToken = jwt.sign(payload, 'SECRET');
            await User.update({
                token: accessToken
            },
                {
                    where: {
                        user_email: email
                    }
                });
        } else {
            res.status(400).json({
                "status": "Unsuccessful",
                "message": "Password does not match"

            });
            return res.end();
        }
        res.status(201).json({
            "status": "Success",
            "message": "Login Successful"

        });
    } catch (err) {
        console.log(err.message)
        res.status(400).json({
            "status": "unsuccessful",
            "message": "Internal server error"
        });
    }
}



//registration of new user
const signup = async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    const hashedpw = await bcrypt.hash(password, 10);
    const name = req.body.name;
    console.log(email, hashedpw, name);
    try {
        const user = await User.create({ user_name: name, user_email: email, user_password: hashedpw });
        if (user) res.status(201).json({
            "status": "Success",
            "message": "Registration Successfull"
        });
    } catch (err) {
        if (err.message == "Validation error")
            res.status(400).json({
                "status": "Unsuccessful",
                "message": "Email already exists"
            });
        else {
            res.status(400).json({
                "status": "Unsuccessful",
                "message": "Internal Server Error"
            });
        }
    }
}

const forgotPw = () => {

}

const signupwithgoogle = () => {

}


const addresource=async(req,res)=>{
    console.log('get here')
    const resource_name=req.body.resource_name;
    const resource_path="http://192.168.137.1:3000/Profile/"+resource_name;
    const parent_id=req.body.parent_id;
    console.log(resource_name)
    console.log(resource_path)
    try {
        const res=Resource.create({
            resource_name:resource_name,
            path:resource_path,
            parent_folder_id:parent_id
        })
        if(res!=null){
            res.status(200).json({
                "status": "successful",
                "message": "Resource Uploaded"
            });
        }else{
            res.status(400).json({
                "status": "Unsuccessful",
                "message": "Resource Uploaded failed"
            });
        }
    } catch (e) {
        res.status(400).json({
            "status": "Unsuccessful",
            "message": e.message
        });
    }
}


const addProfilePicture= async(req,res)=>{
    const user_id=req.params.usedId;
    const image_url=req.body.image_url;
    try {
       const user= await User.update({
            image_url: image_url
        },
            {
                where: {
                    user_id: user_id
                }
            });

            if(user!=null){
                
                res.status(200).json({
                    "status": "successful",
                    "message": "Profile Picture uploaded"
                });
            }else{
            res.status(400).json({
                "status": "Unsuccessful",
                "message": "Profile picture not uploaded"
            });
            }
    } catch (e) {
        res.status(400).json({
            "status": "Unsuccessful",
            "message": e.message
        });
    }
}

module.exports = {
    login, signup, signupwithgoogle, forgotPw,addProfilePicture,addresource
}