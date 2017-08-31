<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>修改行业</title>
	<link rel="stylesheet" href="../layui/css/layui.css">
	<script src="../layui/layui.js"></script>
	<script type="text/javascript" src="../js/jquery.js"></script>
	<style>
		*{
			padding: 0 0;
			margin:  0 0;
		}
		.layui-form{
			width: 308px;
			margin:30px auto;
		}
		.form-2 table tr{
			height: 50px;
		}
		.layui-form>div{
			width: 300px;
		}
		.layui-form div>div{
			display: inline-block;
		}
		.layui-form div>div{
		}
		.form-2{
			width: 378px;
			margin-top: 20px;
			padding-left: 40px;
		}
		.form-2 select{
			width: 216px;
		}
		.form-2 label{
			font-size: 18px;
		}
		select{
			text-align: center;
			border: 1px solid #ccc;
			margin-left: 20px;
			height: 20px;
			height: 30px;
			font-size: 18px;
			padding-left: 10px;
			width: 350px;
			height: 30px;
		}
	</style>
</head>
<body>
<div style="width: 420px;height: 40px;background-color: #5FB878;text-align: center;line-height: 40px;color: white;font-size: 16px;">
	<p>会务修改</p>
</div>
<div>
	<form action="/window2_deal.jsp" class="form-2">
		<table>
			<tr>
				<td width="100px;"><label for="">行业分会</label>	</td>
				<td>
					<select id="hangfenhui" lay-ignore name="hangfenhui">
						<option value="0">----请选择行分会---- </option>
						<option value="1">软件学院行分会</option>
						<option value="2">数理学院行分会</option>
						<option value="3">计算机学院行分会</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="">专委会</label></td>
				<td>
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
				</td>
			</tr>
		</table>
		<div style="margin-top:30px;text-align: center;margin-left: -18px;">
			<input type="submit" value="修改" class="layui-btn" style="width: 100px;">
			<input id="close" type="button" value="取消" class="layui-btn" style="width: 100px;">
		</div>
	</form>
</div>
</body>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        margin-top: 30px;

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
<script>
    layui.use('layer', function(){
        var layer = layui.layer;
        var index = parent.layer.getFrameIndex(window.name);
        $('#close').click(function(){
            parent.layer.close(index);
        });
    });
</script>
</html>