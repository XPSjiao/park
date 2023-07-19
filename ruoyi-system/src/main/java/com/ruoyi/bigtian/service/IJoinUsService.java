package com.ruoyi.bigtian.service;

import java.util.List;
import com.ruoyi.bigtian.domain.JoinUs;
import com.baomidou.mybatisplus.extension.service.IService;
/**
 * 合同共赢Service接口
 * 
 * @author bigtian
 * @Date 2023-05-08
 */
public interface IJoinUsService   extends IService<JoinUs>
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
     * 批量删除合同共赢
     * 
     * @param ids 需要删除的合同共赢主键集合
     * @return 结果
     */
    public int deleteJoinUsByIds(Long[] ids);

    /**
     * 删除合同共赢信息
     * 
     * @param id 合同共赢主键
     * @return 结果
     */
    public int deleteJoinUsById(Long id);
}
