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
//获取首页体验家
router.get("/index_trial",(req,res)=>{
  pool.query(`SELECT showtitle,showimg FROM trial WHERE is_show=?`,[true],(err,result)=>{
    if(err) throw err;
    res.send(result);
  });
});
//获取首页灵感
router.get("/index_inspiration",(req,res)=>{
  pool.query(`SELECT imgurl,exp FROM inspiration WHERE is_show=?`,[1],(err,result)=>{
    if(err) throw err;
    // console.log(result);
    res.send(result);
  });
});
//获取首页推荐商品
router.get("/index_product",(req,res)=>{
  var $p_class=req.query.p_class;
  var $detail_class=req.query.detail_class;
  // console.log($p_class,$detail_class);
  var sql=`SELECT showimg,title,price FROM product WHERE p_class=? AND detail_class=? AND is_show=?`;
  pool.query(sql,[$p_class,$detail_class,1],(err,result)=>{
    if(err) throw err;
    res.send(result);
    // console.log(result);
  })
})
// 抛出路由对象
module.exports=router;