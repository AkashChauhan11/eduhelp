const Sequelize = require('sequelize');
const db = require('../db');

const UserFolder = db.define("userfolder", {
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

module.exports=UserFolder;