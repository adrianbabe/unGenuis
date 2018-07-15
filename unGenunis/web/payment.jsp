<%-- 
    Document   : payment
    Created on : 2018-6-23, 23:31:05
    Author     : 野渡舟子
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
    </head>
    <body>
        <%
    request.setCharacterEncoding("UTF-8");
    String username=(String)request.getParameter("username");
    String total = (String)request.getParameter("total");
    String payment = (String)request.getParameter("payment");
    
    if (payment.equals("微信")){
            %>
        <h1>扫码支付<%=total %>元：</h1>
        <img src="img/weixin.png"/>
 <% }
else if(payment.equals("支付宝")){
%>
        <h1>扫码支付<%=total %>元：</h1>
        <img src="img/zhifubao.jpg"/>
 <%
}
else if(payment.equals("现金")){
%>
        <h1>给钱。</h1>
 <%
}
%>
    </body>
</html>
