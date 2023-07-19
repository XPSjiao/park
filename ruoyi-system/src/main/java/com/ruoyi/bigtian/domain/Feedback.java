package com.ruoyi.bigtian.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 反馈对象 t_feedback
 *
 * @author bigtian
 * @Date 2023-05-08
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "t_feedback")
public class Feedback extends BaseEntity {
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
     * 描述
     */

    @Excel(name = "描述")
    @TableField(value = "content")
    private String content;

    @Excel(name = "回访手机号")
    @TableField(value = "phone")
    private String phone;

    @Excel(name = "状态",readConverterExp = "wait_apply=待处理,apply_success=已处理")
    @TableField(value = "state")
    private String state;

    @Excel(name = "应对措施")
    @TableField(value = "measure")
    private String measure;


}
