const db=require('../db');
const Sequelize = require('sequelize');

const Folder=db.define("folder",{
    folder_id:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    folder_name:{
        type:Sequelize.STRING,
        allowNull:false,
    },
    description:{
        type:Sequelize.STRING,
        allowNull:true
    },
    type:{
        type:Sequelize.STRING,
        allowNull:false
    },
    date:{
        type:Sequelize.DATE,
        defaultValue:Date.now(),
        allowNull:false
    },
    join_string:{
        type:Sequelize.STRING,
        allowNull:true
    },
    image_url:{
        type:Sequelize.STRING,
        allowNull:true
    },
    admin_id:{
        type: Sequelize.INTEGER,
        allowNull:true
    },
    parent_folder_id:{
        type: Sequelize.INTEGER,
        allowNull:true
    }
},{
    timestamps:false
});


module.exports=Folder;