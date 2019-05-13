<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored = "false" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>C-Chat</title>
    <link ype="text/css" rel="stylesheet" href="/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.11.3.js"></script>
    <link type="text/css" rel="stylesheet" href="/layui/css/layui.css">
</head>

<body>

<div class="login-div-main">
    <div class="all-div1">
        <div style="padding-top:10px; padding-right:10px;">
            欢迎你，
            <a href="#" style="color: #fff">${requestScope.users.username }</a>
            &nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="#" onclick="showmymessage()" style="color: #fff">我的消息</a>

            &nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="javascript:history.go(-1)" style="color: #fff">退出</a>
        </div>
    </div>
    <div class="my-welcome-top" align="right">


    </div>
    <div id="mydiv1" class="my-div1" align="center">
        <table width="1000px" height="500px" >
            <tr>
                <td width="310px">
                    <div style="margin:auto; width:290px; height:480px">
                        <div class="my-divleft-top">
                            <span class="my-divleft-top-span">在线好友</span>
                        </div>
                        <!--好友面板-->
                        <div style="width:100%; height:445px; background:#e2e2e2;">
                            <div style="width:95%; height:98%; background:#f2f2f2; margin:auto;">
                                <!--一条-->
                                <div id="userlist1" class="my-f-body">
                                    <p ff="name" class="my-f-name">名字</p>
                                    <hr ff="hhr" style="display: none">
                                </div>
                                <!--好友列表-->
                                <div id="listbody">

                                </div>
                                <div align="center" style="color: #c2c2c2">往下没有了~</div>
                            </div>
                        </div>
                    </div>
                </td>

                <td><div style="margin:auto; width:670px; height:480px">
                    <div style="width:100%; height:35px; background:#2F4056;text-align: center">
                        <span class="my-divleft-top-span">消息</span>
                    </div>
                    <!--消息面板-->
                    <div style="width:100%; height:325px; background:#e2e2e2">
                        <!--一条气泡模板-->

                        <!--别人消息-->
                        <div id="hems"  style="height: 80px;width: 100%;display:none;">
                            <table style="margin:5px 0px 5px 0px; float:left" height="70px" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="padding:0px 10px 0px 10px;" rowspan="2"><span ff="oclick"></span></td>
                                    <td  style="font-size:18px"><span ff="clientname">名字</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span ff="ms"></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!--我的消息-->
                        <div id="myms" style="height: 80px;width: 100%;display:none;">
                            <table style="margin:5px 0px 5px 0px; float:right" height="70px" cellpadding="0" cellspacing="0">
                                <tr>

                                    <td  style="font-size:18px; text-align:right"><span ff="clientname">名字</span></td>
                                    <td style="padding:0px 10px 0px 10px;" rowspan="2"><img src="/img/icon.jpg" style="width:75px;"/></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span ff="ms" class="layui-card" style="font-size: 20px; padding:6px 15px 6px 15px;">我的消息</span></td>
                                </tr></table>
                        </div>
                        <!--/一条气泡模板-->

                        <!--消息气泡面板-->
                        <div id="msframe" class="my-msframe">

                        </div>
                        <hr class="layui-bg-black" style="margin:8px 10px 0px 10px">
                    </div>
                    <!--编辑框与按钮-->
                    <div style="width:100%;height:120px;; background:#e2e2e2">
                        <div style="width:650px;  margin-left:auto; margin-right:auto;">
                            <textarea id="text" required lay-verify="required" placeholder="请输入"  style="width:100%; height:70px"></textarea>
                            <div align="right"><input id="send" type="button" class="layui-btn layui-btn-primary"  value="发送"/></div>
                        </div>

                    </div>
                </div>

                </td>
            </tr>
        </table>
    </div>


    <div id="uaulist" style="width:1000px; height:500px;margin:0px auto 0px auto;display: none;" align="center">
        <div style="margin:auto; width:670px; height:480px">
            <div style="width:100%; height:35px; background:#2F4056;" align="center">
                <button onclick="showmymessage2()" class="layui-btn" style="width:70px;height:100%;float: left;background-color:#191970;">
                    <i class="layui-icon layui-icon-left" style="color: #fff"></i>
                </button>
                <span style="color:#fff;font-size: 23px">我的消息</span></div>
            <!--消息面板-->
            <div style="width:100%; height:445px; background:#e2e2e2;">
                <div style="width:650px; height:435px; background:#f2f2f2; margin:auto auto auto auto;overflow:auto;">


                    <table width="650px" cellpadding="0" cellspacing="0" border="1px">

                        <tr height="50px">
                            <td width="20%" align="center">用户名</td>
                            <td width="65%" align="center">内容</td>
                            <td width="15%" align="center">操作</td>
                        </tr>
                    </table>


                    <!--一条模板-->
                    <div id="k" style="display: none;">
                        <table  width="650px" cellpadding="0" cellspacing="0" border="1px">
                            <tr id="uauitem" height="50px">
                                <td ff="name" width="20%" align="center">asdasd</td>
                                <td ff="context" width="65%" style="padding-left:10px;">qqqqqq</td>
                                <td ff="delete" width="15%" align="center">
                                    <input type="button" class="layui-btn layui-btn-danger" style="width: 80%;" value="删除" onclick="xiugai(1,2,3)">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <!--列表-->
                    <div id="uautable" style="width: 650px;"></div>

                    </table>
                </div>
            </div>

        </div>
    </div>
</div>

<%--<div id="userlist"></div>


<div class="my-div1">
 <div class="my-div2">
     <div>
        <p href="#" class="my-div3">欢迎你，${requestScope.user.username}&nbsp;&nbsp;|&nbsp;&nbsp;我的消息&nbsp;&nbsp;|&nbsp;&nbsp;退出</p>
     </div>
 </div>
 <div class="my-div4">
     <input id="updata" type="button" value="修改">
     ${requestScope.user.context}
 </div>
</div>--%>
<script type="text/javascript">
    var username="${requestScope.users.username }";
    var ws;
    var target="ws://localhost:8080/chatSocket?username="+username;
    //打开页面的同时开启websocket
    window.onload=function () {


        if("WebSocket" in window){
            ws=new WebSocket(target);
        }
        else if("MozWebSocket" in window){
            ws=new MozWebSocket(target);
        }
        else{
            alert("WebSocket is not supported by this browser");
            return;
        }
        var i=0;
        var flag=0;




        ws.onmessage=function (ev) {

            eval("var msg="+ev.data+";");

            //alert("数组"+msg.usernames);
            //接收用户列表
            if(undefined!=msg.usernames){
                $("#listbody").html("");
                $(msg.usernames).each(function(){
                    console.info(decodeURI(this));
                    addUser(decodeURI(this));
                });
            }


            //插话系统发过来的消息
            if(undefined!=msg.contextlist){
                $("#msframe").html("");
                var s="";
                $(msg.contextlist).each(function(){
                    //alert("用户"+this);
                    s+=this;
                    /*发送人*/
                    var name1=this.split("&")[0];
                    /*发送内容*/
                    var context1=this.split("&")[1];
                    //console.info(name1+"<____>"+context1);

                    if(context1.split("]")[0]=="[私信")
                    {
                        if(name1=="${requestScope.users.username }"||context1.split("]")[1].split(" ")[0]=="${requestScope.users.username }"){
                            if(name1=="${requestScope.users.username }"){
                                addMessage(name1,context1,1);
                            }
                            else{
                                addMessage(name1,context1,0);
                            }
                        }
                    }
                    else{
                        if(name1=="${requestScope.users.username }"){
                            addMessage(name1,context1,1);
                        }
                        else{
                            addMessage(name1,context1,0);
                        }
                    }
                });
                //alert(s);
            }
            //接收对话消息
            if(undefined!=msg.context){

                //alert(msg.context);
                var s=msg.context;
                var name=s.split("%")[0];
                var message=s.split("%")[1];
                //alert(s+"-"+name+"-"+message);
                if(name=="${requestScope.users.username }"){
                    addMessage(name,message,1);
                }
                else{
                    addMessage(name,message,0);
                }
            }

        }

    }



    //用户列表添加用户
    function addUser(aname){
        //alert("页面ui修改")
        var box = $("#userlist1").clone(); 	//复制一份模板，取名为box
        box.css("display","block") //显示
        box.find('[ff="name"]').css("display","block");	//设置box状态为显示
        box.find('[ff="hhr"]').css("display","block"); //hr线设置为显示
        box.find('[ff="name"]').html(aname); //在box中设置昵称
        box.appendTo("#listbody");		//把box追加到聊天面板中

    }

    //消息面板添加消息
    function addMessage(name,message,my){
        console.info(name+"-"+message+"-"+my);
        if(my==1){
            var box = $("#myms").clone();
            console.info("666");
            box.find('[ff="ms"]').html(message);
        }
        else{
            var box = $("#hems").clone();
            var s='<img src="/img/icon.jpg" onclick="aite('+name+')" style="width:75px;"/>';
            box.find('[ff="oclick"]').html(s);
            //console.info("777");

            var s="'"+message+"'";
            var ss="cha("+s+")"
            var sss='<span class="layui-card" style="font-size: 20px; padding:6px 15px 6px 15px;" onclick='+ss+'>'+message+'</span>'
            box.find('[ff="ms"]').html(sss);
        }
        box.find('[ff="clientname"]').html(name);
        box.css("display","block") //显示
        box.appendTo("#msframe");
        $("#msframe").scrollTop(999999) //滚动条拉至最底部
    }


    function aite(name){
        $("#text").val("[私信]"+name+" ");
    }

    $("#send").click(function () {
        var val="${requestScope.users.username }"+"&"+$("#text").val();
        ws.send(val);
        $("#text").val("");
    });


    function showmymessage() {
        $("#mydiv1").css("display","none");
        $("#uaulist").css("display","block");
        <%--/getinfo/mymessage/${requestScope.users.username }--%>

        $.ajax({
            url:"/getinfo/mymessage",
            type:"POST",
            data:"username="+${requestScope.users.username },
            dataType:"json",
            success:function (result){
                //alert("666");
                $("#uautable").html("");
                var list=result.list;
                for(var i=0;i<list.length;i++){
                    var username = list[i].username;
                    var tousername =list[i].tousername;
                    var context=list[i].context;
                    //alert(username+"--"+tousername+"--"+context);

                    var item=$("#k").clone();//复制一个作为模板
                    item.css("display","block");//显示
                    item.find('[ff="name"]').html(username)//设置姓名
                    item.find('[ff="context"]').html(context)//设置内容
                    var n=${requestScope.users.username };
                    n="'"+n+"'";//被@
                    username="'"+username+"'";//@别人
                    context="'"+context+"'";
                    var s='<input type="button" class="layui-btn layui-btn-danger" style="width: 80%;" value="删除" onclick="deletesm('+username+','+n+','+context+')">';
                    item.find('[ff=delete]').html(s)//设置按钮
                    item.appendTo("#uautable");//追加到table中
                }



            },
            error:function(xhr,errrorMessage,e) {
                alert("服务器内部错误！");
            }});
    }
    //我的消息退后到聊天界面
    function showmymessage2() {
        $("#mydiv1").css("display","block");
        $("#uaulist").css("display","none")
    }

    //删除私信记录
    function deletesm(username,tousername,context){


        if(window.confirm('你确定要删除这条私信吗？')){
            //删除操作
            //alert(username+"--"+tousername+"--"+context);
            $.ajax({
                url:"/user/deletesm",
                type:"POST",
                data:{"username":username,"tousername":tousername,"context":context},
                dataType:"json",
                success:function (result){
                    //刷新一下页面
                    showmymessage();
                },
                error:function(xhr,errrorMessage,e) {
                    alert("服务器内部错误！");
                }});
            return true;
        }else{
            //alert("取消");
            return false;
        }

    }

    function cha(context){
        //alert("cha-"+context);
        $("#text").val("[插话]"+context+" ");
        $("#text").focus();
    }


</script>
</body>
</html>
