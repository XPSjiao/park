package com.ruoyi.bigtian.mapper;

import java.util.List;
import com.ruoyi.bigtian.domain.JoinUs;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
/**
 * 合同共赢Mapper接口
 * 
 * @author bigtian
 * @Date 2023-05-08
 */
public interface JoinUsMapper   extends BaseMapper<JoinUs>
{
    /**
     * 查询合同共赢
     * 
     * @param id 合同共赢主键
     * @return 合同共赢
     */
    public JoinUs selectJoinUsById(Long id);

    /**
     * 查询合同共赢列表
     * 
     * @param joinUs 合同共赢
     * @return 合同共赢集合
     */
    public List<JoinUs> selectJoinUsList(JoinUs joinUs);

    /**
     * 新增合同共赢
     * 
     * @param joinUs 合同共赢
     * @return 结果
     */
    public int insertJoinUs(JoinUs joinUs);

    /**
     * 修改合同共赢
     * 
     * @param joinUs 合同共赢
     * @return 结果
     */
    public int updateJoinUs(JoinUs joinUs);

    /**
     * 删除合同共赢
     * 
     * @param id 合同共赢主键
     * @return 结果
     */
    public int deleteJoinUsById(Long id);

    /**
     * 批量删除合同共赢
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteJoinUsByIds(Long[] ids);
}
