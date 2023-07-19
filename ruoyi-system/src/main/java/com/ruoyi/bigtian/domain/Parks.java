package com.ruoyi.bigtian.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * 停车场对象 t_parks
 *
 * @author bigtian
 * @Date 2023-04-27
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "t_parks")
@ApiModel(value = "Parks对象", description = "停车场对象")
public class Parks extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * $column.columnComment
     */
    @TableId(type = IdType.ASSIGN_ID)
    @JsonSerialize(using = ToStringSerializer.class)
    @ApiModelProperty("id")
    private Long id;

    /**
     * 停车场名称
     */

    @Excel(name = "停车场名称")
    @TableField(value = "name")
    @ApiModelProperty("停车场名称")
    private String name;

    /**
     * 联系人
     */

    @Excel(name = "联系人")
    @TableField(value = "linkman")
    @ApiModelProperty("联系人")
    private String linkman;

    /**
     * 手机号
     */

    @Excel(name = "手机号")
    @TableField(value = "phone")
    @ApiModelProperty("手机号")
    private String phone;

    /**
     * 车位
     */

    @Excel(name = "车位")
    @TableField(value = "vehicle_num")
    @ApiModelProperty("车位")
    private Long vehicleNum;

    /**
     * 剩余车位
     */

    @Excel(name = "剩余车位")
    @TableField(value = "residue_vehicle_num")
    @ApiModelProperty("剩余车位")
    private Long residueVehicleNum;

    /**
     * 经度
     */

    @Excel(name = "经度")
    @TableField(value = "longitude")
    @ApiModelProperty("经度")
    private String longitude;

    /**
     * 维度
     */

    @Excel(name = "维度")
    @TableField(value = "latitude")
    @ApiModelProperty("维度")
    private String latitude;

    /**
     * 标签
     */

    @Excel(name = "标签")
    @TableField(value = "tags")
    @ApiModelProperty("标签")
    private String tags;

    /**
     * 收费标准
     */

    @Excel(name = "收费标准")
    @TableField(value = "rates")
    @ApiModelProperty("收费标准")
    private String rates;

    /**
     * 状态
     */

    @Excel(name = "状态")
    @TableField(value = "state")
    @ApiModelProperty("状态")
    private String state;

    /**
     * 地图名称
     */

    @Excel(name = "地图名称")
    @TableField(value = "point_name")
    @ApiModelProperty("地图名称")
    private String pointName;

    /**
     * 详细地址
     */

    @Excel(name = "详细地址")
    @TableField(value = "point_detail")
    @ApiModelProperty("详细地址")
    private String pointDetail;

    @Excel(name = "文本收费标准")
    @TableField(value = "text_content")
    @ApiModelProperty("文本收费标准")
    private String textContent;

    @TableField(value = "remark", updateStrategy = FieldStrategy.IGNORED)
    private String remark;

    @TableField(value="price")
    @ApiModelProperty("价格/h")
    private BigDecimal price;

    @TableField(exist = false)
    @ApiModelProperty(value = "距离")
    private Double distance;

    @TableField(exist = false)
    @ApiModelProperty(value = "附件url")
    private String atts;


}
