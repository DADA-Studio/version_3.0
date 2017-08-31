<%--
  Created by IntelliJ IDEA.
  User: 嘉睿
  Date: 2017/8/28
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="DBHelper" class="util.DBHelper" scope="page"></jsp:useBean>
<%
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
    DBHelper.UpdateProperty("Table_usersinfo","username",(String)session.getAttribute("username"),"branch",branch);
    DBHelper.UpdateProperty("Table_usersinfo","username",(String)session.getAttribute("username"),"community",community);

%>
<jsp:forward page="window/window3.jsp" />
</body>
</html>
