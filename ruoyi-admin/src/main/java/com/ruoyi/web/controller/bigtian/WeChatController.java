package com.ruoyi.web.controller.bigtian;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.WeChatUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: RuoYi-Vue
 * @description: 微信相关接口
 * @author: bigtian
 * @create: 2022-04-12 17:30
 */
@RestController
@Slf4j
public class WeChatController {
    /**
     * 获取微信小程序OpenId
     *
     * @param code
     * @return
     * @since 1.0.0
     */
    @GetMapping("/getOpenId")
    public AjaxResult getOpenId(@RequestParam("code") String code) {
        Object openid = WeChatUtils.getOpenId(code);
        return AjaxResult.success(openid);
    }

    /**
     * 获取微信小程序绑定的手机号码
     *
     * @param code 微信获取手机号开放能力code
     * @return AjaxResult
     * @author bigtian
     * @createTime 2022/5/26 10:44
     * @since 6.0
     */
    @GetMapping("/getPhone")
    public AjaxResult getPhone(@RequestParam("code") String code) {
        Object phone = WeChatUtils.getPhone(code);
        return AjaxResult.success(phone);
    }


}