<%--
  Created by IntelliJ IDEA.
  User: 李普
  Date: 2017/8/23
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="DBHelper" scope="page" class="util.DBHelper"></jsp:useBean>
<%
    String name = request.getParameter("name");
    session.setAttribute("name",name);
    String sex = request.getParameter("sex");
    if(sex.equals("1"))
    {
        sex="男";
    }
    else if(sex.equals("2"))
    {
        sex="女";
    }
    else
    {
        sex="其他";
    }
    String birthday = request.getParameter("birthday");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String referrer = request.getParameter("referrer");
    String branch = request.getParameter("hangfenhui");
    if(branch.equals("1"))
    {
        branch="软件学院行分会";
    }
    else if (branch.equals("2"))
    {
        branch="数理学院行分会";
    }
    else if (branch.equals("3"))
    {
        branch="计算机学院行分会";
    }
    String community =request.getParameter("zhuanweihui");
    if(community.equals("1"))
    {
        community="软件工程专委会";
    }
    else if (community.equals("2"))
    {
        community="数字媒体技术专委会";
    }
    else if (community.equals("3"))
    {
        community="网络工程专委会";
    }
    else if (community.equals("4"))
    {
        community="物理学专委会";
    }
    else if (community.equals("5"))
    {
        community="数学专委会";
    }
    else if (community.equals("6"))
    {
        community="统计学专委会";
    }
    else if (community.equals("7"))
    {
        community="计算机科学专委会";
    }
    else if (community.equals("8"))
    {
        community="物联网专委会";
    }
    else if (community.equals("9"))
    {
        community="信息安全专委会";
    }
    String username = (String)session.getAttribute("username");
    DBHelper.InserTable_usersinfo(username,name,sex,birthday,address,phone,referrer,branch,community);
    response.sendRedirect("login-index.jsp");
%>
</body>
</html>
