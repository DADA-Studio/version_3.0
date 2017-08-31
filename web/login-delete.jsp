<%--
  Created by IntelliJ IDEA.
  User: 李普
  Date: 2017/8/30
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="DBHelper" scope="page" class="util.DBHelper" />
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    DBHelper.Delete(Integer.parseInt(request.getParameter("id")));
    response.setCharacterEncoding("utf-8");
    PrintWriter Out =response.getWriter();
    Out.print("<script>alert('删除成功！');window.location='login-tian.jsp' </script>");
    Out.flush();
    Out.close();
%>
</body>
</html>
