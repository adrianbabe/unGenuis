<%-- 
    Document   : cartlist
    Created on : 2018-6-23, 23:29:20
    Author     : 野渡舟子
--%>
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
         <jsp:useBean id="db" class="Bean.DBBean" scope="page" />
     <%
           request.setCharacterEncoding("UTF-8");
           String username=(String)request.getParameter("username");
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
                        <table border="0">
                    <tr>
                        <td>购物车</td>
                    </tr>
                </table>  
                        <%if(username!=null){
                            String sql = "select * from cart A left join itemlist B on A.itemID=B.itemID where username='"+username+"'";
                             ResultSet rs =db.executeQuery(sql);//运行上面的语句
                             String itemID = "";
                             String amount = "";
                             
                  String itemname = "";
                  String itemprice = "";
                  String itemicon = "";
                             
                             int t2 = 0;
    while(rs.next())
    {             
              itemID = rs.getString("itemID");
              amount = rs.getString("amount");
              
                  itemname = rs.getString("itemname");
                  itemprice = rs.getString("itemprice");
                  itemicon = rs.getString("itemicon");
                  
          int a = Integer.parseInt(amount);
          int p = Integer.parseInt(itemprice);
          int t1 = a*p ;
          t2 = t2 + t1;
            /*  
             String sql2 = "select * from itemlist where itemID='"+itemID+"'";
             ResultSet rs2 =db.executeQuery(sql2);
                  String itemname = "";
                  String itemprice = "";
                  String itemicon = "";
             if(rs2.next()){
                  itemname = rs2.getString("itemname");
                  itemprice = rs2.getString("itemprice");
                  itemicon = rs2.getString("itemicon");
             }  

          int a = Integer.parseInt(amount);
          int p = Integer.parseInt(itemprice);
          int t1 = a*p ;
         
          t2 = t2 + t1;*/
              %>
              <form id="cartchange" name="cartchange" action="cartchange.jsp" method="post">
              <table border="0">
                    <tr>
                        <td><img src="img/<%=itemicon%>"/></td>
                        <td><a href="item.jsp?itemID=<%=itemID%>&username=<%= username%>"> <%=itemname%> </a></td>
                        <td>共<input type="text" name="amount" value="<%=a%>">件 ￥<%=t1%> .00 元</td>
                        <input type="hidden" name="username" value="<%= username%>" />
                        <input type="hidden" name="itemID" value="<%= itemID%>" />
                        <td><input type="submit" value="保存" style="color:#BC8F8F"></td>
                    </tr>
                </table> 
               </form>     
              <%
    }
                            %>
                    <form id="orderform" name="orderForm" action="order.jsp" method="post">
                    <table border="0">
                    <tr>
                        <td>合计 ￥<%=t2%>.00 元</td>
                        <input type="hidden" name="total" value="<%= t2%>" />
                        <input type="hidden" name="username" value="<%= username%>" />
                        <td><input type="submit" value="提交" style="color:#BC8F8F"></td>
                    </tr>
                </table> 
               </form>     
         <%
    }
                            %>
    </body>
</html>
