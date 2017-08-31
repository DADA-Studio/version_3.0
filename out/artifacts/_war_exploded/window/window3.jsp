<%--
  Created by IntelliJ IDEA.
  User: 嘉睿
  Date: 2017/8/28
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
    <title>Document</title>
</head>
<body>

</body>
<script>

    layui.use('layer', function(){
        var layer = layui.layer;
        var index = parent.layer.getFrameIndex(window.name);
          alert("修改成功，等待验证");

            parent.location.reload();
//            layer.msg("修改成功，等待验证",{icon:1});
            parent.layer.close(index);
        });

</script>
</html>