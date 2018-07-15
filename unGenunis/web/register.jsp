<%-- 
    Document   : Login
    Created on : 2018-6-23, 20:13:45
    Author     : 野渡舟子
--%>

<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册界面</title>
</head>
<body>
    <center>
        <h1 style="color:red">注册</h1>
            <form id="indexform" name="indexForm" action="registercheck.jsp" method="post">
                <table border="0">
                    <tr>
                        <td>账号：</td>
                        <td><input type="text" name="username"></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" name="password">
                        </td>
                    </tr>
                     <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="name">
                        </td>
                    </tr>
                     <tr>
                        <td>手机：</td>
                        <td><input type="text" name="phone">
                        </td>
                    </tr>
                     <tr>
                        <td>地址：</td>
                        <td><input type="text" name="address">
                        </td>
                    </tr>
                </table>
            <br>
                <input type="submit" value="注册" style="color:#BC8F8F">
            </form>
    </center>
</body>
</html>