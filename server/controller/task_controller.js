const Task=require('../models/task');

const addtask=async(req,res)=>{
        const userid=req.params.userId;
        const tasks=req.body.task;
        try {
            const task=await Task.create({
                user_id:userid,
                task:tasks
            });
            if(task!=null){
                res.status(200).json({
                    "status": "Successfull",
                    "message": "Task Added"
                });
            }else{
                res.status(400).json({
                    "status": "UnSuccessfull",
                    "message": "Task Add fails"
                });
            }
        } catch (e) {
            res.status(400).json({
                "status": "UnSuccessfull",
                "message": e.message
            });
        }
}

const deletetask=async(req,res)=>{
    const taskid=req.params.taskid;
    try {
       await Task.destroy({
            where:{
                task_id:taskid
            }
        });
        res.status(400).json({
            "status": "Successfull",
            "message": "Task Deleted"
        });

    } catch (e) {
        res.status(400).json({
            "status": "UnSuccessfull",
            "message": "Internal Server Error"
        });
    }
}

const gettasks=async(req,res)=>{
    const userId=req.params.userId
    try {
        const tasks=await Task.findAll({
            where:{
                user_id:userId
            }
        });
        if(tasks!=null){
            res.status(400).json(tasks);
        }else{
            res.status(400).json({
                "status": "UnSuccessfull",
                "message": "Erro"
            });
        }
    } catch (e) {
        res.status(400).json({
            "status": "UnSuccessfull",
            "message": "Internal Server Error"
        });
    }
}

module.exports={
    addtask,deletetask,gettasks
}