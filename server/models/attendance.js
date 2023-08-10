const db=require('../db');
const Sequelize = require('sequelize');

const Attendance=db.define("attendance",{
    s_no:{
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    user_id:{
        type: Sequelize.INTEGER,
        allowNull:false,
    },
    sem:{
        type:Sequelize.INTEGER,
        allowNull:false
    },
    sub_code:{
         type:Sequelize.STRING,
        allowNull:false
    },
    slot:{
        type:Sequelize.INTEGER,
        allowNull:false
    },
    date:{
        type:Sequelize.DATE,
        allowNull:false
    },
    remark:{
        type:Sequelize.INTEGER,
        allowNull:false
    },
    type:{
        type:Sequelize.STRING,
        allowNull:false,
    },
    reason:{
        type:Sequelize.STRING,
        allowNull:true
    },    
},{
    timestamps:false
});

module.exports=Attendance;