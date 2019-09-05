<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../static/layui/css/layui.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "nav3.ftl">
    <#include "left3.ftl">
    <div class="layui-body">
        <a href="/student/Page6">操作成功，返回</>
    </div>
</div>
<script src="../static/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>