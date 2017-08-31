<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<%@page import="util.FormConnector"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>能力规范文稿管理系统</title>
	<script src="js/jquery.js"></script>
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
		.article{
			margin-left: 100px;
			padding-top: 20px;
			width: 700px;margin: 0 auto;
		}
		.article ul li{
			border:1px solid #ccc;
		}
		.article ul li>div{
			display: inline-block;
			font-size: 16px;
		}
		.article ul li>div:first-child{
			width: 220px;
		}
		.layui-table td, .layui-table th{
		}
		.layui-layedit{
			height: 120px;
		}
		.input-content{
			margin-top: 50px;
		}
		.forum{

			margin-top: 100px;
			border-top:1px solid #ccc;
		}
		.forum-main{
			width: 700px;

			margin: 15px auto;
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
			<p class="user-name">
				<%
					out.println((String)session.getAttribute("name"));
				%>
			</p>
			<p>!</p>
			<a href="logout.jsp" class="layui-btn layui-btn-nomal">注销</a>
		</div>
	</div>
	<div class="content">
		<div class="content-left">
			<%@include file="include-left-group.jsp"%>
		</div>
		<div class="content-right">
			<h3>提案详情</h3>
			<div class="content-main">
				<div class="article">
					<table class="layui-table" >
						<tr>
							<%
								String id = request.getParameter("id");
								if(id==null)
								{
									id = (String)session.getAttribute("page_id");
								}
								else
								{
									session.setAttribute("page_id",id);
									id =(String)session.getAttribute("page_id");
								}
							%>
							<td width="130px;">提案ID</td>
							<td width="150px;" >
								<p id="tian-id" ><%out.println(id);%></p>
							</td>
							<td width="100px;">提案名称</td>
							<td width="150px;">
								<%
									out.println( DBHelper.SelectDate("Table_draft","ID",id,"name") );
								%>
							</td>
						</tr>
						<tr>
							<td>提案作者</td>
							<td>
								<%
									out.println(DBHelper.SelectDate("Table_draft","ID",id,"author") );
								%>
							</td>
							<td>截止日期</td>
							<td>
								<%
									out.println( DBHelper.SelectDate("Table_draft","ID",id,"deadline") );
								%></td>
						</tr>
						<tr>
							<td style="vertical-align: top;">提案内容</td>
							<td colspan="3"  style="vertical-align: top;min-height: 300px;height: 200px;">
								<%
									out.println( DBHelper.SelectDate("Table_draft","ID",id,"essay") );
								%>
							</td>
						</tr>
					</table>

					<div class="input-content" >

						<div>
							<textarea placeholder="请输入评论" name="content"   class="layui-textarea" id="content" style="height: 70px;"></textarea>
						</div>
						<div style="margin-top: 20px;">
							<input  id="input"  type="button" class="layui-btn" style="float: right;width: 120px;" value="提交评论" />
							<div style="display: inline-block;float: right;margin-top: 10px;margin-right: 50px;">
								<input type="radio" name="1" id="1" value="0" ><span style="font-size: 16px;padding-left: 5px;">附议</span>
								<input type="radio" name="1" id="2" value="1"><span style="font-size: 16px;padding-left: 5px;">反对</span>
							</div>
						</div>
					</div>
				</div>
				<div class="forum">
					<h2 style="text-align: center;margin-top: 10px;font-size: 22px;color: #999;">评论区</h2>
					<div class="forum-main">
						<%
							FormConnector ed=new FormConnector();
							int pageSize=8;//每页显示的记录
							ed.openConn();
							int totalpages=ed.getTotalPage(pageSize,("Table_common where essayID = "+id)); //最大页数
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
							List list= ed.getCommonAllempByPage(pageSize,pageIndex,id);  //返回特定页数的数据
							ed.conn.close();
						%>
						<table class="layui-table"  style="margin: 0 auto;">
							<tr class="table-change">
								<th width="120px;">评论人</th>
								<th width="400px;">评论内容</th>
								<th>评论时间</th>
							</tr>
							<%
								Map map=null;
								for(int i=0;i<list.size();i++){
									map=(Map)list.get(i);
							%>
							<tr>
								<td><%=map.get("name") %></td>
								<td><%=map.get("essay") %></td>
								<td><%=map.get("submittime") %></td>
							</tr>
							<% }%>
						</table>
						<table width="700" height="25" border="1" align="center"  style="border:1px solid #e2e2e2;border-top:none;">
							<tr>
								<td colspan="1">
									<div align="center">
										<div align="right">
											共<%=totalpages%>页 每页8条 当前第<%=pageIndex%>页
											<a href="login-content.jsp?o=2&pageIndex=1">首页</a>
											<a href="login-content.jsp?o=2&pageIndex=<%=pageIndex-1 %>">上一页</a>
											<a href="login-content.jsp?o=2&pageIndex=<%=pageIndex+1 %>">下一页</a>
											<a href="login-content.jsp?o=2&pageIndex=<%=totalpages%>">尾页</a>
										</div>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer" style="float: left;width: 100%;">
		<p>软工导论课设@软院小分队</p>
	</div>
</div>
<script>

    layui.use('layedit', function(){
        var layedit = layui.layedit
            ,$ = layui.jquery,layer=layui.layer;

        //构建一个默认的编辑器
        var index = layedit.build('content',{height:80});


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


        $("#input").on("click",function () {
//                    alert(layedit.getContent(index));
            var addRow = $("<tr></tr>");

            var text_content={};
            if($('input[type="radio"]').eq(0).prop("checked")){
                text_content['id']='1';
            }else if($('input[type="radio"]').eq(1).prop("checked")){
                text_content['id']=2;
            }else{
                layer.msg("请选择您的建议",function () {});
                return false;
            }
            text_content['article']=layedit.getContent(index);
            var  mydate =currentTime();
            text_content['day']=mydate;
            //alert($("#tian-id").html());
            var ti=$('#tian-id').html();
            var c=parseInt(ti);

            text_content['tianid']=c;




            $.post("server.jsp?action=addcommon",text_content,function(res) {
                var Row0 = $("<td >"+$(".user-name").text()+"</td>");
                var Row1 = $("<td >"+layedit.getContent(index)+"</td>");
                var Row2 = $("<td >"+mydate+"</td>");
                addRow.append(Row0);
                addRow.append(Row1);
                addRow.append(Row2);
                $(".table-change").after(addRow);
                index = layedit.build("content",{height:80});
            })

        })
    });

    function currentTime() {
        var d = new Date(), str = '';
        str += d.getFullYear() + '-';
        str += d.getMonth() + 1 + '-';
        str += d.getDate() ;
        return str;
    }


</script>

</body>
</html>