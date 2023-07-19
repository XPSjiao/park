package com.ruoyi.web.controller.bigtian;

import com.ruoyi.bigtian.domain.Attachment;
import com.ruoyi.bigtian.service.IAttachmentService;
import com.ruoyi.common.annotation.AnonymousAccess;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.service.IAliOssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 附件Controller
 *
 * @author bigtian
 * @Date 2023-05-08
 */
@RestController
@RequestMapping("/bigtian/attachment")
public class AttachmentController extends BaseController {
    @Autowired
    private IAttachmentService attachmentService;

    @Autowired
    private IAliOssService aliOssService;

    /**
     * 上传图片到阿里云OSS，返回附件id
     *
     * @param file 上传文件
     * @return AjaxResult
     * @author bigtian
     * @createTime 2023/4/27 14:14
     * @since 6.0
     */
    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file) {
        try {
            Attachment attachment = aliOssService.uploadFile(file);
            AjaxResult ajax = AjaxResult.success();
            ajax.put("id", attachment.getId().toString());
            ajax.put("data", attachment.getUrl());
            return ajax;
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 上传图片到阿里云OSS，返回附件url
     *
     * @param file 上传文件
     * @return AjaxResult
     * @author bigtian
     * @createTime 2023/4/27 14:14
     * @since 6.0
     */
    @PostMapping("/uploadUrl")
    public AjaxResult uploadUrl(MultipartFile file) {
        try {
            Attachment attachment = aliOssService.uploadFile(file);
            Object url = attachment.getUrl();
            return AjaxResult.success(url);
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    @PostMapping("/uploadUrlAnonymous")
    @AnonymousAccess
    public AjaxResult uploadUrlAnonymous(MultipartFile file) {
        try {
            Attachment attachment = aliOssService.uploadFile(file);
            AjaxResult ajax = AjaxResult.success();
            ajax.put("id", attachment.getId().toString());
            ajax.put("data", attachment.getUrl());
            return ajax;
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }
    /**
     * 查询附件列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Attachment attachment) {
        startPage();
        List<Attachment> list = attachmentService.selectAttachmentList(attachment);
        return getDataTable(list);
    }

    /**
     * 导出附件列表
     */
    @Log(title = "附件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Attachment attachment) {
        List<Attachment> list = attachmentService.selectAttachmentList(attachment);
        ExcelUtil<Attachment> util = new ExcelUtil<Attachment>(Attachment.class);
        util.exportExcel(response, list, "附件数据");
    }

    /**
     * 获取附件详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return AjaxResult.success(attachmentService.selectAttachmentById(id));
    }

    /**
     * 新增附件
     */
    @Log(title = "附件", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Attachment attachment) {
        return toAjax(attachmentService.save(attachment));
    }

    /**
     * 修改附件
     */
    @Log(title = "附件", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Attachment attachment) {
        return toAjax(attachmentService.updateById(attachment));
    }

    /**
     * 删除附件
     */
    @Log(title = "附件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(attachmentService.deleteAttachmentByIds(ids));
    }

    /**
     * 根据ur删除附件
     *
     * @param url 附件url
     * @return AjaxResult
     * @author bigtian
     * @createTime 2022/5/23 23:24
     * @since 6.0
     */
    @Log(title = "附件", businessType = BusinessType.DELETE)
    @DeleteMapping("/del")
    public AjaxResult removeByUrl(@RequestBody Attachment attachment) {
        return toAjax(attachmentService.deleteAttachmentByUrl(attachment.getUrl()));
    }


}

