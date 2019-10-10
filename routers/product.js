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
  var sql=`SELECT pid,showimg,title,price FROM product WHERE main_id=? AND minor_id=?`;
  if($sort==2){
    pool.query(sql+"ORDER BY price ASC",[$main_id,$minor_id],(err,result)=>{
      if(err) throw err;
      res.send(result);
    })
  }else if($sort==3){
    pool.query(sql+"ORDER BY price DESC",[$main_id,$minor_id],(err,result)=>{
      if(err) throw err;
      res.send(result);
    })
  }else{
    pool.query(sql,[$main_id,$minor_id],(err,result)=>{
      if(err) throw err;
      res.send(result);
    })
  }
  
})
router.get("/detail",(req,res)=>{
  var $pid=req.query.pid;
  pool.query('SELECT * FROM product WHERE pid=?',[$pid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})

router.get("/addcart",(req,res)=>{
  if(!req.session.uid){
    res.send({code:-2,msg:'请登陆'});
    return
  }else{
    var $uid=req.session.uid;
  }
  var $title=req.query.title;
  var $show_img=req.query.show_img;
  var $pid=req.query.pid;
  var $style=req.query.style;
  var $spec=req.query.spec;
  var $price=req.query.price;
  pool.query('SELECT c_id,count FROM cart WHERE pid=? AND uid=?',[$pid,$uid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      var $c_id=result[0].c_id;
      var $count=result[0].count+1;
      pool.query('UPDATE cart SET count=? WHERE c_id=?',[$count,$c_id],(err,result)=>{
        if(err) throw err;
        res.send({ code:1, msg: "添加成功" });
      });
    }else{
      pool.query('INSERT INTO cart VALUES(NULL,?,?,?,?,?,?,?,?,?)',
      [$title,$price,$pid,$uid,$show_img,$style,$spec,1,false],(err,result)=>{
        if(err) throw err;
        res.send({code:2,msg:"添加成功"})
      })
    }
  })
});

router.get("/cart",(req,res)=>{
  if(!req.session.uid){
    res.send({code:-2,msg:'请登陆'});
    return
  }else{
    var $uid=req.session.uid;
  }
  pool.query('SELECT * FROM cart WHERE uid=?',[$uid],(err,result)=>{
    if(err) throw err;
    res.send(result);
  });
});
module.exports=router;