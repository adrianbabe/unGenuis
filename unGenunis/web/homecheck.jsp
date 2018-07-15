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
    String password=(String)request.getParameter("password");
    String name=(String)request.getParameter("name");
    String phone=(String)request.getParameter("phone");
    String address=(String)request.getParameter("address");
    
    //下面是数据库操作
    //String sql="select * from account where UserName=" + "'"+username+"'";//定义一个查询语句
    //ResultSet rs=db.executeQuery(sql);//运行上面的语句
   
        String sql ="update account set Password='"+ password +"',name='"+name+"',phone='"+phone+"',address='"+address+"' where UserName='"+username+"'";
            db.executeUpdate(sql);
        %>
<jsp:forward page="home.jsp">
    <jsp:param value=" <%= username %>" name="username"/>
</jsp:forward>
<%
      
%>
</body>
</html>
