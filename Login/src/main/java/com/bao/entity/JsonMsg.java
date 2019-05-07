package com.bao.entity;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GenshenWang.nomico
 * @date 2018/3/7.
 */
public class JsonMsg {

    private int code;
    private String msg;
    private List<Uau> list;
    private Map<String, Object> extendInfo = new HashMap<>();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtendInfo() {
        return extendInfo;
    }

    public void setExtendInfo(Map<String, Object> extendInfo) {
        this.extendInfo = extendInfo;
    }

    public List<Uau> getList() {
        return list;
    }

    public void setList(List<Uau> list) {
        this.list = list;
    }

    public static JsonMsg success(){
        JsonMsg res = new JsonMsg();
        res.setCode(200);
        res.setMsg("操作成功！");
        return res;
    }

    public static JsonMsg fail(){
        JsonMsg res = new JsonMsg();
        res.setCode(100);
        res.setMsg("操作失败！");
        return res;
    }
    
    public static JsonMsg noSession(){
        JsonMsg res = new JsonMsg();
        res.setCode(1);
        res.setMsg("验证码无效");
        return res;
    }


    public static JsonMsg aUser(){
        JsonMsg res = new JsonMsg();
        res.setCode(2);
        res.setMsg("用户已存在");
        return res;
    }


    public static JsonMsg nullJson(){
        JsonMsg res = new JsonMsg();
        res.setCode(0);
        res.setMsg("");
        return res;
    }
    
    
    public static JsonMsg setuaulist(List<Uau> list){
        JsonMsg res = new JsonMsg();
        res.setList(list);
        res.setMsg("");
        return res;
    }
    
    
}
