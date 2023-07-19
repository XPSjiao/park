package com.ruoyi.bigtian.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 合同共赢对象 t_join_us
 *
 * @author bigtian
 * @Date 2023-05-08
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "t_join_us")
public class JoinUs extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * $column.columnComment
     */
    @TableId(type = IdType.ASSIGN_ID)
    @JsonSerialize(using = ToStringSerializer.class)

    private Long id;

    /**
     * 标题
     */

    @Excel(name = "标题")
    @TableField(value = "title")
    private String title;

    /**
     * 联系人
     */

    @Excel(name = "联系人")
    @TableField(value = "linkman")
    private String linkman;

    /**
     * 手机号
     */

    @Excel(name = "手机号")
    @TableField(value = "phone")
    private String phone;

    /**
     * 详细内容
     */

    @Excel(name = "详细内容")
    @TableField(value = "content")
    private String content;

    /**
     * 状态
     */

    @Excel(name = "状态")
    @TableField(value = "state")
    private String state;

    @Excel(name = "审批意见")
    @TableField(value = "remark",updateStrategy = FieldStrategy.IGNORED)
    private String remark;


    /**
     * 附件个数
     */
    @TableField(exist = false)
    private Long attCount;

    @TableField(exist = false)
    private String atts;

}
