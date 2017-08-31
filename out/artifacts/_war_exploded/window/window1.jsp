<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>用户信息</title>
	<link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery.js"></script>
    <style>
    	.header{
    		width: 600px;
    		height: 40px;
    		border-bottom: 1px solid #c2c2c2;
    		text-align: center;
    		background-color:  #5FB878;
    	}
    	.header p{
    		line-height: 40px;
    		font-size: 20px;
    		margin-left: -8px;
    		color: white;
    	}
    	.user1{
    		font-size: 16px;
    	}
    </style>
</head>
<body>

	<div>
		<div class="header">
			<p s>入会申请表</p>
		</div>
		<div class="user1" style="width: 480px;margin:0 auto;">
			<jsp:useBean id="DBHelper" scope="page" class="util.DBHelper" />
			<table class="layui-table" width="300px;">
				<tr>
					<td colspan="2" style="text-align: center;background-color: #ccc;"><p style="margin-left: -3px;">用户基础信息</p></td>
				</tr>
				<tr>
					<td width="150px;">姓名</td>
					<%
						String name=DBHelper.SelectDate("Table_usersinfo","username",DBHelper.SelectDate("Table_users1","ID",request.getParameter("p"),"username"),"name");
					%>
					<td width="150px;"><%=name%></td>
				</tr>
				<tr>
					<td >性别</td>
					<td><%=DBHelper.SelectDate("Table_usersinfo","username",DBHelper.SelectDate("Table_users1","ID",request.getParameter("p"),"username"),"sex")%></td>
				</tr>
				<tr>
					<td >出生日期</td>
					<td><%=DBHelper.SelectDate("Table_usersinfo","username",DBHelper.SelectDate("Table_users1","ID",request.getParameter("p"),"username"),"birthday")%></td>
				</tr>
				<tr>
					<td >家庭住址</td>
					<td><%=DBHelper.SelectDate("Table_usersinfo","username",DBHelper.SelectDate("Table_users1","ID",request.getParameter("p"),"username"),"address")%></td>
				</tr>
				<tr>
					<td >联系方式</td>
					<td><%=DBHelper.SelectDate("Table_usersinfo","username",DBHelper.SelectDate("Table_users1","ID",request.getParameter("p"),"username"),"phone")%></td>
				</tr>

				<tr>
					<td >推荐人</td>
					<%
						String refer=DBHelper.SelectDate("Table_usersinfo","username",DBHelper.SelectDate("Table_users1","ID",request.getParameter("p"),"username"),"referrer");
					%>
					<td><%=refer%></td>
				</tr>

				<tr>
					<td>申请内容</td>
					<td><%=DBHelper.SelectDate("Table_usersinfo","username",DBHelper.SelectDate("Table_users1","ID",request.getParameter("p"),"username"),"branch")%>,<%=DBHelper.SelectDate("Table_usersinfo","username",DBHelper.SelectDate("Table_users1","ID",request.getParameter("p"),"username"),"community")%></td>
				</tr>
			</table>
			<table class="layui-table" width="300px;">
				<%

					if(refer==null||refer.isEmpty())
					{
				%>
				<tr>
					<td>该用户没有推荐人</td>

				</tr>
				<%
				}else if(!DBHelper.ExistInTable_referrer(name,refer))
				{
				%>
				<tr>
					<td height="400px;" style="text-align: center;
    font-size: 22px;">未找到相符的推荐表</td>

				</tr>
				<%
					}else{
				%>

				<tr>
					<td colspan="2" style="text-align: center;background-color: #ccc;"><p style="margin-left: -3px;">推荐人基础信息</p></td>
				</tr>
				<tr>
					<td width="150px;">推荐人</td>
					<td width="150px;"><%out.println(refer);%></td>
				</tr>
				<tr>
					<td>单位</td>
					<td><%=DBHelper.SearchInTable_referrer(name,refer,"company")%></td>
				</tr>
				<tr>
					<td >电话</td>
					<td><%=DBHelper.SearchInTable_referrer(name,refer,"phone")%></td>
				</tr>
				<tr>
					<td >被推荐人</td>
					<td><%=DBHelper.SearchInTable_referrer(name,refer,"recommended")%></td>
				</tr>
				<tr>
					<td >职称</td>
					<td><%=DBHelper.SearchInTable_referrer(name,refer,"title")%></td>
				</tr>
				<tr>
					<td >职务</td>
					<td><%=DBHelper.SearchInTable_referrer(name,refer,"position")%></td>
				</tr>
				<tr>
					<td >邮箱</td>
					<td><%=DBHelper.SearchInTable_referrer(name,refer,"email")%></td>
				</tr>
				<tr>
					<td>推荐原因</td>
					<td style="height: 100px;"><%=DBHelper.SearchInTable_referrer(name,refer,"reason")%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>

</body>
</html>