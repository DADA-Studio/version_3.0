<%@ page contentType="text/html;charset=UTF-8" import="java.util.*"  language="java" %>
<%@page import="util.FormConnector"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>能力规范文稿管理系统</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <style type="text/css">
        .header-wrap{
            width:100%;
            height: 50px;
        }

        /*头文件*/
        .header{
            width:1120px;
            margin:0 auto;
            background-color:#cae5ca;
            text-align:center;
            height: 130px;
        }
        .header p{
            font-size:30px;
            line-height: 130px;
        }
        /*登录*/
        .header-login{
        	text-align: right;
            height: 60px;
            width: 1118px;
            margin: 0 auto;
            border:1px solid #ccc;
        	margin-bottom: 20px;

        }
        .user-info{
        	line-height: 60px;
        	font-size: 18px;
        }
        .user-info a{
        	display: inline-block;
        	margin-right: 10px;
        }
        .user-info p{
        	display: inline-block;
        }
        .content{
        	width: 1118px;
        	margin: 0 auto;
        	border-top: none;
        }
        .content-left{
        	width: 260px;
        	height: 680px;
        	display: inline-block;
        }
        .content-right{
        	width: 840px;
        	height: 600px;
        	display: inline-block;
        	float: right;

        }
		.content-left a{
			display: block;
			border:1px solid #C9C9C9;
			height: 50px;
			line-height: 50px;
			font-size: 18px;
			padding-left: 25px;
		}
		.content-left a:hover{
			background-color:#5FB878; 
			color: white;
		}
		.left-a{
			border-top: none;
		}
		.active{
			background-color:#5FB878; 
			color: white;
		}
		.content-right h3{
			height: 40px;
			line-height: 40px;
			border:1px solid #ccc;
			font-size: 16px;
			padding-left: 15px;
		}
		.content-main{
			width: 838px;
			height: 600px;
			border:1px solid #ccc;
			border-top: none;
			padding-top: 20px;
		}
		.content-main ul{
			padding-top: 70px;
		}
		.content-main ul li{
			font-size: 20px;
			margin-bottom: 15px;
			margin-left: 150px;
		}
		.content-main li>div{
			display: inline-block;
		}
		.content-main li div:first-child{
			font-size: 18px;
			width: 150px;

		}
		

		.layui-table a:hover{
			color:#5FB878;
		}
        /*footer*/
        .footer{
            width: 1120px;
            margin: 0 auto;
        }
        .footer p{
            color: black;
            line-height: 50px;
            text-align: center;

        }
    </style>
</head>
<body>
	    <div class="header-wrap">
	        <div class="header">
	            <p>能力规范文稿管理系统</p>
	        </div>
	        <div class="header-login">
				<div class="user-info">
					<p>欢迎您</p>
					<%
					out.println((String)session.getAttribute("name"));
					%>
					<p>!</p>
					<a href="logout.jsp" class="layui-btn layui-btn-nomal">注销</a>
				</div>
	        </div>
	        <div class="content">
	        	<div class="content-left">
					<%@include file="include-left-group.jsp"%>
	        	</div>
	        	<div class="content-right">
	        		<h3>规范查看</h3>
	        		<div class="content-main" style="">
						<%
							FormConnector ed=new FormConnector();
							int pageSize=5;//每页显示的记录
							ed.openConn();
							int totalpages=ed.getTotalPage(pageSize,"Table_rule"); //最大页数
							String currentPage=request.getParameter("pageIndex"); //获得当前的页数，即第几页
							if(currentPage==null){
								currentPage="1";
							}
							int pageIndex=Integer.parseInt(currentPage);
							//添加逻辑判断，防止页数异常
							if(pageIndex<1){
								pageIndex=1;
							}else if(pageIndex>totalpages){
								pageIndex=totalpages;
							}
							List list= ed.getRuleAllempByPage(pageSize,pageIndex);  //返回特定页数的数据
							ed.conn.close();
						%>
						<table border='1' style="width: 730px;margin: 0px auto;" class="layui-table" lay-even>
                        <tr>
                            <td width="470px">规范公告</td>
                            <td>发布时间</td>
                        </tr>
							<%
								Map map=null;
								for(int i=0;i<list.size();i++){
									map=(Map)list.get(i);
							%>
                        <tr>
							<td><a href="login-guifancontent.jsp?o=4&id=<%=map.get("ID")%>"><%=map.get("name") %></a></td>
							<td><%=map.get("time") %></td>
						</tr>
							<% }%>
                    </table>
                    <table width="730" height="25" border="1" align="center"  style="border:1px solid #e2e2e2;border-top:none;">
				            <tr>
				                <td colspan="1">
				                    <div align="center">
				                        <div align="right">
											共<%=totalpages%>页 每页5条 当前第<%=pageIndex%>页
											<a href="login-guifan.jsp?o=4&pageIndex=1">首页</a>
											<a href="login-guifan.jsp?o=4&pageIndex=<%=pageIndex-1 %>">上一页</a>
											<a href="login-guifan.jsp?o=4&pageIndex=<%=pageIndex+1 %>">下一页</a>
											<a href="login-guifan.jsp?o=4&pageIndex=<%=totalpages%>">尾页</a>
				                        </div>
				                    </div>
				                </td>
				            </tr>
				        </table>
	        		</div>
	        	</div>
	        </div>
			<div class="footer">
        		<p>软工导论课设@软院小分队</p>
   		    </div>	
	    </div>

</body>
</html>