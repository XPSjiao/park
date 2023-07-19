package com.ruoyi.bigtian.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bigtian.domain.WechatUser;
import com.ruoyi.bigtian.mapper.WechatUserMapper;
import com.ruoyi.bigtian.service.IWechatUserService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * 微信用户Service业务层处理
 *
 * @author bigtian
 * @Date 2023-05-08
 */
@Service
public class WechatUserServiceImpl extends ServiceImpl<WechatUserMapper, WechatUser> implements IWechatUserService {
    @Autowired
    private WechatUserMapper wechatUserMapper;

    @Autowired
    private ISysUserService userService;

    /**
     * 查询微信用户
     *
     * @param id 微信用户主键
     * @return 微信用户
     */
    @Override
    public WechatUser selectWechatUserById(Long id) {
        return wechatUserMapper.selectWechatUserById(id);
    }

    /**
     * 查询微信用户列表
     *
     * @param wechatUser 微信用户
     * @return 微信用户
     */
    @Override
    public List<WechatUser> selectWechatUserList(WechatUser wechatUser) {
        return wechatUserMapper.selectWechatUserList(wechatUser);
    }

    /**
     * 新增微信用户
     *
     * @param wechatUser 微信用户
     * @return 结果
     */
    @Override
    public int insertWechatUser(WechatUser wechatUser) {
        return wechatUserMapper.insertWechatUser(wechatUser);
    }

    /**
     * 修改微信用户
     *
     * @param wechatUser 微信用户
     * @return 结果
     */
    @Override
    public int updateWechatUser(WechatUser wechatUser) {
        return wechatUserMapper.updateWechatUser(wechatUser);
    }

    /**
     * 批量删除微信用户
     *
     * @param ids 需要删除的微信用户主键
     * @return 结果
     */
    @Override
    public int deleteWechatUserByIds(Long[] ids) {
        return wechatUserMapper.deleteWechatUserByIds(ids);
    }

    /**
     * 删除微信用户信息
     *
     * @param id 微信用户主键
     * @return 结果
     */
    @Override
    public int deleteWechatUserById(Long id) {
        return wechatUserMapper.deleteWechatUserById(id);
    }

    /**
     * 根据openId判断是否存在
     *
     * @param openId 微信用户openId
     * @return boolean
     * @author bigtian
     * @createTime 2022/5/22 16:43
     * @since 1.0
     */
    @Override
    public boolean existWechatUser(String openId) {
        LambdaQueryWrapper<WechatUser> wrapper = Wrappers.<WechatUser>lambdaQuery()
                .eq(WechatUser::getOpenId, openId)
                .last("limit 1");
        return this.getOne(wrapper) != null;
    }


    /**
     * 新建用户
     *
     * @param wechatUser
     */
    @Override
    public void regUser(WechatUser wechatUser) {
        wechatUser.setUpdateTime(new Date());
        wechatUser.setCreateTime(new Date());
        save(wechatUser);
        //为每个添加的用户创建一个系统用户
        SysUser user = new SysUser();
        user.setPassword(SecurityUtils.encryptPassword(wechatUser.getOpenId()));
        user.setUserName(wechatUser.getOpenId());
        user.setNickName(wechatUser.getNickName());
        user.setAvatar(wechatUser.getAvatarUrl());
        user.setSex(wechatUser.getGender().toString());
        userService.insertUser(user);
    }

    @Override
    public List<WechatUser> getByIds(Collection<Long> values) {
        LambdaQueryWrapper<WechatUser> wrapper = Wrappers.<WechatUser>lambdaQuery()
                .in(WechatUser::getId, values);
        return list(wrapper);
    }
}
