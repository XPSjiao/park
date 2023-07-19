package com.ruoyi.common.utils;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.config.CustomConfig;
import com.ruoyi.common.constant.RedisConstants;
import com.ruoyi.common.utils.spring.SpringUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @program: RuoYi-Vue
 * @description: 微信工具类
 * @author: bigtian
 * @create: 2022-05-26 10:22
 * @since 4.9.0
 */
@Slf4j
public class WeChatUtils {
    private static CustomConfig customConfig = SpringUtils.getBean(CustomConfig.class);
    private static RedisTemplate redisTemplate = SpringUtils.getBean(StringRedisTemplate.class);

    /**
     * 获取小程序token
     *
     * @return String
     * @author bigtian
     * @createTime 2022/5/26 10:25
     * @since 6.0
     */
    public static String getToken() {
        ValueOperations<String, String> valueOperations = redisTemplate.opsForValue();
        String token = valueOperations.get(RedisConstants.WX_TOKEN);
        if (StrUtil.isEmpty(token)) {
            JSONObject jsonObject = JSON.parseObject(HttpUtil.get(customConfig.getTokenUrl()));
            token = jsonObject.getString("access_token");
            valueOperations.set(RedisConstants.WX_TOKEN, token, jsonObject.getLong("expires_in") - 20, TimeUnit.SECONDS);
        }
        return token;
    }

    /**
     * 获取小程序绑定的手机号码
     *
     * @param code 微信获取手机号开放能力code
     * @return String 手机号
     * @author bigtian
     * @createTime 2022/5/26 10:37
     * @since 6.0
     */
    public static String getPhone(String code) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("code", code);
        String body = HttpRequest.post(customConfig.getPhoneUrl() + getToken())
                .body(JSON.toJSONString(params))
                .execute()
                .body();
        String phone = JSON.parseObject(body)
                .getJSONObject("phone_info")
                .getString("purePhoneNumber");
        return phone;
    }

    /**
     * 获取openId
     *
     * @param code 微信获取openId开放能力code
     * @return String openId
     * @author bigtian
     * @createTime 2022/5/26 10:42
     * @since 6.0
     */
    public static String getOpenId(String code) {
        String resultStr = HttpUtil.get(customConfig.getOpenIdUrl() + code);
        JSONObject result = JSON.parseObject(resultStr);
        log.error("微信返回的数据：" + result);
        Assert.isNull(result.getString("errcode"), "获取openId失败");
        String openid = result.getString("openid");
        return openid;
    }


    /**
     * 发送小程序消息订阅消息
     *
     * @param params 参数
     * @return boolean 是否发送成功
     * @author bigtian
     * @createTime 2022/5/26 11:58
     * @since 6.0
     */
    public static boolean subscribe(Map<String, String> params) {
        String url = customConfig.getSubscribeUrl() + getToken();
        Dict data = Dict.create();
        for (Map.Entry<String, String> entry : params.entrySet()) {
            if (entry.getKey().equals("openId") || entry.getKey().equals("templateId") || entry.getKey().equals("page") || entry.getKey().equals("miniprogram_state")) {
                continue;
            }
            data.set(entry.getKey(), Dict.create().set("value", entry.getValue()));
        }

        Dict datas = Dict.create()
                .set("touser", params.get("openId"))
                .set("template_id", params.get("templateId"))
                .set("data", data);
        if (params.containsKey("page")) {
            if (params.containsKey("type")) {
                datas.set("miniprogram_state", "developer");
            }
            datas.set("page", params.get("page"));
        }
        JSONObject jsonObject = JSON.parseObject(HttpUtil.post(url, JSON.toJSONString(datas)));
        log.warn("发送消息返回的数据：{}", jsonObject);
        String errcode = jsonObject.getString("errcode");
        return "0".equals(errcode);
    }

}
