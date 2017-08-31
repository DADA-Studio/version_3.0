<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>能力规范文稿管理系统</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery.js"></script>
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
	        		<h3>规范信息</h3>
	        		<div class="content-main" style="position: relative;">
						<form action="login-guifanwrite_deal.jsp" class="layui-form" style="width: 730px;margin: 0 auto;padding-top: 20px;">
							<div style="margin-top: 10px;">
								<label  for="title" style="font-size: 16px;">规范名称：</label>
								<div style="margin-top: 10px;width: 700px;">
									 <input type="text" name="title" id="title" placeholder="请输入标题" autocomplete="off" class="layui-input" style="font-size: 16px;">
								</div>
							</div>
							<div style="margin-top:  30px;">
								<label  for="content" style="font-size: 16px;vertical-align: top;padding-top: 10px;">规范内容：</label>
								<div  style="background-color: white;margin-top: 10px;width: 700px;">
									<textarea placeholder="请输入内容" name="content"   class="layui-textarea" id="content"   style="resize: none;height: 190px;font-size: 16px;"></textarea>
								</div>
							</div>
							<div style="margin-top: 15px;" class="form-btn">
								<div style="float: left;margin-top: -10px;">
									<input type="checkbox"><span style="height: 40px;line-height: 40px;margin-left: 5px;">我已阅读<a href="#" style="color: red">规范建议</a></span>
								</div>
								<div style="float: right;margin-right: 32px;display: inline-block;">
									<input type="button" name="submit" value="打印" class="layui-btn" onclick="window.print()">

									<input type="submit" name="submit" value="提交" class="layui-btn" onclick="return panduan1()">
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
			  var index = layedit.build('content');
			  
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


			function panduan1() {
			    if($('input[type="checkbox"]').prop("checked")){
			       layer.msg("规范编辑提交成功");
			   }else{
			      layer.msg("请同意规范编辑建议",function () {});
			        return false;
			             }
			    }


		</script>
</body>
</html>