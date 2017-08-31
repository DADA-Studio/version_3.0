<%--
  Created by IntelliJ IDEA.
  User: 李普
  Date: 2017/8/24
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("username");
    session.removeAttribute("name");
    session.removeAttribute("page_id");
    response.sendRedirect("index.jsp");
%>
</body>
</html>
