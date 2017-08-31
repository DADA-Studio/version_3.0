<%--
  Created by IntelliJ IDEA.
  User: 李普
  Date: 2017/8/23
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>入会申请</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src='layui/layui.js'></script>
    <script src="js/jquery.js"></script>
    <style type="text/css">
        *{
            margin: 0px 0px;
        }
        .header-wrap{
            width:100%;
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
            height: 850px;
        }
        .register-1{
            width: 700px;
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
            height: 700px;
        }

        .register form>div{
            padding-top: 30px;
            padding-left: 75px;
        }

        .register form label{
            font-size: 18px;
            width: 50px;
        }
        .input-text{
            margin-left: 20px;
            height: 20px;
            margin-top:10px;
            height: 30px;
            font-size: 18px;
            width: 320px;
            padding-left: 10px;
        }
        .register-1 form input[type='text']{
            border:1px solid #ccc;
        }

        /*下拉菜单*/
        .layui-input{
            margin-left: 20px;
            width: 330px;
        }
        .layui-anim{
            margin-left: 20px;
            width: 330px;

        }
        .layui-select-title{
            width: 330px;
        }
        .layui-edge{
            position: absolute;
            right: -240px;
        }
        /**/

        .register-1 form div>div{
            display: inline-block;
            width: 100px;
            position: relative;

        }

        .register-1 form div>div label{
            position: absolute;
            width: 80px;
            right: 0;
            top: -18px;
            font-size: 18px;
            text-align: right;
        }

        .input-btn{
            text-align: center;
            margin-left: -70px;
        }
        .input-btn input{
            width: 100px;
        }

        select{
            border: 1px solid #ccc;
            margin-left: 20px;
            height: 20px;
            /* margin-top: 10px; */
            height: 30px;
            font-size: 18px;
            /* width: 320px; */
            padding-left: 10px;
            width: 331px;
            height: 30px;
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
            <h3>入会申请</h3>
            <form action="applymember_deal.jsp" method="get"  >
                <div>
                    <div >
                        <label for="name" >姓名</label>
                    </div>
                    <input type="text" id="name" name="name"  class="input-text"required="required">
                    <div style="color: red">*</div>
                </div>
                <div>
                    <div >
                        <label for="sex">性别</label>
                    </div>
                    <select name="sex" id="sex">
                        <option value="1">男</option>
                        <option value="2">女</option>
                        <option value="3">其他</option>
                    </select>
                    <div style="color: red">*</div>
                </div>
                <div>
                    <div >
                        <label for="birthday">出生日期</label>
                    </div>
                    <input required="required" type="text"id="birthday" name="birthday" class="input-text" onclick="layui.laydate({elem: this, festival: true})">
                    <div style="color: red">*</div>
                </div>
                <div>
                    <div >
                        <script>
                        layui.use('laydate', function(){
                            var laydate = layui.laydate;
                        });
                        </script>
                        <label for="address">家庭住址</label>
                    </div>
                    <input type="text" id="address" name="address" class="input-text"  >
                </div>
                <div>
                    <div >
                        <label for="phone">联系方式</label>
                    </div>
                    <input type="text" id="phone" name="phone"class="input-text"required="required">
                    <div style="color: red">*</div>
                </div>
                <div>
                    <div >
                        <label for="referrer">推荐人</label>
                    </div>
                    <input type="text" id="referrer" name="referrer"class="input-text">
                </div>
                <div>
                    <div>
                        <label for="">行业分会</label>
                    </div>
                    <select id="hangfenhui" lay-ignore name="hangfenhui">
                        <option value="0">----请选择行分会---- </option>
                        <option value="1">软件学院行分会</option>
                        <option value="2">数理学院行分会</option>
                        <option value="3">计算机学院行分会</option>
                    </select>

                </div>

                <div class="layui-form-item">
                    <div >
                        <label for="">专委会</label>
                    </div>
                    <div>
                        <select class="zhuanweihui" lay-ignore name="zhuanweihui1" disabled="disabled">
                            <option value="0">----请选择专委会----</option>
                        </select>
                        <select class="zhuanweihui" lay-ignore name="zhuanweihui">
                            <option value="1">软件工程专委会</option>
                            <option value="2">数字媒体技术专委会</option>
                            <option value="3">网络工程专委会</option>
                        </select>
                        <select class="zhuanweihui" lay-ignore name="zhuanweihui" >
                            <option value="4">物理学专委会</option>
                            <option value="5">数学专委会</option>
                            <option value="6">统计学专委会</option>
                        </select>
                        <select class="zhuanweihui" lay-ignore name="zhuanweihui" >
                            <option value="7">计算机科学专委会</option>
                            <option value="8">物联网专委会</option>
                            <option value="9">信息安全专委会</option>
                        </select>
                    </div>
                </div>
                </div>

                <div class="input-btn" style="margin-top: -128px;">
                    <input type="submit" value="提交申请" class="layui-btn layui-btn-nomal" onclick="return check()">
                    <input type="reset" value="重置" class="layui-btn layui-btn-primary">
                </div>
            </form>
        </div>

    </div>
    <div class="footer" >
        <p>软工导论课设@软院小分队</p>
    </div>
</div>
</body>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

    });

</script>
<script>
    layui.use('element',function(){
        var element = layui.element();
    })
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#hangfenhui").change(function(){
            $("#hangfenhui option").each(function(i,o){
                if($(this).prop("selected"))
                {
                    $(".zhuanweihui").css("display","none");
                    $(".zhuanweihui").eq(i).show();
                    $(".zhuanweihui").eq(i).removeAttr("disabled");
                }
                if($(this).prop("selected")==0){
                    $(".zhuanweihui").eq(i).attr("disabled","disabled");
                }
            });
        });
        $("#hangfenhui").change();
    });


    function check(){
        if($("#hangfenhui option").eq(0).prop('selected')){
            layui.use('layer',function(){
                layer.msg("请选择行分会",{icon:2,shift:6},function(){});
            })
            return false;
        }else{
            return true;
        }
    }
</script>
</html>
