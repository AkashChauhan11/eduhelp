const Sequelize = require('sequelize');
const db = require('../db');


const Subject = db.define("subject", {
    s_no: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    user_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    sub_code: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    sub_name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    sub_sem: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
},{
    timestamps:false
});

module.exports=Subject;