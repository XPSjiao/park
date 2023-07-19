package com.ruoyi.web.controller.bigtian;

import cn.hutool.core.util.StrUtil;
import com.ruoyi.bigtian.domain.JoinUs;
import com.ruoyi.bigtian.service.IAttachmentService;
import com.ruoyi.bigtian.service.IJoinUsService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

/**
 * 合同共赢Controller
 * 
 * @author bigtian
 * @Date 2023-05-08
 */
@RestController
@RequestMapping("/bigtian/joinUs")
public class JoinUsController extends BaseController
{
    @Autowired
    private IJoinUsService joinUsService;

    @Autowired
    private IAttachmentService attachmentService;


    /**
     * 查询合同共赢列表
     */
    @GetMapping("/list")
    public TableDataInfo list(JoinUs joinUs)
    {
        if (StrUtil.isNotBlank(joinUs.getCreateBy())) {
            joinUs.setCreateBy(SecurityUtils.getUserId().toString());
        }
        startPage();
        List<JoinUs> list = joinUsService.selectJoinUsList(joinUs);
        return getDataTable(list);
    }

    /**
     * 导出合同共赢列表
     */
    @Log(title = "合同共赢", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, JoinUs joinUs)
    {
        List<JoinUs> list = joinUsService.selectJoinUsList(joinUs);
        ExcelUtil<JoinUs> util = new ExcelUtil<JoinUs>(JoinUs.class);
        util.exportExcel(response, list, "合同共赢数据");
    }

    /**
     * 获取合同共赢详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(joinUsService.selectJoinUsById(id));
    }

    /**
     * 新增合同共赢
     */
    @Log(title = "合同共赢", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody JoinUs joinUs)
    {
        boolean flag = joinUsService.save(joinUs);
        attachmentService.updateByIds(Arrays.asList(joinUs.getAtts().split(",")), joinUs.getId());
        return toAjax(flag);
    }

    /**
     * 修改合同共赢
     */
    @Log(title = "合同共赢", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody JoinUs joinUs)
    {
        return toAjax(joinUsService.updateById(joinUs));
    }

    /**
     * 删除合同共赢
     */
    @Log(title = "合同共赢", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(joinUsService.deleteJoinUsByIds(ids));
    }
}
