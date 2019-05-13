<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored = "false" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>C-Chat</title>
    <link ype="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="../js/jquery-1.11.3.js"></script>
    <link type="text/css" rel="stylesheet" href="../layui/css/layui.css">
</head>

<body>

<div class="login-div-main">
    <div class="all-div1">
        <div style="padding-top:10px; padding-right:10px;">
            欢迎你，
            <a href="#" style="color: #fff">${requestScope.users.username }</a>
            &nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#" onclick="alert('孤独笼罩着你，管理员是没有消息的');" style="color: #fff">我的消息</a>

            &nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="javascript:history.go(-1)" style="color: #fff">退出</a>
        </div>
    </div>
    <div class="my-welcome-top" align="right">


    </div>
    <div id="uaulist" style="width:1000px; height:500px;margin:0px auto 0px auto;;" align="center">
        <div style="margin:auto; width:670px; height:480px">
            <div style="width:100%; height:35px; background:#2F4056;" align="center">
                <button onclick="javascript:history.go(-1)" class="layui-btn" style="width:70px;height:100%;float: left;background-color:#191970;">
                    <i class="layui-icon layui-icon-left" style="color: #fff"></i>
                </button>
                <span style="color:#fff;font-size: 23px">用户管理</span></div>
            
            <div style="width:100%; height:445px; background:#e2e2e2;">
                <div style="width:650px; height:435px; background:#f2f2f2; margin:auto auto auto auto;overflow:auto;">


                    <table width="650px" cellpadding="0" cellspacing="0" border="1px">

                        <tr height="50px">
                            <td width="20%" align="center">用户名</td>
                            <td width="20%" align="center">密码</td>
                            <td width="35%" align="center">邮箱</td>
                            <td width="25%" align="center">操作</td>
                        </tr>
                    </table>


                    <!--一条模板-->
                    <div id="userlist1" style="display: none;">
                        <table id="uauitem" width="650px" cellpadding="0" cellspacing="0" border="1px" style="display: table">
                            
                            <tr height="50px">
                                <td ff="name" width="20%" align="center">asdasd</td>
                                <td ff="pass" width="20%" align="center">qqqqqq</td>
                                <td ff="email" width="35%" align="center">qqqqqq</td>
                                <td ff="event" width="25%" align="center">
                                    <input type="button" class="layui-btn layui-btn-primary" style="width: 39%;" value="修改" >
                                    <input type="button" class="layui-btn layui-btn-danger" style="width: 39%;" value="删除" >
                                </td>
                            </tr>
                            
                        </table>
                        <table id="uauitem2" width="650px" cellpadding="0" cellspacing="0" border="1px" style="display: none">
                            
                            <tr height="50px">
                                <td ff="name2" width="20%" align="center">asdasd</td>
                                <td ff="pass2" width="20%" align="center">qqqqqq</td>
                                <td ff="email2" width="35%" align="center">qqqqqq</td>
                                <td ff="event2" width="25%" align="center">
                                    <input type="button" class="layui-btn layui-btn-primary" style="width: 39%;" value="修改" >
                                    <input type="button" class="layui-btn layui-btn-danger" style="width: 39%;" value="删除" >
                                </td>
                            </tr>
                            
                        </table>
                    </div>

                    <!--列表-->
                    <div id="usertable" style="width: 650px;">
                    </div>

                   
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    window.onload=function () {
        getinfo();
    }
    function getinfo() {
        $("#usertable").html("");
        $.ajax({
            url: "/getinfo/admin",
            type: "POST",
            dataType: "json",
            success: function (result) {
                //console.info(result.userList);
                $(result.userList).each(function () {
                    //console.info(this);
                    //addUser(this);
                    var name = this.username;
                    //console.info(name);
                    var pass = this.password;
                    var email = this.email;

                    
                    //设置第一面
                    var box = $("#userlist1").clone(); 	//复制一份模板，取名为box
                    box.attr("id","a"+name);
                    box.css("display", "block") //显示
                    box.find('[ff="name"]').html(name);	//设置box状态为显示
                    box.find('[ff="pass"]').html(pass); //hr线设置为显示
                    name = '"' + name + '"';
                    pass = '"' + pass + '"';
                    

                    box.find('[ff="email"]').html(email); //
                    email = '"' + email + '"';
                    var s1 = "onclick='updateuser(" + name + "," + pass + "," + email + ")'";
                    var s2 = "onclick='deleteuser(" + name + "," + pass + "," + email + ")'";
                    var s = '<input type="button" class="layui-btn layui-btn-primary" style="width: 39%;" value="修改" ' + s1 + '>' +
                        '<input type="button" class="layui-btn layui-btn-danger" style="width: 39%;" value="删除" ' + s2 + '>';
                    box.find('[ff="event"]').html(s);
                    box.appendTo("#usertable");		//把box追加到聊天面板中
                    $("#usertable").scrollTop(999999) //滚动条拉至最底部


                    
                    //第二面
                    box.find("[ff='name2']").html('<input id="name22" style="width: 90px" type="text" value='+name+'/>');
                    box.find("[ff='pass2']").html('<input id="pass22" style="width: 90px" type="text" value='+pass+'/>');
                    box.find("[ff='email2']").html('<input id="email22" style="width: 180px" type="text" value='+email+'/>');
                    var s1 = "onclick='goupdate(" + name + "," + pass + "," + email + ")'";
                    var s2 = "onclick='backup("+name+")'";
                    var s = '<input type="button" class="layui-btn layui-btn-primary" style="width: 39%;" value="确认" ' + s1 + '>' +
                        '<input type="button" class="layui-btn layui-btn-primary" style="width: 39%;" value="取消" ' + s2 + '>';
                    box.find('[ff="event2"]').html(s);
                });
            },
            error: function (xhr, errrorMessage, e) {
                alert("服务器内部错误！");
            }
        });
    }
    //更新
    function updateuser(name,pass,email){
        
        var s="#a"+name+" ";
        console.info(s);
        $(s+"#uauitem").css("display","none");
        $(s+"#uauitem2").css("display","table");
    }
    
    //确认更新
    function goupdate(name,pass,email){
        //原来的账号密码
        console.info("修改"+name+","+pass+","+email+","+"#a"+name);
        //获取编辑框的账号密码
        var name2=$("#a"+name+" input[id=name22]").val();
        var pass2=$("#a"+name+" input[id=pass22]").val();
        var email2=$("#a"+name+" input[id=email22]").val();
        //console.info("确认2222222更新:"+name2+","+pass2+","+email2);
        $.ajax({
            url:"/user/updateuser",
            type:"POST",
            data:{"username":name,
                "password":pass,
                "email":email,
                "username2":name2,
                "password2":pass2,
                "email2":email2
            },
            dataType:"json",
            success:function (result){
                if (result.code==200){
                    alert("修改成功！");
                    getinfo();
                }
            },
            error:function(xhr,errrorMessage,e) {
                alert("服务器内部错误！");
            }});
    }
    
    //取消更新
    function backup(name) {
        var s="#a"+name+" ";
        $(s+"#uauitem").css("display","table");
        $(s+"#uauitem2").css("display","none");
    }
    
    //删除
    function deleteuser(name,pass,email){
        //console.info("删除"+name+","+pass+","+email);
        $.ajax({
            url:"/user/deleteuser",
            type:"POST",
            data:{"username":name,"password":pass,"email":email},
            dataType:"json",
            success:function (result){
                if (result.code==200){
                    alert("删除成功！");
                    getinfo();
                } 
            },
            error:function(xhr,errrorMessage,e) {
                alert("服务器内部错误！");
            }});
    }
</script>
</body>
</html>
