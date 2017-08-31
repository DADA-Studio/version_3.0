<%--
  Created by IntelliJ IDEA.
  User: 嘉睿
  Date: 2017/8/30
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="DBHelper" class="util.DBHelper"></jsp:useBean>
<%
    String referrer=request.getParameter("referrer");
    String company=request.getParameter("company");
    String phone=request.getParameter("phone");
    String recommended=request.getParameter("recommended");
    String reason=request.getParameter("reason");
    String email=request.getParameter("email");
    String title=request.getParameter("title");
    String position=request.getParameter("position");
    DBHelper.InsertTable_referrer(referrer,position,title,company,phone,email,recommended,reason);
%>
<jsp:forward page="login-membertable.jsp"></jsp:forward>
</body>
</html>
