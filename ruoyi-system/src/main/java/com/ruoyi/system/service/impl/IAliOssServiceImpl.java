package com.ruoyi.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.PutObjectRequest;
import com.ruoyi.bigtian.domain.Attachment;
import com.ruoyi.bigtian.service.IAttachmentService;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.system.service.IAliOssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * @program: RuoYi-Vue
 * @description:
 * @author: bigtian
 * @create: 2022-05-24 09:29
 * @since 4.9.0
 */
@Service
public class IAliOssServiceImpl implements IAliOssService {

    @Autowired
    private RuoYiConfig ruoYiConfig;

    @Autowired
    private IAttachmentService attachmentService;


    /**
     * 获取OSSClient
     *
     * @return OSS
     * @author bigtian
     * @createTime 2022/5/24 11:01
     * @since 6.0
     */
    public OSS getOssClient() {
        String endpoint = "https://" + ruoYiConfig.getEndpoint();
        // 阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户。
        String accessKeyId = ruoYiConfig.getAccessKeyId();
        String accessKeySecret = ruoYiConfig.getAccessKeySecret();
        // 填写Bucket名称，例如examplebucket。
        String bucketName = ruoYiConfig.getBucketName();
        // 创建OSSClient实例。
        return new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
    }

    /**
     * 上传文件
     *
     * @param file 文件
     * @return String  oss文件地址
     * @author bigtian
     * @createTime 2022/5/24 09:41
     * @since 6.0
     */
    @Override
    public Attachment uploadFile(MultipartFile file) {
        Attachment attachment = upload(file, FileUploadUtils.extractFilename(file));
        attachment.setCreateBy("WechatUser");
        attachmentService.save(attachment);
        return attachment;
    }

    /**
     * 上传文件
     *
     * @param file    文件
     * @param baseDir 文件存放路径
     * @return String   oss文件地址
     * @author bigtian
     * @createTime 2022/5/24 09:41
     * @since 6.0
     */
    @Override
    public Attachment uploadFile(String baseDir, MultipartFile file) {
        // Endpoint以华东1（杭州）为例，其它Region请按实际情况填写。
        Attachment attachment = upload(file, FileUploadUtils.extractFilename(file), baseDir);
        attachmentService.save(attachment);
        return attachment;
    }

    /**
     * 上传文件
     *
     * @param file     文件
     * @param fileName 文件名称
     * @return String  oss文件地址
     * @author bigtian
     * @createTime 2022/5/24 09:41
     * @since 6.0
     */
    @Override
    public Attachment uploadFile(MultipartFile file, String fileName) {
        Attachment attachment = upload(file, fileName);
        attachmentService.save(attachment);
        return attachment;
    }


    private Attachment upload(MultipartFile file, String fileName, String... baseDir) {
        // Endpoint以华东1（杭州）为例，其它Region请按实际情况填写。
        OSS ossClient = null;
        try {
            String url;
            String type;
            if (StrUtil.isEmpty(ruoYiConfig.getBucketName())) {
                //如果没有传入上传地址，则使用默认地址
                if (baseDir.length == 0) {
                    url = FileUploadUtils.upload(file, fileName);
                } else {
                    url = FileUploadUtils.upload(baseDir[0], file);
                }
                type = "local";
            } else {
                ossClient = getOssClient();
                PutObjectRequest putObjectRequest = new PutObjectRequest(ruoYiConfig.getBucketName(), fileName, file.getInputStream());
                ossClient.putObject(putObjectRequest);
                url = StrUtil.format("https://{}.{}/{}", ruoYiConfig.getBucketName(), ruoYiConfig.getEndpoint(), fileName);
                type = "oss";
            }
            Attachment build = Attachment.builder()
                    .url(url)
                    .sourceName(fileName)
                    .type(type)
                    .build();
            return build;
        } catch (Exception oe) {
            oe.printStackTrace();
        } finally {
            if (ossClient != null) {
                ossClient.shutdown();
            }
        }
        return null;
    }

    /**
     * 根据url删除文件
     *
     * @param fileName 文件名称
     * @author bigtian
     * @createTime 2022/5/26 13:39
     * @since 6.0
     */
    @Override
    public void deleteFile(String fileName) {
        if (StrUtil.isEmpty(fileName)) {
            throw new RuntimeException("文件名不能为空");
        }
        OSS ossClient = getOssClient();
        ossClient.deleteObject(ruoYiConfig.getBucketName(), fileName);
        ossClient.shutdown();
    }
}
