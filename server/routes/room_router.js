const {Router}=require('express');
const roomController=require('../controller/room_controller');
const multer = require("multer");
const RoomRouter=Router();


var storage = multer.diskStorage(
    {
        destination: 'uploads/',
        filename: function ( req, file, cb ) {
            //req.body is empty...
            //How could I get the new_file_name property sent from client here?
            cb( null, file.originalname+ '-' + Date.now()+".jpg");
        }
    }
);
const upload = multer({storage:storage});
RoomRouter.post('/createroom/:userid',roomController.createRoom);
RoomRouter.get('/getrooms/:userid',roomController.getRooms);
RoomRouter.post('/uploadfile',upload.single('resource'),roomController.uploadFile)



module.exports=RoomRouter;