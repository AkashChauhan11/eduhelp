const Sequelize = require('sequelize');
const db = require('../db');

const User = db.define("user", {
    user_id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true,
        allowNull:true
    },
    user_name: {
        type: Sequelize.STRING,
        allowNull: false
    },
    user_email: {
        type: Sequelize.STRING,
        allowNull: false,
        unique:true

    },
    user_password: {
        type: Sequelize.STRING,
        allowNull: false

    },
    token:{
        type: Sequelize.STRING,
        allowNull: true
    },
    image_url:{
        type: Sequelize.STRING,
        allowNull: true
    }
});

module.exports=User;