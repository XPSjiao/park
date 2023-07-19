package com.ruoyi.bigtian.mapper;

import java.util.List;
import com.ruoyi.bigtian.domain.Attachment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
/**
 * 附件Mapper接口
 * 
 * @author bigtian
 * @Date 2023-05-08
 */
public interface AttachmentMapper   extends BaseMapper<Attachment>
{
    /**
     * 查询附件
     * 
     * @param id 附件主键
     * @return 附件
     */
    public Attachment selectAttachmentById(Long id);

    /**
     * 查询附件列表
     * 
     * @param attachment 附件
     * @return 附件集合
     */
    public List<Attachment> selectAttachmentList(Attachment attachment);

    /**
     * 新增附件
     * 
     * @param attachment 附件
     * @return 结果
     */
    public int insertAttachment(Attachment attachment);

    /**
     * 修改附件
     * 
     * @param attachment 附件
     * @return 结果
     */
    public int updateAttachment(Attachment attachment);

    /**
     * 删除附件
     * 
     * @param id 附件主键
     * @return 结果
     */
    public int deleteAttachmentById(Long id);

    /**
     * 批量删除附件
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAttachmentByIds(Long[] ids);
}
