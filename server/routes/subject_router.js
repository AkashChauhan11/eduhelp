const {Router}=require('express');
const subjectController=require('../controller/subject_controller.js');
const subjectRouter=Router(); //creating a router

subjectRouter.get('/getsubjects/:userid',subjectController.getsubject)
subjectRouter.post('/addsub/:userid',subjectController.addSubject)
subjectRouter.delete('/deletesub/:userid/:subCode',subjectController.deletSubject)

module.exports=subjectRouter;
