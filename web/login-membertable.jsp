<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
			height: 620px;
			border:1px solid #ccc;
			border-top: none;
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
		.layui-form-checkbox {
		    height: 16px;
		    line-height: 16px;
		    margin-top: -2px;
		    padding-right: 16px;
		}
		.layui-form-checkbox i {
		    width: 25px;
		}
		.layui-form-checkbox{
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
		.layui-form label{
			width: 100px;
		}
		.table-member tr{
			height: 50px;
		}
		.table-member td{
			font-size: 18px;
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
	        		<h3>会员推荐表</h3>
	        		<div class="content-main" style="position: relative;">
						<form action="login-membertable_deal.jsp" class="layui-form" style="width: 730px;margin: 0 auto;padding-top: 20px;">
							<table class="table-member">
								<tr>
									<td width="80px;" style="text-align: center;">推荐人</td>
									<td><input type="text" id="referrer" name="referrer"></td>
									<td width="80px;" style="padding-left: 60px;text-align: center;">职称</td>
									<td><input type="text" id="title" name="title"></td>
								</tr>
								<tr>
									<td width="80px;" style="text-align: center;">单位</td>
									<td><input type="text" id="company" name="company"></td>
									<td width="80px;" style="padding-left: 60px;text-align: center;">职务</td>
									<td><input type="text" id="position" name="position"></td>
								</tr>
								<tr>
									<td width="80px;" style="text-align: center;">电话</td>
									<td><input type="text" id="phone" name="phone"></td>
									<td width="80px;" style="padding-left: 60px;text-align: center;">邮箱</td>
									<td><input type="text" id="email" name="email"></td>
								</tr>
								<tr >
									<td width="80px;" style="text-align: center;">被推荐人</td>
									<td colspan="3"><input type="text" id="recommended" name="recommended"></td>
								</tr>
								<tr>
									<td width="80px;" style="text-align: center;vertical-align: top;">推荐原因</td>
									<td colspan="3"><textarea placeholder="请输入评论" name="reason"   class="layui-textarea" id="reason" style="height: 70px;"></textarea></td>
								</tr>
							</table>
							
							<div style="margin-top: 15px;" class="form-btn">
								<div style="float: right;margin-right: 65px;display: inline-block;">
									<input type="submit" name="submit" value="推荐" class="layui-btn" style="width: 120px;">
								</div>
							</div>
						</form>
	        		</div>
	        	</div>
	        </div>
			<div class="footer">
        		<p>软工导论课设@软院小分队</p>
   		    </div>	
	    </div>
		<script>
			layui.use('layedit', function(){
			  var layedit = layui.layedit
			  ,$ = layui.jquery;
			  
			  //构建一个默认的编辑器
			  var index = layedit.build('reason');
			  
			  //编辑器外部操作
			  var active = {
			    content: function(){
			      alert(layedit.getContent(index)); //获取编辑器内容
			    }
			    ,text: function(){
			      alert(layedit.getText(index)); //获取编辑器纯文本内容
			    }
			    ,selection: function(){
			      alert(layedit.getSelection(index));
			    }
			  };
			  
			  
			});


		</script>
</body>
</html>