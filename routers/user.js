//导入模块  express  mysql  pool 
const express=require("express");
// const mysql=require("mysql");
const pool=require("../pool");
//创建路由对象
var router=express.Router();

// 注册路由
router.post("/register",(req,res)=>{
	var $phone=req.body.phone;
	var $uname=req.body.uname;
	var $upwd=req.body.upwd;
	pool.query('SELECT uid FROM user WHERE phone=?',[$phone],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({code:-1,msg:'手机号已存在'});
			return;
		}
		pool.query('INSERT INTO user VALUES (NULL,?,?,md5(?))',[$uname,$phone,$upwd],(err,result)=>{
			if(err) throw err;
			// console.log(res);
			if(result.affectedRows>0){
				res.send({code:1,msg:'注册成功'})
			}
		})
	})
});
//登录路由
router.post("/login",(req,res)=>{
	var $phone = req.body.phone;
  var $uname = req.body.uname;
	var $upwd = req.body.upwd;
	// console.log(req.body);
	pool.query("SELECT uid,uname FROM user WHERE uname=? AND phone=? AND upwd=md5(?)",[$uname,$phone,$upwd],(err,result)=>{
		if(err) throw err;
		// console.log(result.length);
		if(result.length>0){
			req.session.uid=result[0].uid;
			res.send({code:1,msg:'登录成功'})
		}else{
			res.send({code:-1,nsg:"查无此号"})
		}
	})
});

router.get("/test",(req,res)=>{
	console.log('有请求进来了');
	console.log(req.session.uid);
	if(req.session.uid){
		res.send('已经有了session');
	}else{
		res.send('没有')
	}
})






module.exports=router;
//抛出路由对象