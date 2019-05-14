<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>注册</title>
	<link ype="text/css" rel="stylesheet" href="../css/style.css" />
	<script type="text/javascript" src="../js/jquery-1.11.3.js"></script>
	<link type="text/css" rel="stylesheet" href="../layui/css/layui.css">

</head>

<body>
<div class="login-div-main">
	<div class="all-div1"></div>
	<div class="all-div2">C-Chat</div>
	<div class="login-width login-outside" style="background:#FFF;">
		<div class="login-top">用户注册</div>

		<div style="padding:20px;">
			<p id="info" style="color: #ff0000;display: none">两次输入密码不一致</p>
			<form class="layui-form" id="register-form" action="#" role="form" method="POST">
				<!--用户名-->
				<div id="name-div" class="layui-input">
					<table>
						<tr><td>
							<i class="layui-icon layui-icon-username" style="font-size: 27px;color:#666; margin-right:5px;"> </i></td>
							<td>
								<input type="text" id="name" name="name" placeholder="请输入用户名" oninput="change('name')" class="all-input" />
							</td>
						</tr>
					</table>
				</div>
				<!--密码-->
				<div id="pass-div" class="layui-input">
					<table>
						<tr><td>
							<i class="layui-icon layui-icon-password" style="font-size: 27px;color:#666; margin-right:5px;"> </i></td>
							<td>
								<input type="password" id="pass" name="pass" placeholder="请输入密码" oninput="change('pass')" class="all-input" />
							</td>
						</tr>
					</table>
				</div>
				<!--取人密码-->
				<div id="pass2-div" class="layui-input">
					<table>
						<tr><td>
							<i class="layui-icon layui-icon-password" style="font-size: 27px;color:#666; margin-right:5px;"> </i></td>
							<td>
								<input type="password" id="pass2" name="pass2" placeholder="请再次输入密码" oninput="change('pass2')" class="all-input" />
							</td>
						</tr>
					</table>
				</div>
				<!--邮箱-->
				<div id="email-div" class="layui-input">
					<table>
						<tr><td>
							<i class="layui-icon layui-icon-website" style="font-size: 27px;color:#666; margin-right:5px;"></i></td>
							<td>
								<input type="text" id="email" name="email" placeholder="请输入邮箱" oninput="change('email')" class="all-input" />
							</td>
						</tr>
					</table>
				</div>
				<!--验证码-->
				<table>
					<tr><td>
						<div id="yan-div"  class="layui-input" style="width:200px;">
							<table>
								<tr>
									<td>
										<i class="layui-icon layui-icon-auz" style="font-size: 27px;color:#666; margin-right:5px;"></i>
									</td>
									<td>
										<input type="text" id="yan" name="yan" placeholder="请输入验证码" oninput="change('yan')" class="all-input" style="width:150px;"/>
									</td>
								</tr>
							</table>
						</div>
					</td>
						<td>
							<input type="button" value="发送验证码" id="yan-btn" class="layui-btn layui-btn-primary" style="width:150px; margin:0px 0px 0px 10px;">
						</td>
					</tr>
				</table>

				<div><input type="button" value="注册" id="submit" class="layui-btn layui-btn-normal" style="width:100%; margin:15px 0px 5px 0px;" ></div>
				<div align="right"><a href="login.jsp">已有账号，登陆</a></div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    $(document).ready(function() {

        $("#submit").click(function(){
            var flag=0;
            /*验证有没有未填的*/
			//用户名不能为空
            if ($.trim($("#name").val())==""){
                $("#name").attr('placeholder','用户名不能为空')
                $("#name-div").css({background:"#FFE4E1"});
                $("#name").css({background: "#FFE4E1"});
                $("#name").focus();
                flag=flag+1;
            }
            //密码不能为空
            if ($.trim($("#pass").val())==""){
                $("#pass").attr('placeholder','密码不能为空')
                $("#pass-div").css({background:"#FFE4E1"});
                $("#pass").css({background: "#FFE4E1"});
                $("#pass").focus();
                flag=flag+1;
            }
            //确认密码不能为空
            if ($.trim($("#pass2").val())==""){
                $("#pass2").attr('placeholder','确认密码不能为空')
                $("#pass2-div").css({background:"#FFE4E1"});
                $("#pass2").css({background: "#FFE4E1"});
                $("#pass2").focus();
                flag=flag+1;
            }
            //邮箱不能为空
            if ($.trim($("#email").val())==""){
                $("#email").attr('placeholder','邮箱不能为空')
                $("#email-div").css({background:"#FFE4E1"});
                $("#email").css({background: "#FFE4E1"});
                $("#email").focus();
                flag=flag+1;
            }
            //验证码不能为空
            if ($.trim($("#yan").val())==""){
                $("#yan").attr('placeholder','验证码不能为空')
                $("#yan-div").css({background:"#FFE4E1"});
                $("#yan").css({background: "#FFE4E1"});
                $("#yan").focus();
                flag=flag+1;
            }
            //两次密码输入不一致
            if(flag==0){
                if($.trim($("#pass").val())!=$.trim($("#pass2").val())){
                    $("#info").css("display","block");
                    $("#pass").focus();
                }else{
                    
                    
                    /*注册*/
                    var myReg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
                    var email=$.trim($("#email").val())
                    
                    
                        
                    
                    if (!myReg.test(email)) {
                        alert("邮箱格式不正确！请重新输入");
                        $("#email1").focus();
                    }
                    else{
                        $.ajax({
                            url:"/user/register",
                            type:"POST",
                            data:$("#register-form").serialize(),
                            dataType:"json",
                            success:function (result){
                                if(result.code==1||result.code==2){
                                    alert(result.msg);
                                }
                                else if(result.code==200){
                                    alert("注册成功！")
                                    window.location="/jsp/login.jsp";
                                }
                            },
                            error:function(xhr,errrorMessage,e) {
                                alert("服务器内部错误！");
                            }});
					}

                }
            }
        });



        var myReg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
        $("#yan-btn").click(function () {
            /*发送验证码*/
            var email=$.trim($("#email").val())
            if (email==""){
				alert("邮箱不能为空");
            }
            else if (!myReg.test(email)) {
                alert("邮箱格式不正确！请重新输入");
                $("#email1").focus();
            }
            else{

                /*60秒cd效果*/
                getRandomCode();
                //-------
                $.ajax({
                    url:"/user/yan",
                    type:"POST",
                    data:"emailJson="+email,
                    dataType:"json",
                    success:function (result){

                    },
                    error:function(xhr,errrorMessage,e) {
                        alert("服务器内部错误！");
                    }});
                
            }


        });
    });


    var time = 60;
    //倒计时
    function getRandomCode() {
        if (time === 0) {
            time = 60;
            $("#yan-btn").attr('disabled',false);
            $("#yan-btn").val("获取验证码");
            return;
        } else {
            time--;
            $("#yan-btn").attr('disabled',true);
            $("#yan-btn").val("重新获取("+time+")");
        }
        setTimeout(function () {
            getRandomCode();
        }, 1000);
    }



    //监听编辑款文字更改，把红色编辑框变成白色
    function change(type) {
        if(type=="name") {
            $("#name").attr('placeholder', '请输入用户名');
            $("#name-div").css({background:"#fff"});
            $("#name").css({background: "#fff"});
        }
        else if(type=="pass") {
            $("#pass").attr('placeholder', '请输入密码');
            $("#pass-div").css({background: "#fff"});
            $("#pass").css({background: "#fff"});
        }
        else if(type=="pass2") {
            $("#pass2").attr('placeholder', '请入再次输入密码');
            $("#pass2-div").css({background: "#fff"});
            $("#pass2").css({background: "#fff"});
        }
        else if(type=="email") {
            $("#email").attr('placeholder', '请输入邮箱');
            $("#email-div").css({background: "#fff"});
            $("#email").css({background: "#fff"});
        }
        else if(type=="yan") {
            $("#yan").attr('placeholder', '请输入验证码');
            $("#yan-div").css({background: "#fff"});
            $("#yan").css({background: "#fff"});
        }

        $("#info").css("display","none");

    }
</script>

</body>
</html>
