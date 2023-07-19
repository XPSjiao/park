package com.ruoyi.bigtian.mapper;

import java.util.List;
import com.ruoyi.bigtian.domain.WechatUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
/**
 * 微信用户Mapper接口
 * 
 * @author bigtian
 * @Date 2023-05-08
 */
public interface WechatUserMapper   extends BaseMapper<WechatUser>
{
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
     * 删除微信用户
     * 
     * @param id 微信用户主键
     * @return 结果
     */
    public int deleteWechatUserById(Long id);

    /**
     * 批量删除微信用户
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWechatUserByIds(Long[] ids);
}
