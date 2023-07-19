package com.ruoyi.web.controller.bigtian;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.ruoyi.bigtian.domain.Parks;
import com.ruoyi.bigtian.domain.vo.EntranceVO;
import com.ruoyi.bigtian.domain.vo.ParkVO;
import com.ruoyi.bigtian.service.IAttachmentService;
import com.ruoyi.bigtian.service.IParksService;
import com.ruoyi.common.annotation.AnonymousAccess;
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
import java.util.Arrays;
import java.util.List;

/**
 * 停车场Controller
 *
 * @author bigtian
 * @Date 2023-04-27
 */
@RestController
@RequestMapping("/bigtian/parks")
public class ParksController extends BaseController {
    @Autowired
    private IParksService parksService;


    @Autowired
    private IAttachmentService attachmentService;

    /**
     * 查询停车场列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Parks parks) {
        startPage();
        if (StrUtil.isNotBlank(parks.getCreateBy())) {
            parks.setCreateBy(SecurityUtils.getUserId().toString());
        }
        List<Parks> list = parksService.selectParksList(parks);
        return getDataTable(list);
    }

    /**
     * 导出停车场列表
     */
    @Log(title = "停车场", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Parks parks) {
        List<Parks> list = parksService.selectParksList(parks);
        ExcelUtil<Parks> util = new ExcelUtil<Parks>(Parks.class);
        util.exportExcel(response, list, "停车场数据");
    }

    /**
     * 获取停车场详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(parksService.selectParksById(id));
    }


    /**
     * 新增停车场
     */
    @Log(title = "停车场", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Parks parks) {
        if (StrUtil.isBlank(parks.getAtts())) {
            throw new RuntimeException("停车场图片不能为空");
        }
        parks.setState(Constants.PARK_WAIT_APPLY);
        parks.setResidueVehicleNum(parks.getVehicleNum());
        boolean flag = parksService.save(parks);
        attachmentService.updateByIds(Arrays.asList(parks.getAtts().split(",")), parks.getId());
        return toAjax(flag);
    }

    /**
     * 修改停车场
     */
    @Log(title = "停车场", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Parks parks) {
        if (StrUtil.isBlank(parks.getAtts()) && CollUtil.isEmpty(parksService.getAttachmentIds(parks.getId()))) {
            throw new RuntimeException("停车场图片不能为空");
        }
        parks.setState(Constants.PARK_WAIT_APPLY);
        parks.setResidueVehicleNum(0L);
        parks.setRemark("");
        boolean flag = parksService.updateById(parks);
        attachmentService.updateByIds(Arrays.asList(parks.getAtts().split(",")), parks.getId());
        return toAjax(flag);
    }

    /**
     * 删除停车场
     */
    @Log(title = "停车场", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(parksService.deleteParksByIds(ids));
    }


    /**
     * 获取附近停车场
     *
     * @param parks
     * @return AjaxResult
     * @author bigtian
     * @createTime 2022/5/12 11:34
     * @since 1.0
     */
    @PostMapping("/getNearbyParks")
    public AjaxResult getNearbyParks(@RequestBody ParkVO parks, @RequestHeader("socketId") String socketId) {
        return AjaxResult.success(parksService.getNearbyParks(parks, socketId));
    }


    /**
     * 审核停车场、禁用停车场
     *
     * @param parks
     * @return AjaxResult
     * @author bigtian
     * @createTime 2022/5/12 20:29
     * @since 1.0
     */

    @PutMapping("/applyPark")
    public AjaxResult applyPark(@RequestBody Parks parks) {
        return AjaxResult.success(parksService.applyPark(parks));
    }


    /**
     * 出入场记录（暴露给其他平台调用）
     *
     * @return AjaxResult
     * @author bigtian
     * @createTime 2022/5/25 09:24
     * @since 6.0
     */
    @GetMapping("/entrance")
    @AnonymousAccess
    public AjaxResult entrance(EntranceVO entrance) {
        return AjaxResult.success(parksService.entrance(entrance));
    }

}
