package com.ruoyi.system.service;

import com.ruoyi.bigtian.domain.Attachment;
import org.springframework.web.multipart.MultipartFile;

/**
 * @program: RuoYi-Vue
 * @description:
 * @author: bigtian
 * @create: 2022-05-24 09:28
 * @since 4.9.0
 */
public interface IAliOssService {


    /**
     * 上传文件
     *
     * @param file 文件
     * @return String   oss文件地址
     * @author bigtian
     * @createTime 2022/5/24 09:41
     * @since 6.0
     */
    Attachment uploadFile(MultipartFile file);

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
    Attachment uploadFile(String baseDir, MultipartFile file);

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
    Attachment uploadFile(MultipartFile file, String fileName);

    /**
     * 根据url删除文件
     *
     * @param url 文件url
     * @author bigtian
     * @createTime 2022/5/26 13:39
     * @since 6.0
     */
    void deleteFile(String url);
}
