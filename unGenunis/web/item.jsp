<%-- 
    Document   : item
    Created on : 2018-6-23, 23:23:16
    Author     : 野渡舟子
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item</title>
    </head>
    <body>
         <jsp:useBean id="db" class="Bean.DBBean" scope="page" />
        <%
           request.setCharacterEncoding("UTF-8");
           String username=(String)request.getParameter("username");
           String itemID=(String)request.getParameter("itemID");
                   
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
                            String sql = "select * from itemlist where itemID='"+itemID+"'";
                             ResultSet rs=db.executeQuery(sql);//运行上面的语句
                             String itemname = "";
                             String itemprice = "";
                             String itemicon = "";
                             String itemnote = "";
    if(rs.next())
    {
              itemname = rs.getString("itemname");   
              itemprice = rs.getString("itemprice");
              itemicon = rs.getString("itemicon");
              itemnote = rs.getString("itemnote");
              %>
              <table border="0">
                    <tr>
                        <td><img src="img/<%=itemicon%>"/></td>
                    </tr>
                     <tr>
                        <td> <%=itemname%> </a></td>
                        <td>￥<%=itemprice%>.00 元</td>
                    </tr>
                     <tr>
                        <td> 商品详情： </a></td>
                        <td> <%=itemnote%> </td>
                    </tr>
                </table>   
                    <form id="itemform" name="itemForm" action="itemcheck.jsp" method="post">
                <table border="0">
                    <tr>
                        <td>数量：</td>
                        <td><input type="text" name="amount" value="1"></td>
                        <input type="hidden" name="username" value="<%= username%>" />
                        <input type="hidden" name="itemID" value="<%= itemID %>" />
                        <td><input type="submit" value="加入购物车" style="color:#BC8F8F"></td>
                    </tr>
                </table>     
            </form>
              <%
    }
                            %>               
    </body>
</html>
