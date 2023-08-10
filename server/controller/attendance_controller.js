const db=require('../db');
const Attendance=require('../models/attendance');

const fillAttendance= async (req,res)=>{
    const userid=req.params.userid;
    try {
        const [user, created] = await Attendance.findOrCreate({
            where: {
                user_id:userid,
                sem:req.body.sem,
                sub_code:req.body.sub_code,
                slot:req.body.slot,
                date:req.body.date,
                remark:req.body.remark,
                type:req.body.type,
            },
            defaults: {
                user_id:userid,
                sem:req.body.sem,
                sub_code:req.body.sub_code,
                slot:req.body.slot,
                date:req.body.date,
                remark:req.body.remark,
                type:req.body.type,
            }
        });
        if (created) {
            res.status(200).json({
                "status": "successful",
                "message": "Attendance filled successfully"
            });
        } else {
            res.status(400).json({
                "status": "unsuccessful",
                "message": "Attendance is already filled"
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

const deleteAttendance = async (req,res)=>{
    // delete a attendance
}

const modifyAttendance=async (req,res)=>{
    // modify a attendance
}

const getUserAttendnace=async(req,res)=>{
    //getting attendance of the user....
}


module.exports={
    fillAttendance,getUserAttendnace,modifyAttendance,deleteAttendance
}