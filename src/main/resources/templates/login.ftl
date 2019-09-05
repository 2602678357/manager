<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理-登陆</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #3F3F3F">
<div id="container">
    <div style=" margin-top:200px;margin-left:600px;width: 350px;height: 200px;">
        <p  style="text-align: center; width: 300px;"><h3 style="margin-left: 60px">学生成绩管理系统</h3></p>
        <form class="layui-form" method="post" action="/student/check">
            <div>
                <i class="layui-icon layui-icon-username admin-icon admin-icon-username"></i>
                <input name="userName"  id="userName" type="text" placeholder="请输入用户名"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-username">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon admin-icon-password"></i>
                <input name="passWord" id="passWord" type="text"
                       placeholder="请输入密码"
                       autocomplete="off"
                       class="layui-input admin-input">
            </div>
            <table align="center">
                <tr>
                    <td>验证：</td>
                    <td class="width50"><input id="checkcode" name="checkcode" type="text" class="width50" /></td>
                    <td><img src="createImage" alt="验证码" title="点击更换" onclick="this.src='createImage?'+(new Date()).getTime();"/></td>
                    <td><span id="checkcode_msg" class="required"></span></td>
                </tr>
            </table>

            <div style="margin-left: 120px; width: 400px;"><button class="layui-btn admin-button" id="btn" lay-submit lay-filter="formDemo">登陆</button></div>
        </form>
    </div>
</div>

<script>
    $("#btn").click(function () {
        var userName=$("#userName").val();
        var passWord=$("#passWord").val();
        var checkcode=$("#checkcode").val();
        if(userName == ""){
            alert("请输入用户名");
            return false;
        }else if(checkcode==""){
            alert("请输入验证码");
            return false;
        }else if(passWord == ""){
            alert("请输入密码");
            return false;
        }
        var data= {userName:userName,passWord:passWord,checkcode:checkcode};
        $.ajax({
            type:"POST",
            url:"http://localhost:8888/student/check",
            data:data,
            dataType:'json',
            success:function(msg){
                window.location.href ="/student/Page6";
            },
            error : function(msg) {
                alert("请重新登陆");
                window.location.href ="/student/login";
            }
        });
    })
</script>
</body>
</html>