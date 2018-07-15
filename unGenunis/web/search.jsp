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
    <body>
        <jsp:useBean id="db" class="Bean.DBBean" scope="page" />
         <%
           request.setCharacterEncoding("UTF-8");
           String username=(String)request.getParameter("username");
           String search =(String)request.getParameter("search");
            if (username != null){
                %>
        <h1>Welcome, <%= username %>!  <a href="index.jsp?username=<%= username%>">Index</a> <a href="home.jsp?username=<%= username%>">Home</a>  <a href="cartlist.jsp?username=<%= username%>">Cart</a>  <a href="index.jsp">Log out</a> </h1>
         
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
                             String itemnote = "";
    while(rs.next())
    {
              itemname = rs.getString("itemname");   
              itemprice = rs.getString("itemprice");
              itemicon = rs.getString("itemicon");
              itemID = rs.getString("itemID");
              itemnote = rs.getString("itemnote");
              
            if(itemname.indexOf(search)>=0||itemID.indexOf(search)>=0||itemnote.indexOf(search)>=0){
              %>
              <table border="0">
                    <tr>
                        <td><img src="img/<%=itemicon%>"/></td>
                        <td><a href="item.jsp?itemID=<%=itemID%>&username=<%= username%>"> <%=itemname%> </a></td>
                        <td>￥<%=itemprice%>.00 元</td>
                    </tr>
                </table>     
              <%
    }}
                            %>
    </body>
    
</html>
