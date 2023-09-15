const Sequelize = require('sequelize');
const db = require('../db');
const Folder=require('../models/folder');

const UserRoom = db.define("userRoom", {
    s_no: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    user_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    folder_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    user_type:{
        type: Sequelize.STRING,
        allowNull:false
    }
},{
    timestamps:false
});

UserRoom.hasOne(Folder,{foreignKey:'folder_id',sourceKey:'folder_id'});

module.exports=UserRoom;