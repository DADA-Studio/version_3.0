<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: 李普
  Date: 2017/8/22
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册账户</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/jquery.js"></script>
    <script src="layui/layui.js"></script>
    <style type="text/css">
        *{
            margin: 0px 0px;
        }
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
        /*注册*/
        .register{
            width: 1118px;
            border:1px solid #ccc;
            margin: 0 auto;
            border-top: none;
            padding-top: 40px;
            height: 770px;
        }
        .register-1{
            width: 516px;
            margin: 30px auto;
        }
        .register-1 h3{
            background-color: #cae5ca;
            border:1px solid #ccc;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 10px;
            font-size: 20px;
        }
        .register-1 form{
            border:1px solid #ccc;
            border-top: none;
            height: 400px;
        }

        .register form>div{
            padding-top: 30px;
            padding-left: 60px;
        }
        .register form label{
            font-size: 18px;
        }
        .register form input[type='text']{
            height: 20px;
            display: block;
            margin-top:10px;
            height: 30px;
            width: 80%;
            font-size: 18px;



        }
        .register form input[type='password']{
            height: 20px;
            display: block;
            margin-top:10px;
            height: 30px;
            width: 80%;
            font-size: 18px;
        }
        .input-btn{
            text-align: center;
            margin-left: -70px;
        }
        .input-btn input{
            width: 100px;
        }
        /*footer*/
        .footer{
            height: 50px;
            width: 1120px;
            margin: 0 auto;
            text-align: center;
        }
        .footer p{
            color: black;
            line-height: 50px;

        }
    </style>
</head>
<body>
<div class="header-wrap">
    <div class="header">
        <p>能力规范文稿管理系统</p>
    </div>
    <div class="register">
        <div class="register-1">
            <h3>账号注册</h3>
            <form action="register_deal.jsp" method="post"  >
                <div>
                    <label for="username" >账号:</label><br/>
                    <input type="text" id="username" name="username"required="required" onblur="return chongfu_name()" >

                </div>
                <div>
                    <label for="pw">密码:</label><br/>
                    <input type="password" id="pw" name="pw"required="required">
                </div>
                <div>
                    <label for="pw2">重复密码:</label><br/>
                    <input type="password"id="pw2"name="pw2"required="required" >
                </div>

                <div class="input-btn">
                    <input type="submit" value="注册" class="layui-btn layui-btn-nomal" onclick="return register()"/>
                    <input type="reset" value="重置" class="layui-btn layui-btn-primary">
                </d1iv>
            </form>
        </div>

    </div>
    <div class="footer">
        <p>软工导论课设@软院小分队</p>
    </div>
</div>
</body>
<script>
    layui.use('layer',function () {
    })
        var index=1;
        function chongfu_name() {
            var p=$("#username").val();
            jQuery.trim(p);
            $.post("server.jsp?action=chongfuname",{username1:p},function (res) {
                if("ok"==res){
                    layer.tips('该账号可以使用', '#username', {
                        tips: [2, '#5FB878'],
                        time: 20000
                    });
                    index=1;
                    return false;
                }else {
                    layer.tips('该账号已被注册,请重新输入', '#username', {
                        tips: [2, '#3595CC'],
                        time: 20000
                    });
                    index=2;
                }
            })

        }

        function register() {
            if(index==2){
                layer.msg("请查看账号是否填写正确",function () {
                    
                })
                return false;

            }else{
                return true;
            }

        }

</script>
</html>
