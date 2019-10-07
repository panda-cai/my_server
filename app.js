const express=require("express");
//导入post解析模块
const bodyParser=require("body-parser");
//导入跨域模块
const cors=require("cors");
//导入user路由
const userRouter=require("./routers/user");
//导入index路由
const index=require("./routers/index");
//导入商品理由
const product=require("./routers/product")
//创建服务器
const server=express();
//监听端口
server.listen(5050);
//挂载post解析模块
server.use(bodyParser.urlencoded({
	extended:false
}));
//配置跨域请求路径
server.use(
  cors({
    origin: ["http://127.0.0.1:8080", "http://localhost:8080","http://192.168.1.104:8080"],
    credentials: true
  })
);
// 挂载静态资源目录
server.use(express.static("public"));

// 挂载user路由
server.use("/user",userRouter);
//挂在index路由
server.use("/index",index);
server.use("/product",product);
