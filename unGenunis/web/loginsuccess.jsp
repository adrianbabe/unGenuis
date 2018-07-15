<%-- 
    Document   : indexsuccess
    Created on : 2018-6-23, 20:37:39
    Author     : 野渡舟子
--%>

<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登陆结果</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
    String username=(String)request.getParameter("username");
        %>
        <h1>登陆成功！<a href=index.jsp?username=<%= username%>>返回主页</a></h1>
</body>
</html>