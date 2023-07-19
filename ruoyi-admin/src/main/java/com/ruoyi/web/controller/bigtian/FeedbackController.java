package com.ruoyi.web.controller.bigtian;

import cn.hutool.core.util.StrUtil;
import com.ruoyi.bigtian.domain.Feedback;
import com.ruoyi.bigtian.service.IFeedbackService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 反馈Controller
 * 
 * @author bigtian
 * @Date 2023-05-08
 */
@RestController
@RequestMapping("/bigtian/feedback")
public class FeedbackController extends BaseController
{
    @Autowired
    private IFeedbackService feedbackService;

    /**
     * 查询反馈列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Feedback feedback)
    {
        if (StrUtil.isNotBlank(feedback.getCreateBy())) {
            feedback.setCreateBy(SecurityUtils.getUserId().toString());
        }
        startPage();
        List<Feedback> list = feedbackService.selectFeedbackList(feedback);
        return getDataTable(list);
    }

    /**
     * 导出反馈列表
     */
    @Log(title = "反馈", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Feedback feedback)
    {
        List<Feedback> list = feedbackService.selectFeedbackList(feedback);
        ExcelUtil<Feedback> util = new ExcelUtil<Feedback>(Feedback.class);
        util.exportExcel(response, list, "反馈数据");
    }

    /**
     * 获取反馈详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(feedbackService.selectFeedbackById(id));
    }

    /**
     * 新增反馈
     */
    @Log(title = "反馈", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Feedback feedback)
    {
        feedback.setState(Constants.PARK_WAIT_APPLY);
        return toAjax(feedbackService.save(feedback));
    }

    /**
     * 修改反馈
     */
    @Log(title = "反馈", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Feedback feedback)
    {
        return toAjax(feedbackService.updateById(feedback));
    }

    /**
     * 删除反馈
     */
    @Log(title = "反馈", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(feedbackService.deleteFeedbackByIds(ids));
    }
}
