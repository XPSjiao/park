package com.ruoyi.bigtian.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bigtian.domain.WechatUser;

import java.util.Collection;
import java.util.List;

/**
 * 微信用户Service接口
 *
 * @author bigtian
 * @Date 2023-05-08
 */
public interface IWechatUserService extends IService<WechatUser> {
    /**
     * 查询微信用户
     *
     * @param id 微信用户主键
     * @return 微信用户
     */
    public WechatUser selectWechatUserById(Long id);

    /**
     * 查询微信用户列表
     *
     * @param wechatUser 微信用户
     * @return 微信用户集合
     */
    public List<WechatUser> selectWechatUserList(WechatUser wechatUser);

    /**
     * 新增微信用户
     *
     * @param wechatUser 微信用户
     * @return 结果
     */
    public int insertWechatUser(WechatUser wechatUser);

    /**
     * 修改微信用户
     *
     * @param wechatUser 微信用户
     * @return 结果
     */
    public int updateWechatUser(WechatUser wechatUser);

    /**
     * 批量删除微信用户
     *
     * @param ids 需要删除的微信用户主键集合
     * @return 结果
     */
    public int deleteWechatUserByIds(Long[] ids);

    /**
     * 删除微信用户信息
     *
     * @param id 微信用户主键
     * @return 结果
     */
    public int deleteWechatUserById(Long id);

    /**
     * 根据openId判断是否存在
     *
     * @param openId 微信用户openId
     * @return boolean
     * @author bigtian
     * @createTime 2022/5/22 16:43
     * @since 1.0
     */
    boolean existWechatUser(String openId);

    /**
     * 注册微信用户
     *
     * @param wechatUser 用户数据
     * @author bigtian
     * @createTime 2022/5/22 16:45
     * @since 1.0
     */
    void regUser(WechatUser wechatUser);

    List<WechatUser> getByIds(Collection<Long> values);
}
