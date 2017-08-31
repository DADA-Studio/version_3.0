<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<%@page import="util.FormConnector"%>
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
	        		<h3>身份管理</h3>
	        		<div class="content-main" style="position: relative;">
	        			<div class="shenfen-form"   style="padding-left: 68px;padding-top: 40px;">
	        				<form action="admin-shenfen_deal.jsp">
	        					<div style="display: inline-block;">
	        						<label for="name" style="display: inline-block;font-size: 18px;padding-top: 2px;vertical-align: top;padding-right: 12px;">
	        							姓名:
	        						</label>
	        						<input type="text" name="name" id="name" style="display: inline-block;height: 25px;" required="required">
	        					</div>
	        					<div style="display: inline-block;padding-left: 10px;">
	        						<input type="submit" class="layui-btn layui-btn-primary layui-btn-small" style="width: 80px;" value="查询">
	        					</div>
	        				</form>
	        			</div>


	        			<div style="padding-bottom: 10px;padding-top: 20px;">
							<%

								FormConnector ed=new FormConnector();
								int pageSize=5;//每页显示的记录
								ed.openConn();
								int totalpages=ed.getTotalPage(pageSize,"Table_users1 where status = '待审核'"); //最大页数
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
								List list;
								if(session.getAttribute("search_name")==null)
								{
									list= ed.getUsersinfoAllempByPage(pageSize,pageIndex,"null");  //返回特定页数的数据
							%>
	        			<table  class="layui-table" style="width: 700px;margin:0 auto;">
							<tr style="height: 40px;background-color: #C9C9C9">
								<th style="position: relative;width: 40px;text-align: center;"><input id="checkbox-1" type="checkbox" style="position: absolute;top: 13px;left: 14px;"><p style="margin-left: 10px;">全选</p></th>
								<th style="width: 50px;">编号</th>
								<th width="120px">姓名</th>
								<th style="width: 60px;">申请信息和推荐表</th>
							</tr>
							<%
								Map map=null;
								for(int i=0;i<list.size();i++){
									map=(Map)list.get(i);
							%>
							<tr>
								<td><input type="checkbox"></td>
								<td><%=map.get("ID") %></td>
								<td width="120px"><%=map.get("name") %></td>
								<td style="text-align: center;"><a href="#" class="layer-open3">查看</a></td>
							</tr>
							<% }%>
						</table>
							<table width="700" height="25" border="1" align="center"  style="border:1px solid #e2e2e2;border-top:none;">
								<tr>
									<td colspan="1">
										<div align="center">
											<div align="right">
												共<%=totalpages%>页 每页5条 当前第<%=pageIndex%>页
												<a href="admin-shenfen.jsp?o=6&pageIndex=1">首页</a>
												<a href="admin-shenfen.jsp?o=6&pageIndex=<%=pageIndex-1 %>">上一页</a>
												<a href="admin-shenfen.jsp?o=6&pageIndex=<%=pageIndex+1 %>">下一页</a>
												<a href="admin-shenfen.jsp?o=6&pageIndex=<%=totalpages%>">尾页</a>
											</div>
										</div>
									</td>
								</tr>
							</table>
							<%
								}
								else
								{
									list= ed.getUsersinfoAllempByPage(pageSize,pageIndex,(String)session.getAttribute("search_name"));  //返回特定页数的数据
							%>
	        			</div>
						<table  class="layui-table" style="width: 700px;margin:0 auto;">
							<tr style="height: 40px;background-color: #C9C9C9">
								<th style="position: relative;width: 40px;text-align: center;"><input id="checkbox-1" type="checkbox" style="position: absolute;top: 13px;left: 14px;"><p style="margin-left: 10px;">全选</p></th>
								<th style="width: 50px;">编号</th>
								<th width="120px">姓名</th>
								<th style="width: 60px;">申请信息和推荐表</th>
							</tr>
							<%
								Map map=null;
								for(int i=0;i<list.size();i++){
									map=(Map)list.get(i);
							%>
							<tr>
								<td><input type="checkbox"></td>
								<td><%=map.get("ID") %></td>
								<td width="120px"><%=map.get("name") %></td>
								<td style="text-align: center;"><a href="#" class="layer-open3">查看</a></td>
							</tr>
							<%
								}
									session.removeAttribute("search_name");%>
						</table>
						<%}%>
	        			<div style="padding-left: 68px;">
	        				<a id="pass" href="#" class="layui-btn" style="width: 120px;">通过审批</a>
	        				<a id="false" href="#" class="layui-btn" style="width: 120px;">拒绝审批</a>
	        			</div>
	        		</div>
	        	</div>
	        </div>
			<div class="footer">
        		<p>软工导论课设@软院小分队</p>
   		    </div>	
	    </div>
	    <script src="js/jquery.js"></script>
	    <script >
	    	$('.layui-table tr th input').on('click',function(){
	    		  var state = $("#checkbox-1").prop('checked');
          		  $('input[type="checkbox"]').prop('checked',state);
          		  $('#checkbox-1').prop('checked',state);
	    	});


            $("#pass").on("click",function(){
                // alert("aa");
                $('input[type="checkbox"]').each(function(index){
                    if(index!=0){
                        if($('input[type="checkbox"]').eq(index).prop('checked')){
                            // alert(index);
                            $p=$('input[type="checkbox"]').eq(index).parent().next("td");
                            var k=$p.html();
                            $.post("server.jsp?action=shenfen1",{id:k},function (res) {
								if("ok"==res){
                                    $('input[type="checkbox"]').each(function(index1){
                                     	if($('input[type="checkbox"]').eq(index1).parent().next('td').html()==k){
                                            $('input[type="checkbox"]').eq(index1).parent().parent().remove();
										}
                                    })
								}else{
                                    alert("数据库连接失败");
								}
                            })

                        }
                    }
                });
            })

            $("#false").on("click",function(){
                // alert("aa");.
				var i=0;
                $('input[type="checkbox"]').each(function(index){
                    if(index!=0){
                        if($('input[type="checkbox"]').eq(index).prop('checked')){
//                             alert(index);
                            $p=$('input[type="checkbox"]').eq(index).parent().next("td");
                          var k=$p.html();
                            $.post("server.jsp?action=shenfen2",{id:k},function (res) {
                                if("ok"==res){
                                    $('input[type="checkbox"]').each(function(index1){
                                        if($('input[type="checkbox"]').eq(index1).parent().next('td').html()==k){
                                            $('input[type="checkbox"]').eq(index1).parent().parent().remove();
                                        }
                                    })
                                }else{
                                    alert("数据库连接失败");
                                }
                            })

                        }
                    }
                });
            })


		</script>
</body>
<script type="text/javascript">
 	layui.use('layer', function(){
  		var layer = layui.layer;
	  	$('.layer-open3').on('click',function(){

//	  	    	$(this).parent().parent().find("td:eq(1)").css("background-color","red");
            $p=$(this).parent().parent().find("td:eq(1)").html();
	  			layer.open({
	  				type:2,
	  				title:false,
	  				shade:0.3,
	  				shadeClose:true,
	  				area:['600px','900px'],
	  				anim:4,
	  				content:["window/window1.jsp?p="+$p+""],
	  			})
  		})
	  });
</script>
</html>