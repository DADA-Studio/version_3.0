<%--
  Created by IntelliJ IDEA.
  User: 李普
  Date: 2017/8/26
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="DBHelper" scope="page" class="util.DBHelper" />
<%
    String name=request.getParameter("title");
    String essay=request.getParameter("content");
    DBHelper.InserTable_rule(name ,(String)session.getAttribute("name"),essay);
    response.setCharacterEncoding("utf-8");
    PrintWriter Out =response.getWriter();
    Out.print("<script>alert('提交成功！');window.location='login-guifanwrite.jsp?o=5' </script>");
    Out.flush();
    Out.close();
%>
</body>
</html>
