package com.ruoyi.bigtian.mapper;

import java.util.List;
import com.ruoyi.bigtian.domain.PayOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
/**
 * 支付订单Mapper接口
 * 
 * @author bigtian
 * @date 2023-04-18
 */
public interface PayOrderMapper   extends BaseMapper<PayOrder>
{
    /**
     * 查询支付订单
     *
     * @param id 支付订单主键
     * @return 支付订单
     */
    public PayOrder selectPayOrderById(Long id);

    /**
     * 查询支付订单列表
     *
     * @param payOrder 支付订单
     * @return 支付订单集合
     */
    public List<PayOrder> selectPayOrderList(PayOrder payOrder);

    /**
     * 新增支付订单
     *
     * @param payOrder 支付订单
     * @return 结果
     */
    public int insertPayOrder(PayOrder payOrder);

    /**
     * 修改支付订单
     *
     * @param payOrder 支付订单
     * @return 结果
     */
    public int updatePayOrder(PayOrder payOrder);

    /**
     * 删除支付订单
     *
     * @param id 支付订单主键
     * @return 结果
     */
    public int deletePayOrderById(Long id);

    /**
     * 批量删除支付订单
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePayOrderByIds(Long[] ids);
}
