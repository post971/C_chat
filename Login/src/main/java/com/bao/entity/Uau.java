package com.bao.entity;

public class Uau {
    private String username;
    private String tousername;
    private String context;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTousername() {
        return tousername;
    }

    public void setTousername(String tousername) {
        this.tousername = tousername;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    @Override
    public String toString() {
        return "Uau{" +
                "username='" + username + '\'' +
                ", tousername='" + tousername + '\'' +
                ", context='" + context + '\'' +
                '}';
    }
}
