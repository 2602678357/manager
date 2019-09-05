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
        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal2">
            新增学生信息
        </button>
        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal3">
            新增教师信息
        </button>
        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal4">新增课程</button>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th>老师名</th>
                <th>课程名</th>
                <th>分数</th>
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
                    <td>${li.tname}</td>
                    <td>${li.cname}</td>
                    <td>${li.score}</td>
                    <td><button class="btn btn-primary" onclick="updateStudent('${li.sid}')" data-toggle="modal" data-target="#myModal">
                            编辑</button>
                    </td>
                    <td><button class="btn btn-danger" onclick="deleteStudent('${li.sid}')">删除</button>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
<div style="margin-left: 450px">
    <ul class="pagination">
        <li><a href="/student/Page6?currentPage=1">首页</a></li>
        <li><a href="/student/Page6?currentPage=${pageInfo.pageNum-1}">上一页</a></li>
        <li><a href="/student/Page6?currentPage=${pageInfo.pageNum+1}">下一页</a></li>
        <li><a href="/student/Page6?currentPage=${pageInfo.pages}">末页</a></li>
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
                <form role="form" method="post" action="/student/updateStudent2">
                    <input type="hidden" name="sid" id="sid">
                    <input type="hidden" name="tid" id="tid">
                    <input type="hidden" name="cid" id="cid">
                    <div class="form-group" >
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
                    <div class="form-group">
                        <label>教师名</label>
                        <select id="selectSport" name="tname" ruanat="server">
                            <#list list2 as li>
                                <option name="tname" id="tname" value="${li.tname}">${li.tname}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>课程名</label>
                        <select id="selectSport2" name="cname" ruanat="server">
                            <#list list3 as li>
                                <option name="cname" id="cname" value="${li.cname}">${li.cname}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>分数</label>
                        <input name="score" id="score" type="text" class="form-control"/>
                    </div>
                    <div style="margin: 0 auto"><button type="submit"  class="btn btn-default" >提交</button>
                        <button type="reset"  class="btn btn-default" >取消</button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        新增学生
                    </h4>
                </div>
                <form role="form" method="post"  action="/student/saveStudent">
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
                    <div style="margin: 0 auto"><button type="submit" class="btn btn-default" id="put">提交</button>
                        <button type="reset"  class="btn btn-default" >取消</button></div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


    <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        新增教师
                    </h4>
                </div>
                <form role="form" method="post"  action="/student/saveTeacher">
                    <div class="form-group">
                        <p><label>姓名:</label>
                            <input name="tname" id="tname" type="text" class="form-control"/></p>
                    </div>
                    <div style="margin: 0 auto"><button type="submit" class="btn btn-default" id="put">提交</button>
                        <button type="reset"  class="btn btn-default" >取消</button></div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


    <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        新增课程
                    </h4>
                </div>
                <form role="form">
                    <div class="form-group">
                        <select id="selectSport" name="tname" ruanat="server">
                            <#list list2 as li>
                                <option name="tname" id="tname" value="${li.tname}">${li.tname}</option>
                            </#list>
                        </select>
                        <p><label>课程名:</label>
                            <input name="cname" id="cname" type="text" class="form-control"/></p>
                    </div>
                    <div style="margin: 0 auto"><button type="submit" class="btn btn-default" id="put">提交</button>
                        <button type="reset"  class="btn btn-default" >取消</button></div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

</body>
<script type="text/javascript">
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
                var tid=data.tid;
                var cid=data.cid;
                var sage=data.sage;
                var ssex=data.ssex;
                var tname=data.tname;
                var cname=data.cname;
                var score=data.score;
                $("#tid").val(tid);
                $("#cid").val(cid);
                $("#sid").val(sid);
                $("#sage").val(sage);
                $("#sname").val(sname);
                $("#ssex").val(ssex);
                $("#tname").val(tname);
                $("#cname").val(cname);
                $("#score").val(score);
            }
        });
    }

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
            url: "http://localhost:8888/student/deleteStudent",
            success: function (data) {
                console.log(data);
            }
        });
    }


</script>
<script src="../static/layui/layui.js"></script>
<script type="text/javascript">

    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });
</script>

</html>