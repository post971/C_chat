package com.bao.utils;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
public class random {
    public void redom(HttpServletRequest request,String mail) {
        int code=1000+(int)(Math.random()*8999);
        HttpSession session = request.getSession();
        session.setAttribute("Vcode", code);

        session.setMaxInactiveInterval(60);

        /*把验证码发给邮箱*/
        String context="亲爱的用户，您的验证码是"+code+"，60秒内有效，不要告诉别人哦~";
        System.out.println(context);
        
    }
}
