package com.ruoyi.bigtian.service.impl;

import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.annotation.OnConnect;
import com.corundumstudio.socketio.annotation.OnDisconnect;
import com.ruoyi.bigtian.domain.Parks;
import com.ruoyi.bigtian.service.SocketIOService;
import com.ruoyi.common.constant.RedisConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @description:
 * @author: bigTian
 * @create: 2021-10-25 15:11
 */
@Service
@Slf4j
public class SocketIOServiceImpl implements SocketIOService {

    @Autowired
    private RedisTemplate redisTemplate;
    /**
     * 用来存已连接的客户端
     */
    private final static Map<String, SocketIOClient> USERS_MAP = new ConcurrentHashMap<>();

    //private static UserClient adminUser;
    @Autowired
    private SocketIOServer socketIOServer;


    /**
     * Spring IoC容器创建之后，在加载SocketIOServiceImpl Bean之后启动
     *
     * @throws Exception
     */
    @PostConstruct
    private void autoStartup() throws Exception {
        start();
    }

    /**
     * Spring IoC容器在销毁SocketIOServiceImpl Bean之前关闭,避免重启项目服务端口占用问题
     *
     * @throws Exception
     */
    @PreDestroy
    private void autoStop() throws Exception {
        stop();
    }

    @Override
    public void start() {
                // 监听客户端连接
        socketIOServer.start();
        log.info("SocketIO服务启动成功");
    }


    @Override
    public void stop() {
        if (socketIOServer != null) {
            socketIOServer.stop();
            socketIOServer = null;
            log.info("SocketIO服务停止成功");
        }
    }

    @OnConnect
    public void onConnect(SocketIOClient client) {
        Map<String, List<String>> params = client.getHandshakeData().getUrlParams();
        USERS_MAP.put(client.getSessionId().toString(), client);
        log.info("客户端连接成功，sessionId={}", client.getSessionId());
        System.out.println(USERS_MAP);
    }


    //添加@OnDisconnect事件，客户端断开连接时调用，刷新客户端信息
    @OnDisconnect
    public void onDisconnect(SocketIOClient client) {
        client.disconnect();
        String sessionId = client.getSessionId().toString();
        USERS_MAP.remove(sessionId);
        //移除redis中的信息
        redisTemplate.opsForGeo().remove(RedisConstants.PARK_USERS, sessionId);
        log.info("客户端断开连接，sessionId={}", sessionId);
        System.out.println(USERS_MAP);
    }

    public void sendParks(List<String> ids, Parks parks) {
        for (String id : ids) {
            SocketIOClient client = USERS_MAP.get(id);
            if (client != null) {
                client.sendEvent("park", parks);
            }
        }
    }


}
