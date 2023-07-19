package com.ruoyi.bigtian.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @program: RuoYi-Vue
 * @description: 查询附近停车场参数
 * @author: bigtian
 * @create: 2023-05-12 11:35
 * @since 4.9.0
 */
@ApiModel(value = "ParkVO", description = "停车场VO")
@Data
public class ParkVO {


    @ApiModelProperty(name = "经度", required = true)
    private BigDecimal longitude;


    @ApiModelProperty(name = "维度", required = true)
    private BigDecimal latitude;


    @ApiModelProperty(name = "距离(单位：KM)", required = true)
    private Integer distance;

}
