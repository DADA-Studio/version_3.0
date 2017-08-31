<%@ page contentType="text/html;charset=UTF-8" import="java.util.*"  language="java" %>
<%@ page import="util.DBHelper" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>能力规范文稿管理系统</title>
	<link rel="stylesheet" href="layui/css/layui.css">
	<script src="layui/layui.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/jQuery.print.js"></script>


	<style type="text/css">
		.header-wrap{
			width:100%;
			height: 50px;
			padding-left: 5px;
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
			display: inline-block;
			float: left;

		}
		.content-right{
			width: 840px;
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
		.layui-form label{
			display: inline-block;
		}
		.layui-form div>div{
			display: inline-block;
		}
		.layui-layedit-tool{
			width: 600px;
		}
		.layui-layedit-iframe{
			width: 600px;
			height: 266px;
		}

		.form-btn div{
			display: inline-block;
		}

		.layui-form-checkbox {
			height: 16px;
			line-height: 16px;
			margin-right: 0px;
			margin-top: -2px;
			padding-right: 16px;
		}
		.layui-form-checkbox i {
			width: 25px;
		}
		.layui-form-checkbox{
			margin-left: 84px;
		}

		.content-right-bottom{
			width: 838px;
			border-top:1px solid #ccc;

			margin-top: 150px;
		}
		/*footer*/
		.footer{
			width: 100%;
			float: left;
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
			<h3>提案编制</h3>
			<div class="content-main">
				<form action="login-tian_deal.jsp" class="layui-form" style="width: 730px;margin: 0 auto;padding-top: 20px;">
					<div style="margin-top: 10px;">
						<label  for="title" style="font-size: 16px;">提案名称：</label>
						<div style="margin-top: 10px;width: 611px;">

							<% String ID=request.getParameter("id");
								if(ID==null){%>
							<input type="text" name="title" required="required" id="title" placeholder="请输入标题" autocomplete="off" class="layui-input" style="font-size: 16px;">
							<%
							}
							else
							{%>
							<input type="text" name="title" required="required" id="title" placeholder="请输入标题" autocomplete="off" value="<%=DBHelper.SelectDate("Table_caogao","ID",ID,"name")%>" class="layui-input" style="font-size: 16px;">
							<%}%>
						</div>
					</div>
					<div style="margin-top:  30px;">
						<label  for="content" style="font-size: 16px;vertical-align: top;padding-top: 10px;">提案内容：</label>
						<div  style="background-color: white;margin-top: 10px;width: 600px;">
							<%if(request.getParameter("id")==null){%>
							<textarea placeholder="请输入内容" name="content"   class="layui-textarea" id="content"   style="resize: none;height: 190px;font-size: 16px;"></textarea>
							<%}else{%>
							<textarea placeholder="请输入内容" name="content"   class="layui-textarea" id="content"   style="resize: none;height: 190px;font-size: 16px;"><%=DBHelper.SelectDate("Table_caogao","ID",ID,"essay")%></textarea>
							<%}%>

						</div>
					</div>
					<div style="margin-top: 15px;" class="form-btn">
						<div style="float: left;">
							<input type="checkbox"><span style="height: 40px;line-height: 40px;margin-left: 5px;">我已阅读<a href="#" style="color: red">提案建议</a></span>
						</div>
						<div style="float: right;margin-right: 32px;display: inline-block;">
							<a class="layui-btn" onclick="window.print()">打印</a>
							<input type="submit" name="reserve" value="保存" class="layui-btn">
							<input type="submit" name="submit" value="提交" class="layui-btn" onclick="return panduan();">
						</div>
					</div>
				</form>
				<div class="content-right-bottom" style="padding-top: 20px;">
					<p style="text-align: center;font-size: 20px;margin-bottom: 10px;color: #999;">个人所有提案</p>
					<%
						DBHelper ed=new DBHelper();
						List list= ed.Select_Table_draftinfo((String)session.getAttribute("name"));//返回特定页数的数据
					%>
					<table  class="layui-table table-5" style="width: 750px;margin: 0 auto;">
						<tr style="height: 40px;background-color: #C9C9C9">
							<th style="position: relative;width: 40px;text-align: center;"><input id="checkbox-1" type="checkbox" style="position: absolute;top: 13px;left: 14px;"><p style="margin-left: 10px;">全选</p></th>
							<th style="width: 50px;">提案ID</th>
							<th width="120px">提案名称</th>
							<th style="width: 60px;">提交时间</th>
							<th style="width: 50px;">提案状态</th>
						</tr>
						<%
						Map map=null;
						for(int i=0;i<list.size();i++){
						map=(Map)list.get(i);
						%>
						<tr>
							<td><input type="checkbox"></td>
							<td><%=map.get("ID")%></td>
							<td width="120px"><a href="login-tian-content.jsp?o=3&id=<%=map.get("ID")%>"><%=map.get("name")%></a></td>
							<td><%=map.get("submittime")%></td>
							<td><%=map.get("state")%></td>
						</tr>
						<% }%>
					</table>
					<div style="margin-top: 20px;float: right;margin-right: 50px;">
						<a href="#" class="layui-btn layui-btn-nomal"  style="width: 150px;" onclick="$.print('.table-5')">打印</a>
						<a href="javascript:0;" class="layui-btn layui-btn-primary btn-remove"   style="width: 100px;">撤销</a>
					</div>


					<div style="width:100%;height: 300px;border-top: 1px solid #ccc;margin:80px auto;">
						<p style="text-align: center;font-size: 20px;margin-bottom: 20px;color: #999;margin-top: 20px;">个人提案草稿</p>
						<table class="layui-table" style="width: 750px;margin: 0 auto;">
							<thead>
							<tr>
								<th>提案ID</th>
								<th>提案名称</th>
								<th>保存时间</th>
								<th>提案状态</th>
								<th>恢复操作</th>
								<th>删除操作</th>
							</tr>
							</thead>
							<%
								DBHelper ed1=new DBHelper();
								List list1= ed1.Select_Table_caogao((String)session.getAttribute("name"));//返回特定页数的数据
							%>
							<tbody>
							<%
								Map map1=null;
								for(int i=0;i<list1.size();i++){
									map1=(Map)list1.get(i);
							%>
							<tr>
								<td><%=map1.get("ID")%></td>
								<td><%=map1.get("name")%></td>
								<td><%=map1.get("submittime")%></td>
								<td><%=map1.get("state")%></td>
								<td><a href="login-tian.jsp?o=3&id=<%=map1.get("ID")%>">恢复草稿内容</a></td>
								<td><a href="login-delete.jsp?o=3&id=<%=map1.get("ID")%>">删除草稿内容</a></td>
							</tr>
								<% }%>
						</table>
					</div>
				</div>

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


</script>


<script >
    $('.layui-table tr th input').on('click',function(){
        var state = $("#checkbox-1").prop('checked');
        $('input[type="checkbox"]').prop('checked',state);
        $('#checkbox-1').prop('checked',state);
    });
    $('.btn-remove').on('click',function(){
        var state=false;
        $('input[type="checkbox"]').prop('checked',state);
    })

</script>
<script>
    function panduan(){
        var k=$('.table-5').find("tr").length-1;
        if($('input[type="checkbox"]').prop("checked")){
        }else {
            layer.msg("请勾选阅读建议",function () {});
            return false;
        }
        if(k>=3){
            layer.msg("抱歉，最多只能编辑三提案",function () {});
            return false;
        }else {
            layer.msg("提交成功",{icon:1});
        }

    }
</script>

</body>
</html>