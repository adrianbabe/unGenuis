# 项目名称：次元的碰撞
* 项目组：unGenius次元未来
* 项目说明：用户封装、次元壁少女陈列展示、美腻少主打包带回家
* 项目成员：周子腾、闫嘉林、罗幸福、塔里哈尔
* 项目背景：基于大时代下人们对二次元深入的挖掘和开发，贴切实际的生产生活，符合肥宅们对美好事物的向往，综上，在此环境下开发此次项目
# 项目分层总览
* 注册页面
![](https://github.com/adrianbabe/unGenuis/blob/master/unGenunis/web/img/img/%E6%B3%A8%E5%86%8C.png)
![](https://github.com/https://github.com/adrianbabe/unGenuis/blob/master/unGenunis/web/img/img/%E7%99%BB%E5%BD%95.png)
* 商品界面
![](https://github.com/adrianbabe/unGenuis/blob/master/unGenunis/web/img/img/%E5%95%86%E5%93%81%E7%95%8C%E9%9D%A2.png)
* 商品详情
![](https://github.com/adrianbabe/unGenuis/blob/master/unGenunis/web/img/img/%E5%95%86%E5%93%81%E8%AF%A6%E6%83%85.png)
* 购物车
![](https://github.com/adrianbabe/unGenuis/blob/master/unGenunis/web/img/img/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20180715154324.png)
* 结算页面
![](https://github.com/adrianbabe/unGenuis/blob/master/unGenunis/web/img/img/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20180715154205.png)
储存

## 开发环境
* Java SE Development Kit 8 Downloads
* Java开发工具:NetBeans (glassfisher)
* 其他工具: Atom + LiveServer,Github Desktop,Chrome 浏览器

## 开发目的
* 熟练使用java以及jsp格式，以及数据库的连接
* 运用JSON构造HTML代码，并通过mvc整体整合项目的外部环境和外部搭构

## 文件介绍
* web文件夹：存储前端相关信息
  css子文件夹：存储需要使用的CSS样式
  fonts子文件夹：存储css中使用的字体
  images子文件夹：存储使用的相关图片
  js文件夹：存储需要使用的js文件
* src文件夹：存储使用的JAVA类
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
     <style type="text/css">
        body,td,th {
	color: #3248A2;
}
body {
	background-color: #CAE9ED;
}
</style>
    <body>
        <jsp:useBean id="db" class="Bean.DBBean" scope="page" />
         <%
           request.setCharacterEncoding("UTF-8");
           String username=(String)request.getParameter("username");
            if (username != null){
                %>
        <h1>Welcome, <%= username %>!  <a href="home.jsp?username=<%= username%>">Home</a>  <a href="cartlist.jsp?username=<%= username%>">Cart</a>  <a href="index.jsp">Log out</a> </h1>
         
        <%
        }else{
       %>
         <h1>请先 <a href="login.jsp">登录</a> 或 <a href="register.jsp">注册</a> ！</h1>
       <%
           }
        %>
       <form id="indexform" name="indexForm" action="search.jsp" method="post">
                <table border="0">
                    <tr>
                        <td>关键词：</td>
                        <td><input type="text" name="search"></td>
                        <input type="hidden" name="username" value="<%= username%>" />
                        <td><input type="submit" value="搜索" style="color:#BC8F8F"></td>
                    </tr>
                </table>     
            </form>
                       <table border="0">
                    <tr>
                        <td>商品列表</td>
                    </tr>
                </table>       
                        <%
                            String sql = "select * from itemlist";
                             ResultSet rs=db.executeQuery(sql);//运行上面的语句
                             String itemname = "";
                             String itemprice = "";
                             String itemicon = "";
                             String itemID = "";
    while(rs.next())
    {
              itemname = rs.getString("itemname");   
              itemprice = rs.getString("itemprice");
              itemicon = rs.getString("itemicon");
              itemID = rs.getString("itemID");
              %>
              <table border="0">
                    <tr>
                        <td><img src="img/<%=itemicon%>"/></td>
                        <td><a href="item.jsp?itemID=<%=itemID%>&username=<%= username%>"> <%=itemname%> </a></td>
                        <td>￥<%=itemprice%>.00 元</td>
                    </tr>
                </table>     
              <%
    }
                            %>
    </body>
    
</html>
