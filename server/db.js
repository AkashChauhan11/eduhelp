const{Sequelize}=require('sequelize');

const sequelize = new Sequelize('Eduhelp', 'postgres', 'akash11', {
    host: 'localhost',
    dialect: 'postgres' 
  });

module.exports=sequelize;