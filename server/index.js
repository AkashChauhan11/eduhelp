const express=require('express');
const userrouter=require('./routes/user_router');
const subjectRouter=require('./routes/subject_router.js');
const attendanceRouter=require('./routes/attendance_router.js');
const roomRouter=require('./routes/room_router');
const app = express();
const port=3000;

const{Sequelize}=require('sequelize');





app.use(express.json());
app.use('/user',userrouter);
app.use('/subject',subjectRouter);
app.use('/attendance',attendanceRouter);
app.use('/room',roomRouter)

app.listen(port,()=>{
    console.log(`listening at port ${port}`)
});