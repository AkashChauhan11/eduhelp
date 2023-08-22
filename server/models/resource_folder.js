const db=require('../db');
const Sequelize = require('sequelize');

const Resource=db.define("reosurce",{
    room_id:{
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
},{
    timestamps:false
});

module.exports=Resource;