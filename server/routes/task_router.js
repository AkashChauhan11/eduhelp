const {Router}=require('express');
const taskController=require('../controller/task_controller');
const taskRouter=Router();

taskRouter.post('/addtask/:userId',taskController.addtask);
taskRouter.delete('/deletetask/:taskid',taskController.deletetask);
taskRouter.get('/getalltask/:userId',taskController.gettasks);


module.exports=taskRouter