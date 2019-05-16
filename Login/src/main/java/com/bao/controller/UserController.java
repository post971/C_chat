package com.bao.controller;

import com.bao.entity.JsonMsg;
import com.bao.entity.Uau;
import com.bao.entity.User;
import com.bao.service.IUserService;
import com.bao.utils.random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
/*登录*/
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
   /* userService不用在applicationContext配了，因为这里是控制器，
    变成控制器的同时已经将本身加入了ioc中
    所以再在applicationcontex配会运行出错*/
    private IUserService userService;
    @Autowired
    private User user;

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }


    
    //登录
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody//返回json一定要加这个，否则返回不了
    public JsonMsg login(HttpServletRequest request) {

        String name = request.getParameter("username");
        String pass = request.getParameter("password");


        //是否进入管理者模式
        if ("admin".equals(name) && "admin".equals(pass)) {
            return JsonMsg.admin();
        } else {
            User user = userService.queryUserByName(name);


            ModelAndView mv = new ModelAndView();
            mv.addObject("users", user);
            if(user==null){
                return JsonMsg.nullJson();
            }else if (pass.equals(user.getPassword())) {
                return JsonMsg.success();
            }else {
                return JsonMsg.fail();
            }
        }
    }


    
    //注册
    @RequestMapping(value = "register", method = RequestMethod.POST)
    @ResponseBody//（写到这里要引入jackson-databind包，spring一定是要4.3.9.RELEASE，json一定是2.8.3，否则报错）
    public JsonMsg register(HttpServletRequest request) {
        String username = request.getParameter("name");
        String password = request.getParameter("pass");
        String email = request.getParameter("email");
        String yan = request.getParameter("yan");
        HttpSession session = request.getSession();
        JsonMsg json;

        //验证是否用户名是否已存在//有另一种方法直接查询所有校验密码
        String sqlpass = userService.queryPassByUsername(username);

        //System.out.println(session.getAttribute("Vcode"));

        if (sqlpass == null) {
            //校验验证码
            if (session.getAttribute("Vcode") != null) {
                String s = session.getAttribute("Vcode").toString();
                if (yan.equals(s)) {
                    /*增加数据*/
                    user.setId(10);
                    user.setUsername(username);
                    user.setPassword(password);
                    user.setEmail(email);
                    user.setContext("(暂无内容，点击【修改】添加内容)");
                    userService.addUser(user);
                    //返回成功
                    json = JsonMsg.success();
                } else {
                    //验证码无效
                    json = JsonMsg.noSession();
                }
            } else {
                //验证码无效
                json = JsonMsg.noSession();
            }
        } else {
            //用户名已存在
            json = JsonMsg.aUser();
        }
        //返回提示信息
        return json;
    }


    //发送验证码
    @RequestMapping(value = "yan", method = RequestMethod.POST)
    @ResponseBody//（写到这里要引入jackson-databind包，spring一定是要4.3.9.RELEASE，json一定是2.8.3，否则报错）
    public JsonMsg sendYan(HttpServletRequest request) {
        String mail = request.getParameter("emailJson");
        System.out.println(mail);
        //随机验证码code

        random random = new random();
        random.redom(request, mail);
        return JsonMsg.nullJson();
    }


    //删除私信
    @RequestMapping(value = "deletesm", method = RequestMethod.POST)
    @ResponseBody//（写到这里要引入jackson-databind包，spring一定是要4.3.9.RELEASE，json一定是2.8.3，否则报错）
    public JsonMsg deletesm(HttpServletRequest request) {
        String username = request.getParameter("username");
        String tousername = request.getParameter("tousername");
        String context = request.getParameter("context");
        System.out.println(username + "--" + tousername + "--" + context);
        Uau uau = new Uau();
        uau.setUsername(username);
        uau.setTousername(tousername);
        uau.setContext(context);
        userService.deleteUauaByUau(uau);
        return JsonMsg.nullJson();
    }

    
    //admin-删除用户
    @RequestMapping(value = "deleteuser", method = RequestMethod.POST)
    @ResponseBody//（写到这里要引入jackson-databind包，spring一定是要4.3.9.RELEASE，json一定是2.8.3，否则报错）
    public JsonMsg deleteuser(HttpServletRequest request) {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        userService.deleteUser(user);
        return JsonMsg.success();
    }
    
    
    //admin-修改用户
    @RequestMapping("updateuser")
    @ResponseBody//（写到这里要引入jackson-databind包，spring一定是要4.3.9.RELEASE，json一定是2.8.3，否则报错）
    public JsonMsg updateuser(HttpServletRequest request){
        //原来的账号密码
        String username=request.getParameter("username");
        //要修改的账号密码
        String username2=request.getParameter("username2");
        String password2=request.getParameter("password2");
        String email2=request.getParameter("email2");
        //先查找要修改的id
        User user=userService.queryUserByName(username);
        int id=user.getId();
        
        //根据id修改
        User user2=new User();
        user2.setUsername(username2);
        user2.setPassword(password2);
        user2.setEmail(email2);
        user2.setId(id);
        userService.updateUserByUser(user2);
        return JsonMsg.success();
    }
}
