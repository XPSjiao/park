package com.ruoyi.bigtian.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bigtian.domain.Attachment;
import com.ruoyi.bigtian.mapper.AttachmentMapper;
import com.ruoyi.bigtian.service.IAttachmentService;
import com.ruoyi.system.service.IAliOssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 附件Service业务层处理
 *
 * @author bigtian
 * @Date 2023-05-08
 */
@Service
public class AttachmentServiceImpl extends ServiceImpl<AttachmentMapper, Attachment> implements IAttachmentService {
    @Autowired
    private AttachmentMapper attachmentMapper;

    @Autowired
    @Lazy
    private IAliOssService aliOssService;

    /**
     * 查询附件
     *
     * @param id 附件主键
     * @return 附件
     */
    @Override
    public Attachment selectAttachmentById(Long id) {
        return attachmentMapper.selectAttachmentById(id);
    }

    /**
     * 查询附件列表
     *
     * @param attachment 附件
     * @return 附件
     */
    @Override
    public List<Attachment> selectAttachmentList(Attachment attachment) {
        return attachmentMapper.selectAttachmentList(attachment);
    }

    /**
     * 新增附件
     *
     * @param attachment 附件
     * @return 结果
     */
    @Override
    public int insertAttachment(Attachment attachment) {
        return attachmentMapper.insertAttachment(attachment);
    }

    /**
     * 修改附件
     *
     * @param attachment 附件
     * @return 结果
     */
    @Override
    public int updateAttachment(Attachment attachment) {
        return attachmentMapper.updateAttachment(attachment);
    }

    /**
     * 批量删除附件
     *
     * @param ids 需要删除的附件主键
     * @return 结果
     */
    @Override
    public int deleteAttachmentByIds(Long[] ids) {
        return attachmentMapper.deleteAttachmentByIds(ids);
    }

    /**
     * 删除附件信息
     *
     * @param id 附件主键
     * @return 结果
     */
    @Override
    public int deleteAttachmentById(Long id) {
        return attachmentMapper.deleteAttachmentById(id);
    }

    /**
     * 根据busiId查询附件列表
     *
     * @param busiId
     * @return List<Attachment>
     * @author bigtian
     * @createTime 2022/5/12 20:00
     * @since 1.0
     */
    @Override
    public List<Attachment> getByBusiId(Long busiId) {
        LambdaQueryWrapper<Attachment> wrapper = Wrappers.<Attachment>lambdaQuery()
                .eq(Attachment::getBusiId, busiId);
        return list(wrapper);
    }

    /**
     * 根据业务编码查询附件文件列表
     *
     * @param busiId 业务编码
     * @return List<Attachment>
     * @author bigtian
     * @createTime 2022/5/12 20:00
     * @since 1.0
     */
    @Override
    public List<String> getFilePathsByBusiId(Long busiId) {
        LambdaQueryWrapper<Attachment> wrapper = Wrappers.<Attachment>lambdaQuery()
                .select(Attachment::getUrl)
                .eq(Attachment::getBusiId, busiId);

        return list(wrapper).stream()
                .map(Attachment::getUrl)
                .collect(Collectors.toList());
    }

    /**
     * 根据业务编码修改附件
     *
     * @param attIds 附件id
     * @param busiId 业务编码
     * @author bigtian
     * @createTime 2022/5/23 14:42
     * @since 1.0
     */
    @Override
    public boolean updateByIds(List<String> attIds, Long busiId) {
        LambdaUpdateWrapper<Attachment> wrapper = Wrappers.<Attachment>lambdaUpdate()
                .set(Attachment::getBusiId, busiId)
                .in(Attachment::getId, attIds);
        return update(wrapper);

    }

    /**
     * 根据业务编码集合查询附件
     *
     * @param ids 业务编码集合
     * @return List<Attachment>
     * @author bigtian
     * @createTime 2022/5/23 16:18
     * @since 1.0
     */
    @Override
    public List<Attachment> getByBusiIds(Collection<Long> ids) {
        LambdaQueryWrapper<Attachment> wrapper = Wrappers.<Attachment>lambdaQuery()
                .in(Attachment::getBusiId, ids);
        return list(wrapper);
    }

    /**
     * 根据ids查询附件
     *
     * @param ids 附件id集合
     * @author bigtian
     * @createTime 2022/5/23 16:45
     * @since 1.0
     */
    @Override
    public Map<Long, String> getAttacUrlList(Collection<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return new HashMap<>();
        }
        return getByBusiIds(ids)
                .stream()
                .collect(Collectors.groupingBy(Attachment::getBusiId, Collectors.mapping(Attachment::getUrl, Collectors.joining(","))));

    }

    /**
     * 根据附件Url删除附件
     *
     * @param url 附件Url
     * @return int
     * @author bigtian
     * @createTime 2022/5/23 23:25
     * @since 6.0
     */
    @Override
    public Boolean deleteAttachmentByUrl(String url) {

        LambdaQueryWrapper<Attachment> wrapper = Wrappers.<Attachment>lambdaQuery()
                .eq(url.startsWith("http"), Attachment::getUrl, url)
                .or()
                .eq(!url.startsWith("http"), Attachment::getId, url);
        Attachment attachment = getOne(wrapper);
        aliOssService.deleteFile(attachment.getSourceName());
        return remove(wrapper);
    }


}
