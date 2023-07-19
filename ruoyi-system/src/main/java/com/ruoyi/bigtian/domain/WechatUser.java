package com.ruoyi.bigtian.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 微信用户对象 t_wechat_user
 * 
 * @author bigtian
 * @Date 2023-05-08
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "t_wechat_user")
public class WechatUser  extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    @TableId(type = IdType.ASSIGN_ID)
    @JsonSerialize(using= ToStringSerializer.class)

    private Long id;

    /** 开放者id */

    @Excel(name = "开放者id")
    @TableField(value = "open_id")
    private String openId;

    /** 昵称 */

    @Excel(name = "昵称")
    @TableField(value = "nick_name")
    private String nickName;

    /** 性别 */

    @Excel(name = "性别")
    @TableField(value = "gender")
    private Long gender;

    /** 头像 */

    @TableField(value = "avatar_url")
    private String avatarUrl;

    /** 类型 */

    @Excel(name = "类型")
    @TableField(value = "type")
    private String type;


}
