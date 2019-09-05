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
                <th>学号</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th colspan="3">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list list as li>
                <tr>
                    <td>${li.sid}</td>
                    <td>${li.sname}</td>
                    <td>${li.sage}</td>
                    <td>${li.ssex}</td>
                    <td><button class="btn btn-primary" onclick="updateStudent('${li.sid}')" data-toggle="modal" data-target="#myModal">
                            编辑
                        </button></td>
                    <td><button class="btn btn-danger" onclick="deleteStudent('${li.sid}')">删除</button></td>
            </#list>
            </tbody>
        </table>
<div style="margin-left: 450px">
    <ul class="pagination">
        <li><a href="/student/Page3?currentPage=1">首页</a></li>
        <li><a href="/student/Page3?currentPage=${pageInfo.pageNum-1}">上一页</a></li>
        <li><a href="/student/Page3?currentPage=${pageInfo.pageNum+1}">下一页</a></li>
        <li><a href="/student/Page3?currentPage=${pageInfo.pages}">末页</a></li>
    </ul>
</div>

        </div>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            修改信息
                        </h4>
                    </div>
                    <form role="form" method="post" action="/student/updateStudent3">
                        <input type="hidden" name="sid" id="sid">
                        <div class="form-group">
                            <p><label>姓名:</label>
                                <input name="sname" id="sname" type="text" class="form-control"/></p>
                        </div>
                        <div class="form-group">
                            <label>年龄</label>
                            <input name="sage" id="sage" type="text" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>性别</label>
                            <input name="ssex" id="ssex" type="text" class="form-control"/>
                        </div>
                        <div style="margin: 0 auto"><button  class="btn btn-default" >提交</button>
                            <button type="reset"  class="btn btn-default" >取消</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="../static/layui/layui.js"></script>
<script type="text/javascript">
    /**
     * 根据id删除用户信息
     */
    function deleteStudent(sid){
        $.ajax({
            type: "POST",
            dataType: "JSON",
            data:{
                sid:sid
            },
            url: "http://localhost:8888/student/deleteStudent2",
            success: function (data) {
                console.log(data);
            }
        });
    }

    function updateStudent(sid) {
        $.ajax({
            type: "POST",
            dataType: "JSON",
            data:{
                sid:sid
            },
            url: "http://localhost:8888/student/updateStudent",
            success: function (data) {
                var sname=data.sname;
                var sid=data.sid;
                var sage=data.sage;
                var ssex=data.ssex;
                $("#sid").val(sid);
                $("#sage").val(sage);
                $("#sname").val(sname);
                $("#ssex").val(ssex);
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