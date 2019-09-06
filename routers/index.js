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
//获取展示列表
router.get("/show", (req, res) => {
	var $position=req.query.position;
  pool.query(
    `SELECT pid,img,title,subtitle,price FROM index_show WHERE position=?`,[$position],
    (err, result) => {
			if(err)throw err;
      res.send(result);
    }
  );
});

router.get("/index_trial",(req,res)=>{
  pool.query(`SELECT title,showimg FROM trial WHERE is_show=?`,[true],(err,result)=>{
    if(err) throw err;
    res.send(result);
  });
});

// 抛出路由对象
module.exports=router;