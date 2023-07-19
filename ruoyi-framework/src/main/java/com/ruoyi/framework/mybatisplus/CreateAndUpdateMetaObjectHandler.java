package com.ruoyi.framework.mybatisplus;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.ruoyi.common.utils.SecurityUtils;
import org.apache.ibatis.reflection.MetaObject;

import java.util.Date;

/**
 * MP注入处理器
 *
 * @author Lion Li
 * @date 2021/4/25
 */
public class CreateAndUpdateMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        String simpleName = metaObject.getOriginalObject().getClass().getSimpleName();
        //根据属性名字设置要填充的值
        this.setFieldValByName("createTime", new Date(), metaObject);
        if (!simpleName.equals("WechatUser")&&!simpleName.equals("SysUser")) {
            try {
                this.setFieldValByName("createBy", SecurityUtils.getUserId().toString(), metaObject);
            } catch (Exception e) {

            }
        }
        updateFills(metaObject, simpleName);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        String simpleName = metaObject.getOriginalObject().getClass().getSimpleName();
        updateFills(metaObject, simpleName);
    }

    private void updateFills(MetaObject metaObject, String simpleName) {
        if (!simpleName.equals("WechatUser")&&!simpleName.equals("SysUser")) {
            try {
                this.setFieldValByName("updateBy", SecurityUtils.getUserId().toString(), metaObject);
            } catch (Exception e) {

            }
        }
        this.setFieldValByName("updateTime", new Date(), metaObject);
    }

}
