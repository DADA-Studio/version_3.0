<%@ page contentType="text/html;charset=UTF-8" language="java" import="util.DBHelper" %>
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
            <h3>个人信息</h3>
            <div class="content-main" style="position: relative;">
                <%
                    if("待审核".equals(DBHelper.SelectDate("Table_users1","username",(String)session.getAttribute("username"),"status")))
                    {
                %>
                <img src="img/1.png" alt=""  style="position: absolute;top: 250px;left: 370px;">
                <%
                    }else if("未通过".equals(DBHelper.SelectDate("Table_users1","username",(String)session.getAttribute("username"),"status")))
                    {
                %>
                <img src="img/未通过.png" alt=""  style="position: absolute;top: 250px;left: 370px;">
                <%
                    }else if("通过".equals(DBHelper.SelectDate("Table_users1","username",(String)session.getAttribute("username"),"status"))){
                %>
                <img src="img/通过.png" alt=""  style="position: absolute;top: 250px;left: 370px;">
                <%
                    }
                %>
                <ul id="changeul">
                    <li>
                        <div>
                            <p>姓名</p>
                        </div>
                        <div>
                            <%
                                out.println( DBHelper.SelectDate("Table_usersinfo","username",(String) session.getAttribute("username"),"name") );
                            %>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p>性别</p>
                        </div>
                        <div>
                            <%
                                out.println( DBHelper.SelectDate("Table_usersinfo","username",(String) session.getAttribute("username"),"sex") );
                            %>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p>出生日期</p>
                        </div>
                        <div>
                            <%
                                out.println( DBHelper.SelectDate("Table_usersinfo","username",(String) session.getAttribute("username"),"birthday") );
                            %>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p>家庭住址</p>
                        </div>
                        <div>
                            <%
                                out.println( DBHelper.SelectDate("Table_usersinfo","username",(String) session.getAttribute("username"),"address") );
                            %>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p>联系方式</p>
                        </div>
                        <div>
                            <%
                                out.println( DBHelper.SelectDate("Table_usersinfo","username",(String) session.getAttribute("username"),"phone") );
                            %>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p>推荐人</p>
                        </div>
                        <div>
                            <%
                                out.println( DBHelper.SelectDate("Table_usersinfo","username",(String) session.getAttribute("username"),"referrer") );
                            %>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p>行分会</p>
                        </div>
                        <div>
                            <%
                                out.println( DBHelper.SelectDate("Table_usersinfo","username",(String) session.getAttribute("username"),"branch") );
                            %>
                        </div>
                    </li>
                    <li>
                        <div>
                            <p>专委会</p>
                        </div>
                        <div>
                            <%
                                out.println( DBHelper.SelectDate("Table_usersinfo","username",(String) session.getAttribute("username"),"community") );
                            %>
                        </div>
                    </li>
                </ul>
                <div style="margin-left: 150px;padding-top: 30px;">
                    <a href="login-index-change.jsp?o=1" class="layui-btn layui-btn-nomal"  style="width: 150px;">修改</a>
                    <a href="#" class="layui-btn layui-btn-nomal"  style="width: 150px;" onclick="jQuery('.content-right').print()">打印</a>
                    <a href="#" class="layui-btn layui-btn-nomal" id="layer-open2"   style="width: 150px;">会务修改</a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <p>软工导论课设@软院小分队</p>
    </div>
</div>

</body>
<script type="text/javascript">
    layui.use('layer', function(){
        var layer = layui.layer;
        $('#layer-open2').on('click',function(){
            layer.open({
                type:2,
                title:false,
                shade:0.3,
                shadeClose:true,
                area:['420px','300px'],
                anim:4,
                content:["window/window2.jsp","no"],
            })
        })
    });
</script>
</html>