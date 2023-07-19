package com.ruoyi.bigtian.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bigtian.domain.Attachment;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 附件Service接口
 *
 * @author bigtian
 * @Date 2023-05-08
 */
public interface IAttachmentService extends IService<Attachment> {
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
     * 批量删除附件
     *
     * @param ids 需要删除的附件主键集合
     * @return 结果
     */
    public int deleteAttachmentByIds(Long[] ids);

    /**
     * 删除附件信息
     *
     * @param id 附件主键
     * @return 结果
     */
    public int deleteAttachmentById(Long id);

    /**
     * 根据业务编码查询附件列表
     *
     * @param busiId 业务编码
     * @return List<Attachment>
     * @author bigtian
     * @createTime 2022/5/12 20:00
     * @since 1.0
     */
    List<Attachment> getByBusiId(Long busiId);

    /**
     * 根据业务编码查询附件文件列表
     *
     * @param busiId 业务编码
     * @return List<Attachment>
     * @author bigtian
     * @createTime 2022/5/12 20:00
     * @since 1.0
     */
    List<String> getFilePathsByBusiId(Long busiId);

    /**
     * 根据业务编码修改附件
     *
     * @param attIds 附件id
     * @param busiId 业务编码
     * @author bigtian
     * @createTime 2022/5/23 14:42
     * @since 6.0
     */

    boolean updateByIds(List<String> attIds, Long busiId);

    /**
     * 根据业务编码集合查询附件
     *
     * @param ids 业务编码集合
     * @return List<Attachment>
     * @author bigtian
     * @createTime 2022/5/23 16:18
     * @since 1.0
     */
    List<Attachment> getByBusiIds(Collection<Long> ids);

    /**
     * 根据ids查询附件
     *
     * @param ids 附件id集合
     * @author bigtian
     * @createTime 2022/5/23 16:45
     * @since 1.0
     */
    Map<Long, String> getAttacUrlList(Collection<Long> ids);

    /**
     * 根据附件Url删除附件
     *
     * @param url 附件Url
     * @return int
     * @author bigtian
     * @createTime 2022/5/23 23:25
     * @since 6.0
     */
    Boolean deleteAttachmentByUrl(String url);
}
