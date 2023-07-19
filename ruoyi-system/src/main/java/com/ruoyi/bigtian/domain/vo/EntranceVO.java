package com.ruoyi.bigtian.domain.vo;

import lombok.Data;

/**
 * @program: RuoYi-Vue
 * @description: 出入场记录
 * @author: bigtian
 * @create: 2022-05-25 09:25
 * @since 4.9.0
 */
@Data
public class EntranceVO {

    /**
     * 停车场ID
     */
    private Long parkId;

    /**
     * 类型：出场(out)，进场（in）
     */
    private String type;
}
