package com.ruoyi.bigtian.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bigtian.domain.Attachment;
import com.ruoyi.bigtian.domain.JoinUs;
import com.ruoyi.bigtian.mapper.JoinUsMapper;
import com.ruoyi.bigtian.service.IAttachmentService;
import com.ruoyi.bigtian.service.IJoinUsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 合同共赢Service业务层处理
 *
 * @author bigtian
 * @Date 2023-05-08
 */
@Service
public class JoinUsServiceImpl extends ServiceImpl<JoinUsMapper, JoinUs> implements IJoinUsService {
    @Autowired
    private JoinUsMapper joinUsMapper;

    @Autowired
    private IAttachmentService attachmentService;

    /**
     * 查询合同共赢
     *
     * @param id 合同共赢主键
     * @return 合同共赢
     */
    @Override
    public JoinUs selectJoinUsById(Long id) {
        JoinUs us = joinUsMapper.selectJoinUsById(id);
        List<String> urls = attachmentService.getByBusiId(us.getId()).stream()
                .map(Attachment::getUrl)
                .collect(Collectors.toList());
        us.setAtts(StrUtil.join(",", urls));
        us.setAttCount((long) urls.size());
        return us;
    }

    /**
     * 查询合同共赢列表
     *
     * @param joinUs 合同共赢
     * @return 合同共赢
     */
    @Override
    public List<JoinUs> selectJoinUsList(JoinUs joinUs) {
        List<JoinUs> list = joinUsMapper.selectJoinUsList(joinUs);
        List<Long> ids = list.stream().map(JoinUs::getId).collect(Collectors.toList());
        if (CollUtil.isNotEmpty(ids)) {
            Map<Long, Long> attMaps = attachmentService.getByBusiIds(ids)
                    .stream()
                    .collect(Collectors.groupingBy(Attachment::getBusiId, Collectors.counting()));
            for (JoinUs us : list) {
                us.setAttCount(attMaps.getOrDefault(us.getId(), 0L));
            }
        }
        return list;
    }

    /**
     * 新增合同共赢
     *
     * @param joinUs 合同共赢
     * @return 结果
     */
    @Override
    public int insertJoinUs(JoinUs joinUs) {
        return joinUsMapper.insertJoinUs(joinUs);
    }

    /**
     * 修改合同共赢
     *
     * @param joinUs 合同共赢
     * @return 结果
     */
    @Override
    public int updateJoinUs(JoinUs joinUs) {
        return joinUsMapper.updateJoinUs(joinUs);
    }

    /**
     * 批量删除合同共赢
     *
     * @param ids 需要删除的合同共赢主键
     * @return 结果
     */
    @Override
    public int deleteJoinUsByIds(Long[] ids) {
        return joinUsMapper.deleteJoinUsByIds(ids);
    }

    /**
     * 删除合同共赢信息
     *
     * @param id 合同共赢主键
     * @return 结果
     */
    @Override
    public int deleteJoinUsById(Long id) {
        return joinUsMapper.deleteJoinUsById(id);
    }
}
