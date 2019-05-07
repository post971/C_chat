package com.bao.utils;

import javax.websocket.Endpoint;
import javax.websocket.server.ServerApplicationConfig;
import javax.websocket.server.ServerEndpointConfig;
import java.util.Set;

//运行项目时会自动执行这个类
public class WebSocketConfig implements ServerApplicationConfig {
    //基于注解
    @Override
    public Set<Class<?>> getAnnotatedEndpointClasses(Set<Class<?>> set) {
        System.out.println("sockety通道数量："+set.size());
        return set;
    }
    //基于接口
    @Override
    public Set<ServerEndpointConfig> getEndpointConfigs(Set<Class<? extends Endpoint>> set) {
        return null;
    }

    
}
