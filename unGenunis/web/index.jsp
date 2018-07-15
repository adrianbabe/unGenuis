<%-- 
    Document   : index
    Created on : 2018-6-23, 21:30:16
    Author     : 野渡舟子
--%>

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
