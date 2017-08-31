<%--
  Created by IntelliJ IDEA.
  User: 李普
  Date: 2017/8/23
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="DBHelper" scope="page" class="util.DBHelper"></jsp:useBean>
<%
    String name = request.getParameter("username");
    String pw = request.getParameter("pw");
    String pw2= request.getParameter("pw2");
    if(name.equals("")||pw.equals("")||pw2.equals(""))
    {
        response.setCharacterEncoding("utf-8");
        PrintWriter Out =response.getWriter();
        Out.print("<script>alert('输入不能为空，请重新输入');window.location='register.jsp' </script>");
        Out.flush();
        out.close();
    }
    else
    {
        if(pw.equals(pw2))
        {
            DBHelper.InsertTable_users1(name,pw);
            session.setAttribute("username", name);
            response.sendRedirect("applymember.jsp");
        }
        else
        {
            response.setCharacterEncoding("utf-8");
            PrintWriter Out =response.getWriter();
            Out.print("<script>alert('两次密码输入不同，请重新输入');window.location='register.jsp' </script>");
            Out.flush();
            Out.close();
        }
    }

%>
</body>
</html>
