<%-- 
    Document   : home
    Created on : 2018-6-24, 0:07:05
    Author     : 野渡舟子
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
    </head>
    <body>
        <jsp:useBean id="db" class="Bean.DBBean" scope="page" />
       <%
           request.setCharacterEncoding("UTF-8");
           String username=(String)request.getParameter("username");
           String total=(String)request.getParameter("total");
            if (username != null){
                %>
        <h1>Welcome, <%= username %>! <a href="index.jsp?username=<%= username%>">Index</a> <a href="home.jsp?username=<%= username%>">Home</a>  <a href="cartlist.jsp?username=<%= username%>">Cart</a>  <a href="index.jsp">Log out</a> </h1>
         
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
        <%
        String sql ="select * from account where UserName=" + "'"+username+"'";
         ResultSet rs=db.executeQuery(sql);//运行上面的语句
       String password ="" ;   
       String name ="";
       String phone ="";   
       String address ="";   
    if(rs.next())
    {
       password = rs.getString("Password");   
       name = rs.getString("name");
       phone = rs.getString("phone");   
       address = rs.getString("address");   
    } 
        %>
       <form id="homeform" name="homeForm" action="payment.jsp" method="post">
                <table border="0">
                    <input type="hidden" name="username" value="<%= username%>" />
                     <tr>
                        <td>订单信息：</td>
                    </tr> 
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="name" value="<%=name %>">
                        </td>
                    </tr>
                     <tr>
                        <td>手机：</td>
                        <td><input type="text" name="phone" value="<%=phone %>">
                        </td>
                    </tr>
                     <tr>
                        <td>地址：</td>
                        <td><input type="text" name="address" value="<%=address %>">
                        </td>
                    </tr>
                     <tr>
                        <td>配送方式：</td>
<td><select name="transport">
<option>=====please choose=====</option>
<option selected>顺丰速运</option>
<option>圆通快递</option>
<option>申通快递</option>
</select>
                        </td>
                    </tr>
                    <tr>偏好设置
<input type="checkBox" name="hobby" value="匿名购买" checked />匿名购买
<input type="checkBox" name="hobby" value="生成发票" />生成发票
<input type="checkBox" name="hobby" value="货到付款" />货到付款
<input type="checkBox" name="hobby" value="保价到付" />保价到付
</tr>
                     <tr>
                        <td>付款方式：</td>
                        <td><input type="radio" name="payment" value="支付宝" checked/>支付宝
                            <input type="radio" name="payment" value="微信" />微信
                            <input type="radio" name="payment" value="现金" />现金
                        </td>
                    </tr>
                     <tr>
                         <td>总价：<%= total%></td>
                          <input type="hidden" name="total" value="<%= total%>" />
                    </tr>
                </table>
            <br>
                <input type="submit" value="保存" style="color:#BC8F8F">
            </form>     
        <%
       sql ="DELETE FROM cart WHERE username = '"+ username +"' ";
       db.executeUpdate(sql);
        %>
    </body>
</html>
