const { HasMany } = require('sequelize');
const db=require('../db');



const Folder=require("../models/folder")
const Resource=require("../models/resource_folder")
const  UserFolder=require("../models/user_folder")


const createRoom= async(req,res)=>{
    const room_name=req.body.roomName;
    const room_description=req.body.roomDescription;
    const type="Room";
    const join_string=req.body.joinString;
    const image_url=req.body.imageUrl;
    const admin_id=req.params.userid;
    //const admin_id=1;
    // create a new room

    try{
      const folder= await Folder.create({
            folder_name:room_name,
            description:room_description,
            type:type,
            join_string:join_string,
            image_url:image_url,
            admin_id:admin_id,
            parent_folder_id:null
        });

        const user_folder= await UserFolder.create({
            user_id:admin_id,
            folder_id:folder.folder_id,
            user_type:"Admin"
        })
    if(folder!=null && user_folder!=null){
        res.status(201).json({
            "status": "Success",
            "message": "Room Created"
        });
    }else{
        res.status(400).json({
            "status": "UnSuccessful",
            "message": "Room Creation failed"
        });
    }
    }catch(e){
        console.log(e.message)
        res.status(400).json({
            "status": "UnSuccessful",
            "message": e.message
        });
    }
}

const getRooms= async(req,res)=>{
    const user_id=req.params.userid;

    try {
        
        const rooms=await UserFolder.findAll({
            //attributes: ['folder_id'],
            where:{
                user_id:user_id
            },
            include:{
                model:Folder,
            }
        });
        if(rooms.length==0){
            res.status(400).json({
                "status": "Not Found",
                "message": "Data not found"
            });
        }else{
           res.status(200).json(rooms)
        }
    } catch (e) {
        res.status(200).json({
            "status": "Unsuccessful",
            "message": e.message
        });
    }
}

const joinRoom=(req,res)=>{
    // joining a room
}

const createFolder=(req,res)=>{
    // creating sub folder within a room
}

const uploadFile=async(req,res)=>{
    const resource_name=req.body.resourceName;
    const path=req.body.path;
    const parent_folder_id=req.body.parent_folder_id;
    const resource=req.resource;

    console.log("resource name ="+resource_name);
    console.log("file="+resource);

    try {
        const res= await Resource.create({
            resource_name:resource_name,
            path:path,
            parent_folder_id:parent_folder_id,
            resource:resource
        });
    
        if(res!=null){
            res.status(200).json({
                "status": "Successfull",
                "message": "Resource Uploaded"
            });
        }else{
            res.status(400).json({
                "status": "Unsuccessfull",
                "message": "Resource Upload failed"
            });
        }
    } catch (e) {
        res.status(400).json({
            "status": "Unsuccessfull",
            "message": e.message
        });
    }
    
}




module.exports={
    createRoom,getRooms,uploadFile
}