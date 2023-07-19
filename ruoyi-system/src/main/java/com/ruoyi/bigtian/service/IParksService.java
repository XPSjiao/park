package com.ruoyi.bigtian.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.bigtian.domain.Parks;
import com.ruoyi.bigtian.domain.vo.EntranceVO;
import com.ruoyi.bigtian.domain.vo.ParkVO;

import java.util.Collection;
import java.util.List;

/**
 * 停车场Service接口
 *
 * @author bigtian
 * @Date 2023-04-27
 */
public interface IParksService extends IService<Parks> {
    /**
     * 查询停车场
     *
     * @param id 停车场主键
     * @return 停车场
     */
    public Parks selectParksById(Long id);

    /**
     * 查询停车场列表
     *
     * @param parks 停车场
     * @return 停车场集合
     */
    public List<Parks> selectParksList(Parks parks);

    /**
     * 新增停车场
     *
     * @param parks 停车场
     * @return 结果
     */
    public int insertParks(Parks parks);

    /**
     * 修改停车场
     *
     * @param parks 停车场
     * @return 结果
     */
    public int updateParks(Parks parks);

    /**
     * 批量删除停车场
     *
     * @param ids 需要删除的停车场主键集合
     * @return 结果
     */
    public int deleteParksByIds(Long[] ids);

    /**
     * 删除停车场信息
     *
     * @param id 停车场主键
     * @return 结果
     */
    public int deleteParksById(Long id);

    /**
     * 查询附近的停车场
     *
     * @param parks
     * @return List<Parks>
     * @author bigtian
     * @createTime 2022/5/12 11:40
     * @since 1.0
     */
    List<Parks> getNearbyParks(ParkVO parks, String socketId);

    /**
     * 根据停车场id集合查询停车场信息
     *
     * @param ids 停车场id集合
     * @return List<Parks>
     * @author bigtian
     * @createTime 2022/5/12 16:50
     * @since 1.0
     */
    List<Parks> getByIds(Collection<Long> ids);

    /**
     * 审核停车场
     *
     * @param parks
     * @return boolean
     * @author bigtian
     * @createTime 2022/5/12 20:16
     * @since 1.0
     */
    boolean applyPark(Parks parks);

    /**
     * 出入场记录（暴露给其他平台调用）
     *
     * @param entrance
     * @return boolean
     * @author bigtian
     * @createTime 2022/5/25 09:30
     * @since 6.0
     */
    boolean entrance(EntranceVO entrance);

    /**
     * 根据停车场id查询附件
     * @param id
     * @author bigtian
     * @since 6.0
     * @createTime 2022/6/10 20:59
     * @return  Collection<Object>
     */
    Collection<String> getAttachmentIds(Long id);
}
