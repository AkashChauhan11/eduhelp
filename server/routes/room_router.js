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
            cb( null, file.originalname);
        }
    }
);
const upload = multer({storage:storage});

RoomRouter.post('/uploadfile',upload.single('resource'),roomController.uploadFile)

//working apis
RoomRouter.post('/createroom/:userid',roomController.createRoom);
RoomRouter.get('/getrooms/:userid',roomController.getRooms);
RoomRouter.post('/joinroom/:userid',roomController.joinRoom);
RoomRouter.get('/getresources/:parentId',roomController.getallresource)





module.exports=RoomRouter;