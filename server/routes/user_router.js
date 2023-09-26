const {Router}=require('express');
const user_controller=require('../controller/user_controller');
const multer=require('multer');

const userRouter=Router();


userRouter.get('/login',user_controller.login);
userRouter.post('/signup',user_controller.signup);

const Uploadprofilepicture = multer.diskStorage(
    {
        destination: 'Profile/',
        filename: function ( req, file, cb ) {
            //req.body is empty...
            //How could I get the new_file_name property sent from client here?
            cb( null, file.originalname);
        }
    }
);
const upload = multer({storage:Uploadprofilepicture});
userRouter.post('/updateImage/:userId',upload.single('file'),user_controller.addresource)

module.exports=userRouter;

