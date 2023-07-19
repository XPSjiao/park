package com.ruoyi.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @program: RuoYi-Vue
 * @description:
 * @author: bigtian
 * @create: 2022-04-12 17:09
 */
@Data
@ConfigurationProperties(prefix = "club.bigtian")
@Configuration
public class CustomConfig {
    //小程序appid
    private String appId;
    //小程序secret
    private String appSecret;
    //    获取openId的url
    private String openIdUrl;
    //    获取小程序手机号的url
    private String phoneUrl;
    //获取小程序token
    private String tokenUrl;
    //消息订阅
    private String subscribeUrl;
}
