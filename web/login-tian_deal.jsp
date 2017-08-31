<%--
  Created by IntelliJ IDEA.
  User: 李普
  Date: 2017/8/25
  Time: 13:08
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
    String submit = request.getParameter("submit");
    String reserve = request.getParameter("reserve");

    String print = request.getParameter("print");
    String name=request.getParameter("title");
    String essay=request.getParameter("content");
    if(print==null&&reserve==null)
    {
        DBHelper.InsertDraft(name,(String)session.getAttribute("name"),essay);
        response.setCharacterEncoding("utf-8");
        PrintWriter Out =response.getWriter();
        Out.print("<script>alert('提交成功！');window.location='login-tian.jsp' </script>");
        Out.flush();
        Out.close();
    }
    else if(submit==null&&print==null)
    {
        DBHelper.InserTable_caogao(name,(String)session.getAttribute("name"),essay);
        response.setCharacterEncoding("utf-8");
        PrintWriter Out =response.getWriter();
        Out.print("<script>alert('保存成功！');window.location='login-tian.jsp' </script>");
        Out.flush();
        Out.close();
    }

%>
</body>
</html>
