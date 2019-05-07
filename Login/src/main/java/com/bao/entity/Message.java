package com.bao.entity;


import com.google.gson.Gson;

import java.util.Date;
import java.util.List;

public class Message {
    private String context;
    private List<String> usernames;
    private List<String> contextlist;
    
    
    public String getContext() {
        return context;
    }

    public void setContext(String name,String msg) {
        this.context = name+"%"+msg;
    }
    public List<String> getUsernames() {
        return usernames;
    }

    public void setUsernames(List<String> usernames) {
        this.usernames = usernames;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public List<String> getContextlist() {
        return contextlist;
    }

    public void setContextlist(List<String> contextlist) {
        this.contextlist = contextlist;
    }

    public Message(){
        super();
    }
    
    public String toJson(){
        return gson.toJson(this);
    }
    
    public static Gson gson=new Gson();
    
}
