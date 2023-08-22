const db=require('../db');
const Sequelize = require('sequelize');

const Folder=db.define("folder",{
    room_id:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    title:{
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
    }
    
},{
    timestamps:false
});

module.exports=Folder;