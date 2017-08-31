<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/25
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="DBHelper" class="util.DBHelper" scope="page"></jsp:useBean>
<%
    String privilege = DBHelper.SelectDate("Table_users1","username",(String)session.getAttribute("username"),"privilege");
    if(privilege.equals("游客"))
    {
%>      <a href="login-index.jsp?o=1" <%if("1".equals(request.getParameter("o"))){ out.println("class='active'"); }%> >个人信息<span style="margin-left: 120px;">></span></a>
<a href="login-guifan.jsp?o=4" <%if("4".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;">规范查看<span style="margin-left: 120px;">></span></a>
<%
    }
    else if(privilege.equals("用户"))
    {
%>
    <a href="login-index.jsp?o=1" <%if("1".equals(request.getParameter("o"))){ out.println("class='active'"); }%> >个人信息<span style="margin-left: 120px;">></span></a>
    <a href="login-list.jsp?o=2" <%if("2".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;">提案查看<span style="margin-left: 120px;">></span></a>
    <a href="login-tian.jsp?o=3" <%if("3".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;">提案编制<span style="margin-left: 120px;">></span></a>
    <a href="login-guifan.jsp?o=4" <%if("4".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;">规范查看<span style="margin-left: 120px;">></span></a>
    <a href="login-guifanwrite.jsp?o=5"  <%if("5".equals(request.getParameter("o"))){ out.println("class='active'"); }%>  style="border-top: none;">规范编制<span style="margin-left: 120px;">></span></a>
<%
    }
    else if(privilege.equals("管理员"))
    {
%>
    <a href="login-index.jsp?o=1" <%if("1".equals(request.getParameter("o"))){ out.println("class='active'"); }%> >个人信息<span style="margin-left: 120px;">></span></a>
    <a href="login-list.jsp?o=2" <%if("2".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;">提案查看<span style="margin-left: 120px;">></span></a>
    <a href="login-tian.jsp?o=3" <%if("3".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;">提案编制<span style="margin-left: 120px;">></span></a>
    <a href="login-guifan.jsp?o=4" <%if("4".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;">规范查看<span style="margin-left: 120px;">></span></a>
    <a href="login-guifanwrite.jsp?o=5"  <%if("5".equals(request.getParameter("o"))){ out.println("class='active'"); }%>  style="border-top: none;">规范编制<span style="margin-left: 120px;">></span></a>
    <a href="admin-shenfen.jsp?o=6" <%if("6".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;" >身份管理<span style="margin-left: 120px;">></span></a>
    <a href="admin-tianshenqing1.jsp?o=7" <%if("7".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;" >提案审批A<span style="margin-left: 108px;">></span></a>
    <a href="admin-tianshenqing2.jsp?o=8" <%if("8".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;">提案审批B<span style="margin-left: 108px;">></span></a>
    <a href="admin-tianshenqing3.jsp?o=9" <%if("9".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;"  >提案审批C<span style="margin-left: 108px;">></span></a>
    <a href="login-membertable.jsp?o=10" <%if("10".equals(request.getParameter("o"))){ out.println("class='active'"); }%> style="border-top: none;" >会员推荐表<span style="margin-left: 108px;">></span></a>
<%
    }
    else
    {
        session.removeAttribute("username");
        session.removeAttribute("name");
        session.removeAttribute("page_id");
        response.sendRedirect("index.jsp");
    }
%>