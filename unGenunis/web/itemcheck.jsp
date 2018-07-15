<%-- 
    Document   : indexcheck
    Created on : 2018-6-23, 20:27:46
    Author     : 野渡舟子
--%>

<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="Bean.DBBean" scope="page" />
<%
    request.setCharacterEncoding("UTF-8");
    String username=(String)request.getParameter("username");
    String itemID=(String)request.getParameter("itemID");
    String amount=(String)request.getParameter("amount");
    
    //下面是数据库操作
    if(!db.isNumeric(amount)||Integer.parseInt(amount)<=0){
         out.print("<script language='javaScript'> alert('数据错误！');</script>");
           %>
            <script type="text/javascript" language="javascript">
alert("数据错误！");
window.document.location.href="userlogin.html";
<jsp:forward page="item.jsp">
    <jsp:param value="<%=username %>" name="username"/>
    <jsp:param value="<%=itemID %>" name="itemID"/>
</jsp:forward>
<%
    }
    
    String sql="select * from cart where username='"+username+"'and itemID='"+ itemID +"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    if(rs.next())
    {
          int a = Integer.parseInt(rs.getString("amount"));
          int b = Integer.parseInt(amount);
          amount = String.valueOf(a+b);
          sql ="update cart set amount='"+ amount +"' where username='"+username+"' and itemID='"+ itemID +"'";
          db.executeUpdate(sql);
           %>
<jsp:forward page="cartlist.jsp">
    <jsp:param value="<%=username %>" name="username"/>
</jsp:forward>
<%
    }
    else 
    {
        sql ="insert into cart(username,itemID,amount)values"
                    + "('"+ username +"','"+ itemID +"','"+ amount +"')";
            db.executeUpdate(sql);
        %>
<jsp:forward page="cartlist.jsp">
    <jsp:param value="<%= username %>" name="username"/>
</jsp:forward>
<%
     }  
%>
</body>
</html>
