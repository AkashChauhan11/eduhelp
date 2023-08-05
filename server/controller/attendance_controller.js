const pool=require('../db');

const getall=(req,res)=>{
    pool.query("SELECT * FROM student",(err,result)=>{
        if(err) throw err;
        res.status(200).json(result.rows);
    })
}


module.exports={
    getall
}