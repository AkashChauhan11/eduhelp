const bcrypt = require('bcrypt');
const User = require('../models/user');
const jwt = require('jsonwebtoken')



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

module.exports = {
    login, signup, signupwithgoogle, forgotPw
}