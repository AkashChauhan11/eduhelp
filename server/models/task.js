const db=require('../db');
const Sequelize = require('sequelize');

const Task=db.define('task',{
    task_id:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    user_id:{
        type: Sequelize.INTEGER,
        allowNull:false
    },
    task:{
        type:Sequelize.STRING,
        allowNull:false
    }
},{
    timestamps:false
});

module.exports=Task;
