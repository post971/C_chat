<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>登录</title>
  <link ype="text/css" rel="stylesheet" href="../css/style.css" />
  <script type="text/javascript" src="/js/jquery-1.11.3.js"></script>
  <link type="text/css" rel="stylesheet" href="../layui/css/layui.css">

<body>


<div class="login-div-main">
  <div class="all-div1"></div>
  <div class="all-div2">C-Chat</div>
  <div class="login-width login-outside" style="background:#FFF;">
    <div class="login-top">用户登录</div>
    <div style="padding:20px;">
      <p id="uaperror" style="color: #ff0000;display: none">用户名或密码错误</p>
      <!--用户名-->
      <form class="layui-form" id="login-form" action="#" role="form" method="POST">
        <div id="username-div" class="layui-input">
          <table>
            <tr><td>
              <i class="layui-icon layui-icon-username" style="font-size: 27px;color:#666; margin-right:5px;"> </i></td>
              <td>
                <input type="text" name="username" id="username" placeholder="请输入用户名" class="all-input" oninput="change('username')"/>
              </td>
            </tr>
          </table>
        </div>
        <!--密码-->
        <div id="password-div" class="layui-input">
          <table>
            <tr><td>
              <i class="layui-icon layui-icon-password" style= "font-size: 27px;color:#666; margin-right:5px;"> </i></td>
              <td>
                <input type="password" name="password" id="password" placeholder="请输入密码" class="all-input" oninput="change('password')"/></td></tr></table>
        </div>

        <div><input type="button" id="login" class="layui-btn layui-btn-normal" value="登录" style="width:100%; margin:15px 0px 5px 0px;" ></div>
        <div><input type="button" value="注册" onclick="window.location.href = 'register.jsp'" class="layui-btn layui-btn-primary" style="width:100%; margin:5px 0px 5px 0px;" ></div>
        <div align="right"><a href="forget.jsp">忘记密码？</a></div>
      </form>
    </div>
  </div>
</div>

<!--
<form id="login-form" action="#" role="form" method="POST">
    <table class="login-top" border="1" cellpadding="10" cellspacing="0">
        <tr>
            <td colspan="2" class="login-td">用户登录</td>
        </tr>
        <tr>
            <td align="right">用户名:</td>
            <td><input type="text" name="username" id="username"/></td>
        </tr>
        <tr>
            <td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
            <td><input type="text" name="password" id="password"/></td>
        </tr>
        <tr>
            <td colspan="2" ali>
            <input id="login" type="button" value="登录" />
            <input type="button" value="注册" onclick="window.location.href = 'register.jsp'"/>
            <a href="forget.jsp"> 忘记密码</a></td>
        </tr>
    </table>
</form>
-->
<script type="text/javascript">
    $(document).ready(function() {
        $("#login").click(function () {
            //alert($("input[name='username']").val());
            //alert($("input[name='password']").val());
            var flag=0;
            if($.trim($("input[name='username']").val())==""){
                $("#username").attr('placeholder','用户名不能为空')
                $("#username-div").css({background:"#FFE4E1"});
                $("#username").css({background: "#FFE4E1"});
                $("#username").focus();
                flag=flag+1;
                //alert("用户名不能为空！")
            }
            if($.trim($("input[name='password']").val())==""){
                $("#password").attr('placeholder','密码不能为空')
                $("#password-div").css({background:"#FFE4E1"});
                $("#password").css({background: "#FFE4E1"});
                $("#password").focus();
                //alert("密码不能为空！");
                flag=flag+1;
            }
            if(flag==0){
                $.ajax({
                    url:"/user/login",
                    type:"POST",
                    data:$("#login-form").serialize(),
                    dataType:"json",
                    success:function (result){
                        if(result.code==200){
                            //alert("成功");
                            window.location= "/getinfo/context/"+$('#username').val();
                            $("#username").val("");
                            $("#password").val("");
                        }
                        else if(result.code==3){
                            //进入admin
                            window.location.href = 'admin.jsp';
                        }
                        else {
                            $("#uaperror").css("display","block");
                            $("#username").focus();
                            //alert("账号或密码错误！");
                        }
                        
                    },
                    error:function(xhr,errrorMessage,e) {
                        /*alert(xhr.val());
                        alert(errrorMessage);
                        alert(e);*/
                        alert("服务器内部错误！");

                        
                    }
                });}
            
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
        $("#uaperror").css("display","none");
        
    }
    
</script>
</body>
</html>
