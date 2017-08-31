<%--
  Created by IntelliJ IDEA.
  User: 嘉睿
  Date: 2017/8/23
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <title>TitleOnTheTop</title>
</head>
<body>
<jsp:useBean id="DBHelper" scope="page" class="util.DBHelper" />
<%
    String use=request.getParameter("username");
    String pas=request.getParameter("password");
    String name = DBHelper.SelectDate("Table_usersinfo","username",use,"name");

    String passward = DBHelper.SelectDate("Table_users1","username",use,"password");
   if(passward.equals(pas))
   {
       session.setAttribute("name",name);
       session.setAttribute("username",use);
      response.sendRedirect("login-index.jsp?o=1");
   }
   else
   {
       response.setCharacterEncoding("utf-8");
       PrintWriter Out =response.getWriter();
       Out.print("<script>alert('账号或密码输入有误,请重新输入！');window.location='index.jsp'</script>");
       Out.flush();
       Out.close();
   }
%>
</body>
</html>
