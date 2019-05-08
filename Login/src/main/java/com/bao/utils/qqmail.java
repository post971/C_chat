package com.bao.utils;
/*qq邮箱发送模型*/
import javax.mail.Address;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
public class qqmail {
    //发件人，发件人密码或者授权码，收件人，抄送人,密送人,发件人名称,邮件主题,邮件内容,收件人名字
    public static void setSend(String send,String pass,String receive,String cReceive,String mReceive,String sender,String subject,String context,String receivename){
        
        Properties props=new Properties();
        props.setProperty("mail.transport.protocol","smtp");//使用协议：smtp
        props.setProperty("mail.smtp.host","smtp.qq.com");//协议地址
        props.setProperty("mai.smtp.port","465");//协议端口
        props.setProperty("mail.smtp.auth","true");//需要授权

        //qq:还需要SSL安全认证
        props.setProperty("mail.smtp.socketFactory","javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback","false");
        props.setProperty("mail.smtp.socketFactory.port","465");

        Session session=Session.getInstance(props);
        //session.setDebug(true);//开启日志
        //创建邮件
        try {
            MimeMessage message=createMimessage(session,send,receive,cReceive,mReceive,sender,subject,context,receivename);
            Transport transport=session.getTransport();//建立链接对象
            transport.connect(send,pass);//建立链接，其中密码以授权码形式写
            transport.sendMessage(message,message.getAllRecipients());
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //
    public static MimeMessage createMimessage(Session session,String send,String receive,String cReceive,String mReceive,String sender,String subject,String context,String receivename) throws Exception{
        MimeMessage message=new MimeMessage(session);
        //邮件，标题，正文，收件人，发件人
        Address address=new InternetAddress(send,sender,"utf-8");
        message.setFrom(address);
        message.setSubject(subject,"UTF-8");
        message.setContent(context,"text/html;charset=utf-8");

        //收件人类型
        message.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(receive,receivename,"utf-8"));
        if(cReceive.trim()!="") 
            message.setRecipient(MimeMessage.RecipientType.CC,new InternetAddress(cReceive,"抄送人","utf-8"));
        if(mReceive.trim()!="") 
            message.setRecipient(MimeMessage.RecipientType.BCC,new InternetAddress(mReceive,"密送人","utf-8"));
        message.setSentDate(new Date());//设置发送时间
        message.saveChanges();
        return message;
    }
}
