const { HasMany } = require('sequelize');
const db=require('../db');



const Folder=require("../models/folder")
const Resource=require("../models/resource_folder")
const  UserFolder=require("../models/user_folder");
const UserRoom = require('../models/user_folder');


const createRoom= async(req,res)=>{
    const room_name=req.body.roomName;
    const room_description=req.body.roomDescription;
    const type="Room";
    const join_string=new Date().getTime();
    const image_url=new Date().getTime();
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
                
                //right:true
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

const joinRoom=async(req,res)=>{
    const join_string=req.body.join_string;
    const user_id=req.params.userid;

    try {
        const folder=await Folder.findOne({
            where:{
                join_string:join_string
            },
            attributes:['folder_id']
        });
        console.log(folder.folder_id)
        const id=folder.folder_id


        const [room, created] = await UserRoom.findOrCreate({
            where: {
                user_id:user_id,
                folder_id:id
            },
            defaults: {
                user_id:user_id,
                folder_id: id,
                user_type:'User'
            }
        });

        if(created){
            res.status(200).json({
                "status": "Successful",
                "message": "You joined the Room"
            });
        }else{
            res.status(400).json({
                "status": "Unsuccessfull",
                "message": "joining failed"
            });
        }

    } catch (e) {
        res.status(400).json({
            "status": "Unsuccessfull",
            "message": e.message
        });
    }


   
    


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

const getallresource=async(req,res)=>{
    const parent_id=req.params.parentId
    try {
        const resources=await Resource.findAll({
            where:{
                parent_folder_id:parent_id
            }
        });
        if(resources!=null){
            res.status(200).json(resources);
        }else{
            res.status(200).json({
                "status": "successfull",
                "message": "No resource found"
            });
        }
    } catch (e) {
        
    }

  
}



module.exports={
    createRoom,getRooms,uploadFile,joinRoom,getallresource
}