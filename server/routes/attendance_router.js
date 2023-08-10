const {Router}=require('express');
const attendanceController=require('../controller/attendance_controller')
const AttendanceRouter=Router(); //creating a router



AttendanceRouter.post('/fillattendance/:userid',attendanceController.fillAttendance);

module.exports=AttendanceRouter;