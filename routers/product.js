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
module.exports=router;