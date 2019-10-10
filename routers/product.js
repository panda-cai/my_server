// 引入express
const express=require("express");
// 引入pool
const pool=require("../pool");
//创建路由对象
var router=express.Router();

//请求商品列表
router.get("/productList",(req,res)=>{
  var $main_id=req.query.main_id;
  var $minor_id=req.query.minor_id;
  var $sort=req.query.sort;
  // console.log(req.query);
  // console.log($p_class,$detail_class);
  var sql=`SELECT showimg,title,price FROM product WHERE main_id=? AND minor_id=?`;
  if($sort==2){
    pool.query(sql+"ORDER BY price ASC",[$main_id,$minor_id],(err,result)=>{
      if(err) throw err;
      res.send(result);
      // console.log(result);
    })
  }else if($sort==3){
    pool.query(sql+"ORDER BY price DESC",[$main_id,$minor_id],(err,result)=>{
      if(err) throw err;
      res.send(result);
      // console.log(result);
    })
  }else{
    pool.query(sql,[$main_id,$minor_id],(err,result)=>{
      if(err) throw err;
      res.send(result);
      // console.log(result);
    })
  }
  
})
router.get("/detail",(req,res)=>{
  var $pid=req.query.pid;
  console.log($pid);
  pool.query('SELECT * FROM product WHERE pid=?',[$pid],(err,result)=>{
    if(err) throw err;
    console.log(result[0].pid);
    res.send(result);
  })
})

router.get("/cart",(req,res)=>{
  if(!req.session.uid){
    res.send({code:-2,msg:'请登陆'});
    return
  }else{
    var $uid=req.session.uid;
  }
  var $show_img=req.query.show_img;
  var $pid=req.query.pid;
  var $style=req.query.style;
  var $spec=req.query.spec;
  pool.query('SELECT c_id,count FROM cart WHERE pid=? AND uid=?',[$pid,$uid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      var $c_id=result[0].c_id;
      var $count=result[0].count++;
      pool.query('UPDATE cart SET count=? WHERE c_id=?',[$count,$c_id],(err,result)=>{
        if(err) throw err;
        res.send({ code:1, msg: "请登陆" });
      });
    }else{
      pool.query('INSERT INTO cart VALUES(NULL,)')
    }
  })
})
module.exports=router;