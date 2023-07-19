package com.ruoyi.bigtian.service;

import java.util.List;
import com.ruoyi.bigtian.domain.Feedback;
import com.baomidou.mybatisplus.extension.service.IService;
/**
 * 反馈Service接口
 * 
 * @author bigtian
 * @Date 2023-05-08
 */
public interface IFeedbackService   extends IService<Feedback>
{
    /**
     * 查询反馈
     * 
     * @param id 反馈主键
     * @return 反馈
     */
    public Feedback selectFeedbackById(Long id);

    /**
     * 查询反馈列表
     * 
     * @param feedback 反馈
     * @return 反馈集合
     */
    public List<Feedback> selectFeedbackList(Feedback feedback);

    /**
     * 新增反馈
     * 
     * @param feedback 反馈
     * @return 结果
     */
    public int insertFeedback(Feedback feedback);

    /**
     * 修改反馈
     * 
     * @param feedback 反馈
     * @return 结果
     */
    public int updateFeedback(Feedback feedback);

    /**
     * 批量删除反馈
     * 
     * @param ids 需要删除的反馈主键集合
     * @return 结果
     */
    public int deleteFeedbackByIds(Long[] ids);

    /**
     * 删除反馈信息
     * 
     * @param id 反馈主键
     * @return 结果
     */
    public int deleteFeedbackById(Long id);
}
