<%--
  Created by IntelliJ IDEA.
  User: 嘉睿
  Date: 2017/8/28
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:useBean id="DBHelper" scope="page" class="util.DBHelper" />
<%
        DBHelper.UpdateProperty("Table_usersinfo","username",(String)session.getAttribute("username"),"name",request.getParameter("name"));
        session.setAttribute("name",request.getParameter("name"));
         DBHelper.UpdateProperty("Table_usersinfo","username",(String)session.getAttribute("username"),"sex",request.getParameter("sex"));
         DBHelper.UpdateProperty("Table_usersinfo","username",(String)session.getAttribute("username"),"birthday",request.getParameter("birthday"));
         DBHelper.UpdateProperty("Table_usersinfo","username",(String)session.getAttribute("username"),"address",request.getParameter("address"));
         DBHelper.UpdateProperty("Table_usersinfo","username",(String)session.getAttribute("username"),"phone",request.getParameter("tel"));
         DBHelper.UpdateProperty("Table_usersinfo","username",(String)session.getAttribute("username"),"referrer",request.getParameter("tuijian"));
        response.sendRedirect("login-index.jsp?o=1");
%>
</body>
</html>
