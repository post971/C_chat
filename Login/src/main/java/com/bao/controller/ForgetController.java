package com.bao.controller;

import com.bao.entity.JsonMsg;
import com.bao.entity.User;
import com.bao.service.IUserService;
import com.bao.utils.random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/forget")
public class ForgetController {
    @Autowired
    IUserService userService;
    @Autowired
    User user;
    
    @RequestMapping("/haveUser1")
    @ResponseBody//（写到这里要引入jackson-databind包，spring一定是要4.3.9.RELEASE，json一定是2.8.3，否则报错）
    public JsonMsg forget(HttpServletRequest request) throws Exception{
        JsonMsg jsonMsg=null;
        String name=request.getParameter("username");
        String pass=userService.queryPassByUsername(name);
        String email=request.getParameter("email");
        System.out.println(name+"--"+pass);
        if (pass!=null){
            random random=new random();
            random.redom(request,email);

            jsonMsg=JsonMsg.success();
        }
        else{
            jsonMsg=JsonMsg.fail();
        }
        
        return jsonMsg;
    }

    @RequestMapping("/yan2")
    @ResponseBody//（写到这里要引入jackson-databind包，spring一定是要4.3.9.RELEASE，json一定是2.8.3，否则报错）
    public JsonMsg yan(HttpServletRequest request){
        String yan=request.getParameter("yan");
        JsonMsg json;
        HttpSession session=request.getSession();
        //获取session里的验证码
        if(session.getAttribute("Vcode")!=null) {
            String s = session.getAttribute("Vcode").toString();
            if (yan.equals(s)) {
                //返回成功
                json=JsonMsg.success();
            } else {
                //验证码无效
                json=JsonMsg.noSession();
            }
        }
        else{
            //验证码无效
            json=JsonMsg.noSession();
        }
        return json;
    }


    @RequestMapping("/newpass3")
    @ResponseBody//（写到这里要引入jackson-databind包，spring一定是要4.3.9.RELEASE，json一定是2.8.3，否则报错）
    public JsonMsg newPass(HttpServletRequest request){
        String username=request.getParameter("username");
        String password=request.getParameter("newpass");
        System.out.println(username+"---"+password);
        
        user.setUsername(username);
        user.setPassword(password);
        userService.updataPassByUsername(user);
        return JsonMsg.success();
    }
}
