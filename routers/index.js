// 引入express
const express=require("express");
// // 引入mysql
// const mysql=require("mysql");
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
  var $main_id=req.query.main_id;
  var $minor_id=req.query.minor_id;
  // console.log(req.query);
  // console.log($p_class,$detail_class);
  var sql=`SELECT showimg,title,price FROM product WHERE main_id=? AND minor_id=? AND is_show=?`;
  pool.query(sql,[$main_id,$minor_id,1],(err,result)=>{
    if(err) throw err;
    res.send(result);
    // console.log(result);
  })
})

//获取show面板中designshow
router.get("/index_design",(req,res)=>{
  pool.query(`SELECT did,showimg,title FROM design_show`,(err,result)=>{
    if(err) throw err;
    res.send(result);
  });
})
// 获取show面板中所有的灵感
router.get("/show_inspiration", (req, res) => {
  pool.query(
    `SELECT imgurl,exp,like_num,comment_num FROM inspiration LIMIT 0,3`,
    (err, result) => {
      if (err) throw err;
      // console.log(result);
      res.send(result);
    }
  );
});
router.get("/mainClass",(req,res)=>{
  // console.log("有请求进来了")
	var list=[];
	pool.query('SELECT main_id,main_title,main_img FROM main_class',(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
});

router.get("/minorClass",(req,res)=>{
  // console.log("有请求进来了")
  var main_id=req.query.main_id;
  // console.log(main_id);
	// var list=[];
	pool.query('SELECT minor_id,minor_title,minor_img,main_img,mainclass,main_title FROM minor_class,main_class WHERE mainclass=main_id AND mainclass=?',[main_id],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
});
// 抛出路由对象
module.exports=router;