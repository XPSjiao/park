package com.ruoyi.bigtian.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.bigtian.domain.PayOrder;
import com.ruoyi.bigtian.service.IPayOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 支付订单Controller
 *
 * @author bigtian
 * @date 2023-04-18
 */
@RestController
@RequestMapping("/bigtian/payOrder")
@Api(value = "支付订单", tags = "支付订单")
public class PayOrderController extends BaseController {
    @Autowired
    private IPayOrderService payOrderService;

    /**
     * 查询支付订单列表
     */
    @GetMapping("/list")
    @ApiOperation(value = "查询支付订单列表", notes = "查询支付订单列表")
    public TableDataInfo list(PayOrder payOrder) {
        startPage();
        List<PayOrder> list = payOrderService.selectPayOrderList(payOrder);
        return getDataTable(list);
    }

    /**
     * 导出支付订单列表
     */
    @Log(title = "支付订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation(value = "导出支付订单列表", notes = "导出支付订单列表")
    public void export(HttpServletResponse response, PayOrder payOrder) {
        List<PayOrder> list = payOrderService.selectPayOrderList(payOrder);
        ExcelUtil<PayOrder> util = new ExcelUtil<PayOrder>(PayOrder.class);
        util.exportExcel(response, list, "支付订单数据");
    }

    /**
     * 获取支付订单详细信息
     */
    @GetMapping(value = "/{id}")
    @ApiOperation(value = "获取支付订单详细信息", notes = "获取支付订单详细信息")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(payOrderService.selectPayOrderById(id));
    }

    /**
     * 新增支付订单
     */
    @Log(title = "支付订单", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation(value = "新增支付订单", notes = "新增支付订单")
    public AjaxResult add(@RequestBody PayOrder payOrder) {
        payOrder.setUserId(SecurityUtils.getUserId());
        payOrder.setCreateTime(new Date());
        return toAjax(payOrderService.save(payOrder));
    }

    /**
     * 修改支付订单
     */
    @Log(title = "支付订单", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation(value = "修改支付订单", notes = "修改支付订单")
    public AjaxResult edit(@RequestBody PayOrder payOrder) {
        return toAjax(payOrderService.updateById(payOrder));
    }

    /**
     * 删除支付订单
     */
    @Log(title = "支付订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @ApiOperation(value = "删除支付订单", notes = "删除支付订单")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(payOrderService.deletePayOrderByIds(ids));
    }
}
