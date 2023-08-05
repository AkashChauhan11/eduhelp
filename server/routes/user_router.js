const {Router}=require('express');
const user_controller=require('../controller/user_controller');

const userRouter=Router();


userRouter.get('/login',user_controller.login);
userRouter.post('/signup',user_controller.signup);

module.exports=userRouter;

