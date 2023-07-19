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
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 附件对象 t_attachment
 * 
 * @author bigtian
 * @Date 2023-05-08
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@TableName(value = "t_attachment")
public class Attachment  extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    @TableId(type = IdType.ASSIGN_ID)
    @JsonSerialize(using= ToStringSerializer.class)
    private Long id;

    /** 来源id */

    @Excel(name = "来源id")
    @TableField(value = "busi_id")
    private Long busiId;

    /**
     * url地址
     */

    @Excel(name = "url地址")
    @TableField(value = "url")
    private String url;

    @Excel(name = "上传方式：local-本地上传，oss-阿里云oss")
    @TableField(value = "type")
    private String type;

    @Excel(name = "原始名称")
    @TableField(value = "source_name")
    private String sourceName;


}
