package com.ruoyi.bigtian.service.impl;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.util.ObjectUtil;
import com.ruoyi.bigtian.domain.Parks;
import com.ruoyi.bigtian.domain.WechatUser;
import com.ruoyi.bigtian.service.IParksService;
import com.ruoyi.bigtian.service.IWechatUserService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.bigtian.mapper.PayOrderMapper;
import com.ruoyi.bigtian.domain.PayOrder;
import com.ruoyi.bigtian.service.IPayOrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 支付订单Service业务层处理
 *
 * @author bigtian
 * @date 2023-04-18
 */
@Service
public class PayOrderServiceImpl extends ServiceImpl<PayOrderMapper, PayOrder> implements IPayOrderService {
    @Autowired
    private PayOrderMapper payOrderMapper;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private IParksService parksService;

    /**
     * 查询支付订单
     *
     * @param id 支付订单主键
     * @return 支付订单
     */
    @Override
    public PayOrder selectPayOrderById(Long id) {
        return payOrderMapper.selectPayOrderById(id);
    }

    /**
     * 查询支付订单列表
     *
     * @param payOrder 支付订单
     * @return 支付订单
     */
    @Override
    public List<PayOrder> selectPayOrderList(PayOrder payOrder) {
        List<PayOrder> list = payOrderMapper.selectPayOrderList(payOrder);
        Map<Long, Long> infoMap = list.stream()
                .collect(Collectors.toMap(PayOrder::getParkId, PayOrder::getUserId, (k1, k2) -> k1));
        Map<Long, Parks> parkMap = parksService.getByIds(infoMap.keySet()).stream()
                .collect(Collectors.toMap(Parks::getId, Function.identity(), (k1, k2) -> k1));
        Map<Long, SysUser> userMap = userService.getByIds(infoMap.values()).stream()
                .collect(Collectors.toMap(SysUser::getUserId, Function.identity(), (k1, k2) -> k1));
        list.forEach(el -> {
            SysUser sysUser = userMap.get(el.getUserId());
            if (ObjectUtil.isNotNull(sysUser)) {
                el.setNickName(sysUser.getNickName());
                el.setPicUrl(sysUser.getAvatar());
            }
            Parks parks = parkMap.get(el.getParkId());
            if(ObjectUtil.isNotNull(parks)){
                el.setParkName(parks.getName());
                el.setPrice(parks.getPrice());
            }
        });
        return list;
    }

    /**
     * 新增支付订单
     *
     * @param payOrder 支付订单
     * @return 结果
     */
    @Override
    public int insertPayOrder(PayOrder payOrder) {
        return payOrderMapper.insertPayOrder(payOrder);
    }

    /**
     * 修改支付订单
     *
     * @param payOrder 支付订单
     * @return 结果
     */
    @Override
    public int updatePayOrder(PayOrder payOrder) {
        return payOrderMapper.updatePayOrder(payOrder);
    }

    /**
     * 批量删除支付订单
     *
     * @param ids 需要删除的支付订单主键
     * @return 结果
     */
    @Override
    public int deletePayOrderByIds(Long[] ids) {
        return payOrderMapper.deletePayOrderByIds(ids);
    }

    /**
     * 删除支付订单信息
     *
     * @param id 支付订单主键
     * @return 结果
     */
    @Override
    public int deletePayOrderById(Long id) {
        return payOrderMapper.deletePayOrderById(id);
    }
}
