package com.ruoyi.bigtian.service;

/**
 * @description:
 * @author: bigTian
 * @create: 2021-10-25 14:02
 */
public interface SocketIOService {
    //推送的事件
    public static final String PUSH_EVENT = "push_event";

    // 启动服务
    void start() throws Exception;

    // 停止服务
    void stop();

}
