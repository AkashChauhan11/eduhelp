const Subject = require('../models/subject.js');



//adding a new subject
const addSubject = async (req, res) => {
    const user_id = req.params.userid;
    const subCode = req.body.subCode;
    const subName = req.body.subName;
    const subSem = req.body.subSem;

    try {
        const [user, created] = await Subject.findOrCreate({
            where: {
                user_id: user_id,
                sub_code: subCode
            },
            defaults: {
                sub_code: subCode,
                sub_name: subName,
                sub_sem: subSem,
                user_id: user_id
            }
        });
        if (created) {
            res.status(201).json({
                "status": "successful",
                "message": "Subject Added"
            });
        } else {
            res.status(400).json({
                "status": "unsuccessful",
                "message": "Subject with this subject code already exits"
            });
        }
    } catch (err) {
        console.log(err.message)
        res.status(400).json({
            "status": "unsuccessful",
            "message": "Internal server error"
        });
    }
}

//get all subjects
const getsubject = async (req, res) => {
    const user_id = req.params.userid;
    try {
        const allsub = await Subject.findAll({
            where: {
                user_id: user_id
            },
            attributes: ['sub_name', 'sub_code', 'sub_sem']
        });
        res.status(200).json(allsub);
    } catch (err) {
        res.status(400).json({
            "status": "unsuccessful",
            "message": "Internal server error"
        });
    }
}


//delete a subject
const deletSubject = async (req, res) => {
    const user_id = req.params.userid;
    const subCode = req.params.subCode
    try {
        const sub = await Subject.findOne({
            where: {
                user_id: user_id,
                sub_code: subCode
            }
        });
        if (sub) {
            await sub.destroy();
            res.status(200).json({
                "status": "successful",
                "message": "Subject deleted"
            });
        } else {
            res.status(400).json({
                "status": "unsuccessful",
                "message": "Subject not found"
            });
        }
    } catch (err) {
        res.status(200).json({
            "status": "unsuccessful",
            "message": "Internal Server Error"
        });
    }
}

const editsubject = (req, res) => {
    //edit a subject
}

module.exports = {
    addSubject, deletSubject, editsubject, getsubject
}

