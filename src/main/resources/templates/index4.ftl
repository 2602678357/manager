<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../static/layui/css/layui.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <#include "nav3.ftl">
    <#include "left3.ftl">
    <div class="layui-body">

        <table class="table table-hover">
            <thead>
            <tr>
                <th>课程ID</th>
                <th>科目名称</th>
                <th colspan="3">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list list as li>
                <tr>
                    <td>${li.cid}</td>
                    <td>${li.cname}</td>
                    <td><button class="btn btn-danger" onclick="deleteCourse('${li.cid}')">删除</button></td>
            </#list>
            </tbody>
        </table>
<div style="margin-left: 450px">
    <ul class="pagination">
        <li><a href="/student/Page4?currentPage=1">首页</a></li>
        <li><a href="/student/Page4?currentPage=${pageInfo.pageNum-1}">上一页</a></li>
        <li><a href="/student/Page4?currentPage=${pageInfo.pageNum+1}">下一页</a></li>
        <li><a href="/student/Page4?currentPage=${pageInfo.pages}">末页</a></li>
    </ul>
</div>

    </div>



    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="../static/layui/layui.js"></script>
<script type="text/javascript">
    function deleteCourse(cid) {
        $.ajax({
            type: "POST",
            dataType: "JSON",
            data:{
                cid:cid
            },
            url: "http://localhost:8888/student/deleteCourse",
            success: function (data) {
                console.log(data);
            }
        });

    }
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>