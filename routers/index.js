// 引入express
const express=require("express");
// 引入mysql
const nysql=require("mysql");
// 引入pool
const pool=require("../pool");
//创建路由对象
var router=express.Router();

router.get("/carousel",(req,res)=>{
	pool.query(`SELECT img,title,href FROM carousel`,(err,result)=>{
		res.send(result);
	});
});

// 抛出路由对象
module.exports=router;