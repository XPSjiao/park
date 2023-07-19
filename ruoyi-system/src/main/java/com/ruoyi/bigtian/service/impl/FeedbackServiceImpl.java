package com.ruoyi.bigtian.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.bigtian.mapper.FeedbackMapper;
import com.ruoyi.bigtian.domain.Feedback;
import com.ruoyi.bigtian.service.IFeedbackService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
/**
 * 反馈Service业务层处理
 * 
 * @author bigtian
 * @Date 2023-05-08
 */
@Service
public class FeedbackServiceImpl  extends ServiceImpl< FeedbackMapper, Feedback> implements IFeedbackService
{
    @Autowired
    private FeedbackMapper feedbackMapper;

    /**
     * 查询反馈
     * 
     * @param id 反馈主键
     * @return 反馈
     */
    @Override
    public Feedback selectFeedbackById(Long id)
    {
        return feedbackMapper.selectFeedbackById(id);
    }

    /**
     * 查询反馈列表
     * 
     * @param feedback 反馈
     * @return 反馈
     */
    @Override
    public List<Feedback> selectFeedbackList(Feedback feedback)
    {
        return feedbackMapper.selectFeedbackList(feedback);
    }

    /**
     * 新增反馈
     * 
     * @param feedback 反馈
     * @return 结果
     */
    @Override
    public int insertFeedback(Feedback feedback)
    {
        return feedbackMapper.insertFeedback(feedback);
    }

    /**
     * 修改反馈
     * 
     * @param feedback 反馈
     * @return 结果
     */
    @Override
    public int updateFeedback(Feedback feedback)
    {
        return feedbackMapper.updateFeedback(feedback);
    }

    /**
     * 批量删除反馈
     * 
     * @param ids 需要删除的反馈主键
     * @return 结果
     */
    @Override
    public int deleteFeedbackByIds(Long[] ids)
    {
        return feedbackMapper.deleteFeedbackByIds(ids);
    }

    /**
     * 删除反馈信息
     * 
     * @param id 反馈主键
     * @return 结果
     */
    @Override
    public int deleteFeedbackById(Long id)
    {
        return feedbackMapper.deleteFeedbackById(id);
    }
}
