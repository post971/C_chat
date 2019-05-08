package com.bao.utils;

import com.bao.entity.Message;
import com.bao.entity.Uau;
import com.bao.service.IUserService;
import com.bao.service.Impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;



@ServerEndpoint("/chatSocket")
@Component
public class chatSocket {
    
    
    private String username;
    private static List<Session> sessions=new ArrayList<Session>();
    private static List<String> names=new ArrayList<String>();
    private static List<String> nameandcontext=new ArrayList<String>();
    private static Map<String,Session> map=new HashMap<String,Session>() ;
    
    //这里因为普通类不能注入，所以用这种方法，后面的userService来源于ioc容器里的bean的id
    private static IUserService userService= (IUserService) ContextLoader.getCurrentWebApplicationContext().getBean("userService");
    
    
    
    @OnOpen
    public void open(Session session){
        //System.out.println("sessionid:"+session.getId());
        String queryString=session.getQueryString();
        username=queryString.split("=")[1];
        //System.out.println("发言人："+username);

        //把上线名字广播给所有用户
        this.names.add(username);
        this.sessions.add(session);
        
        
        map.put(this.username,session);
        
        Message message=new Message();
        message.setUsernames(this.names);
        broadcast(sessions,message.toJson());
        
    }
    
    @OnClose
    public void close(Session session){
        //关闭通道=退出=在用户列表里消失
        this.sessions.remove(session);
        this.names.remove(this.username);
        Message message1=new Message();
        message1.setUsernames(this.names);
        broadcast(this.sessions,message1.toJson());
    }

    @OnMessage
    public void onmessage(Session session,String msg){
        //
        nameandcontext.add(msg);
        Iterator it1 = nameandcontext.iterator();
        
        
        //bcname：插话的人
        String bcname=msg.split("&")[0];
        
        //内容
        msg=msg.split("&")[1];
        
        
        //把前4个字拿出来看看有没有[私聊]或者[插话]
        //System.out.println("aa-"+msg);
        String s="";
        if(msg.length()>=4){
            s=msg.substring(0,4);
        }
        
        
        
       
        //发送的内容带有[私信]而且有空格的时候，就发送私聊
        if("[私信]".equals(s)) {
            int i=0;
            int isS=0;
            for (i=0;i<msg.length();i++){
                if(msg.charAt(i)==' '){
                    isS=1;
                    break;
                }
            }
            //有没有包含空格
            if (isS==1) {
                i = 4;
                //slname:被私聊的人
                String slname = "";
                while (true) {
                    if (msg.charAt(i) != ' ')
                        slname += String.valueOf(msg.charAt(i));
                    else
                        break;
                    i++;
                }
                //context:私聊的内容
                i++;
                String context="";
                for(;i<msg.length();i++){
                    context+=String.valueOf(msg.charAt(i));
                }
                //System.out.println("context="+context);
                //System.out.println("系统消息："+this.username+"@@@"+slname+"---"+msg);
                
                //把私聊消息存入数据库
                Uau uau=new Uau();
                uau.setUsername(this.username);
                uau.setTousername(slname);
                
                uau.setContext(context);
                
                userService.addUau(uau);
                
                
                //被@的人
                Session ses=map.get(slname);
                //发起@的人
                Session ses2=map.get(this.username);
                
                //一个list里只放2个session,只向@和被@的人发送消息
                List<Session> one=new ArrayList<Session>();

                one.add(ses);
                one.add(ses2);
                
                Message message=new Message();
                message.setContext(this.username,msg);
                
                broadcast(one,message.toJson());
            }
            else {
                Message message = new Message();
                message.setContext(this.username, msg);
                broadcast(this.sessions, message.toJson());
            }
        }
        else {

            //插话
            if("[插话]".equals(s)){
                int i = 4;
                //bccontext:被插话的内容
                
                String bccontext = "";
                while (true) {
                    if (msg.charAt(i) != ' ')
                        bccontext += String.valueOf(msg.charAt(i));
                    else
                        break;
                    i++;
                }
                i++;
                //context:插话的内容
                String context="";
                for(;i<msg.length();i++){
                    context+=msg.charAt(i);
                }
                
                
                //System.out.println();
                //System.out.println("插话的人"+bcname);
                //System.out.println("被插话context："+bccontext);
                //System.out.println("插话context："+context);

                
                //把list的内容遍历
                int j=0;
                String sw="";
                while(it1.hasNext()){
                    String sms=(String)it1.next();
                    //发送人
                    String namems=sms.split("&")[0];
                    //发送内容
                    String contextms=sms.split("&")[1];
                    if(bccontext.equals(contextms)){
                        //
                        sw=namems;
                        break;
                    }
                    j++;
                }
                //System.out.println("sw="+bcname);
                //System.out.println("nameandcontext:"+nameandcontext);
                //System.out.println("j="+j);
                
                
                //插话
                String ch=bcname+"&[插话]"+context;
                    //System.out.println("ch:"+ch);
                    //System.out.println("1------"+nameandcontext);
                nameandcontext.add(j+1,ch);
                nameandcontext.remove( nameandcontext.get(nameandcontext.size()-1));
                    //System.out.println("jandch"+j+"------"+ch);
                    //System.out.println("2------"+nameandcontext);
                
                Message message = new Message();
                
                message.setContextlist(nameandcontext);
                broadcast(this.sessions, message.toJson());

            }
            else {
                Message message = new Message();
                message.setContext(this.username, msg);
                broadcast(this.sessions, message.toJson());
            }
        }
    }
    
    public void broadcast(List<Session> ss,String msg){
        for(int i=0;i<ss.size();i++){
            Session session =ss.get(i);
            //System.out.println("广播到"+session.getId()+"内容:"+msg);
            
            try {
                //广播
                session.getBasicRemote().sendText(msg);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    public IUserService getUserService() {
        return userService;
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }
}

