<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>找回密码</title>
    <link ype="text/css" rel="stylesheet" href="../css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.11.3.js"></script>
    <link type="text/css" rel="stylesheet" href="../layui/css/layui.css">
</head>

<body>
<div class="login-div-main">
    <div class="all-div1"></div>
    <div class="all-div2">C-Chat</div>
    <!--1-->
    <div id="usernameTable" class="login-width login-outside" style="background:#FFF;">
        <div class="login-top">找回密码-1（共3步）</div>
        <div style="padding:20px;">
            <!--用户名-->
            <form class="layui-form" action="">
                <div id="username-div" class="layui-input">
                    <table>
                        <tr>
                            <td>
                                <i class="layui-icon layui-icon-username" style="font-size: 27px;color:#666; margin-right:5px;"> </i>
                            </td>
                            <td>
                                <input type="text" name="username" id="username" placeholder="请输入用户名" oninput="change('username')" class="all-input" />
                            </td>
                        </tr>
                    </table>
                </div>

                <div><input type="button" value="找回密码" id="refind" class="layui-btn layui-btn-normal" style="width:100%; margin:15px 0px 5px 0px;" ></div>
                <div><input type="button" value="上一步" onclick="javascript :history.go(-1);" class="layui-btn layui-btn-primary" style="width:100%; margin:15px 0px 5px 0px;" ></div>
            </form>
        </div>
    </div>



    <!--2-->

    <div id="yanTable" class="login-width login-outside" style="background:#FFF;display:none;">
        <div class="login-top">找回密码-2（共3步）</div>
        <div style="padding:20px;">
            <!--用户名-->
            <form class="layui-form" action="">
                <div class="layui-input">
                    <table>
                        <tr>
                            <td>
                                <i class="layui-icon layui-icon-website" style="font-size: 27px;color:#666; margin-right:5px;"> </i>
                            </td>
                            <td>
                                <input type="text" name="yan" id="yan" placeholder="请输入验证码" class="all-input" />
                            </td>
                        </tr>
                    </table>
                </div>

                <div><input type="button" value="提交" id="sub1" class="layui-btn layui-btn-normal" style="width:100%; margin:15px 0px 5px 0px;" ></div>
                <div><input type="button" value="上一步" id="sub1back" class="layui-btn layui-btn-primary" style="width:100%; margin:15px 0px 5px 0px;" ></div>
            </form>
        </div>
    </div>



    <!--3-->
    <div id="newpassTable" class="login-width login-outside" style="background:#FFF;display:none;">
        <div class="login-top">找回密码-3（共3步）</div>
        <div style="padding:20px;">
            <!--用户名-->
            <form class="layui-form" action="">
                <div id="newpass-div" class="layui-input">
                    <table>
                        <tr>
                            <td>
                                <i class="layui-icon layui-icon-vercode" style="font-size: 27px;color:#666; margin-right:5px;"> </i>
                            </td>
                            <td>
                                <input type="text" name="newpass" id="newpass" placeholder="请输入新密码" oninput="change('password')" class="all-input" />
                            </td>
                        </tr>
                    </table>
                </div>

                <div><input type="button" value="确认" id="sub2" class="layui-btn layui-btn-normal" style="width:100%; margin:15px 0px 5px 0px;" ></div>
                <div><input type="button" value="返回" id="sub2back" class="layui-btn layui-btn-primary" style="width:100%; margin:15px 0px 5px 0px;" ></div>
            </form>
        </div>
    </div>

</div>

<script type="text/javascript">
    $(document).ready(function() {
        /*我管这个叫三级跳转*/
        $("#usernameTable").show();
        $("#yanTable").hide();
        $("#newpassTable").hide();




        $("#refind").click(function () {
            var username=$.trim($("#username").val());
            if(username==""){
                $("#username").attr('placeholder','用户名不能为空')
                $("#username-div").css({background:"#FFE4E1"});
                $("#username").css({background: "#FFE4E1"});
                $("#username").focus();
                //alert("用户名不能为空");
            }
            else {
                $.ajax({
                    url:"/forget/haveUser1",
                    type:"POST",
                    data:"username="+username,
                    dataType:"json",
                    success:function (result){
                        if(result.code==200) {
                            $("#usernameTable").hide();
                            $("#yanTable").show();
                            $("#newpassTable").hide();
                            alert("请在邮箱里查看验证码邮件");
                        }
                        else
                            alert("用户名不存在");
                    },
                    error:function() {
                        alert("服务器内部错误！");
                    }});
            }

        });




        $("#sub1").click(function () {

            var yan=$.trim($("#yan").val());
            /*验证码验证*/
            $.ajax({
                url:"/forget/yan2",
                type:"POST",
                data:"yan="+yan,
                dataType:"json",
                success:function (result){
                    if (result.code==1){
                        alert(result.msg);
                    }
                    else if(result.code==200){
                        $("#usernameTable").hide();
                        $("#yanTable").hide();
                        $("#newpassTable").show();
                    }
                },
                error:function(xhr,errrorMessage,e) {
                    alert("服务器内部错误！");
                }});

        });


        $("#sub1back").click(function () {
            $("#usernameTable").show();
            $("#yanTable").hide();
            $("#newpassTable").hide();
            $("#yan").val("");
        });



        $("#sub2").click(function () {

            /*提交新密码*/
            var username=$.trim($("#username").val());
            var newpass=$.trim($("#newpass").val());
            var email=$.trim($("#email").val())

            if(newpass==""){
                $("#newpass").attr('placeholder','密码不能为空')
                $("#newpass-div").css({background:"#FFE4E1"});
                $("#newpass").css({background: "#FFE4E1"});
                $("#newpass").focus();
            }
            else{
                $.ajax({
                    url:"/forget/newpass3",
                    type:"POST",
                    data:{"username":username,"newpass":newpass,"email":email},
                    dataType:"json",
                    success:function (result){
                        if (result.code==200){
                            alert("修改成功！请使用新密码登录");
                            window.location="/jsp/login.jsp";
                        }
                    },
                    error:function(xhr,errrorMessage,e) {
                        alert("服务器内部错误！");
                    }
                });
            }

        });




        $("#sub2back").click(function () {
            $("#usernameTable").hide();
            $("#yanTable").show();
            $("#newpassTable").hide();
            $("#newpass").val("");
        });

    });
    function change(type) {
        if(type=="username") {
            $("#username").attr('placeholder', '请输入用户名');
            $("#username-div").css({background:"#fff"});
            $("#username").css({background: "#fff"});
        }
        else if(type=="password") {
            $("#password").attr('placeholder', '请输入密码');
            $("#password-div").css({background: "#fff"});
            $("#password").css({background: "#fff"});
        }

    }
</script>
</body>
</html>
