const db=require('../db');
const Sequelize = require('sequelize');

const Resource=db.define("resource",{
    resource_id:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    resource_name:{
        type:Sequelize.STRING,
        allowNull:false,
    },
    path:{
        type:Sequelize.STRING,
        allowNull:false
    },
    parent_folder_id:{
        type:Sequelize.INTEGER,
        allowNull:false
    },
    resource:{
        type:Sequelize.BLOB,
        allowNull:true
    }
},{
    timestamps:false
});

module.exports=Resource;