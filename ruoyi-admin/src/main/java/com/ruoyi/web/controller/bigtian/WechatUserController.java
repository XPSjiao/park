package com.ruoyi.web.controller.bigtian;

import com.ruoyi.bigtian.domain.WechatUser;
import com.ruoyi.bigtian.service.IWechatUserService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.service.SysLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 微信用户Controller
 *
 * @author bigtian
 * @Date 2023-05-08
 */
@RestController
@RequestMapping("/bigtian/wechatUser")
public class WechatUserController extends BaseController {
    @Autowired
    private IWechatUserService wechatUserService;

    @Autowired
    private SysLoginService loginService;

    /**
     * 查询微信用户列表
     */
    @GetMapping("/list")
    public TableDataInfo list(WechatUser wechatUser) {
        startPage();
        List<WechatUser> list = wechatUserService.selectWechatUserList(wechatUser);
        return getDataTable(list);
    }

    /**
     * 新增微信用户
     */
    @PostMapping("/wx/save")
    public AjaxResult save(@RequestBody WechatUser wechatUser) {
        boolean flag = wechatUserService.existWechatUser(wechatUser.getOpenId());
        if (!flag) {
            wechatUserService.regUser(wechatUser);
        }
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(wechatUser.getOpenId(), wechatUser.getOpenId());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 导出微信用户列表
     */
    @Log(title = "微信用户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WechatUser wechatUser) {
        List<WechatUser> list = wechatUserService.selectWechatUserList(wechatUser);
        ExcelUtil<WechatUser> util = new ExcelUtil<WechatUser>(WechatUser.class);
        util.exportExcel(response, list, "微信用户数据");
    }

    /**
     * 获取微信用户详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(wechatUserService.selectWechatUserById(id));
    }

    /**
     * 新增微信用户
     */
    @Log(title = "微信用户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WechatUser wechatUser)
    {
        return toAjax(wechatUserService.save(wechatUser));
    }

    /**
     * 修改微信用户
     */
    @Log(title = "微信用户", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WechatUser wechatUser)
    {
        return toAjax(wechatUserService.updateById(wechatUser));
    }

    /**
     * 删除微信用户
     */
    @Log(title = "微信用户", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(wechatUserService.deleteWechatUserByIds(ids));
    }
}
