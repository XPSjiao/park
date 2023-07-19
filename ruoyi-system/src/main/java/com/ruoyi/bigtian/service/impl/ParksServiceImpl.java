package com.ruoyi.bigtian.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.smallbun.screw.core.Configuration;
import cn.smallbun.screw.core.engine.EngineConfig;
import cn.smallbun.screw.core.engine.EngineFileType;
import cn.smallbun.screw.core.engine.EngineTemplateType;
import cn.smallbun.screw.core.execute.DocumentationExecute;
import cn.smallbun.screw.core.process.ProcessConfig;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.bigtian.domain.Attachment;
import com.ruoyi.bigtian.domain.Parks;
import com.ruoyi.bigtian.domain.vo.EntranceVO;
import com.ruoyi.bigtian.domain.vo.ParkVO;
import com.ruoyi.bigtian.mapper.ParksMapper;
import com.ruoyi.bigtian.service.IAttachmentService;
import com.ruoyi.bigtian.service.IParksService;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.RedisConstants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.WeChatUtils;
import com.ruoyi.system.service.ISysUserService;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.geo.*;
import org.springframework.data.redis.connection.RedisGeoCommands;
import org.springframework.data.redis.core.GeoOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Driver;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 停车场Service业务层处理
 *
 * @author bigtian
 * @Date 2023-04-27
 */
@Service
public class ParksServiceImpl extends ServiceImpl<ParksMapper, Parks> implements IParksService {
    @Autowired
    private ParksMapper parksMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private IAttachmentService attachmentService;

    @Autowired
    private SocketIOServiceImpl socketIOService;

    @Autowired
    private ISysUserService sysUserService;

    /**
     * 查询停车场
     *
     * @param id 停车场主键
     * @return 停车场
     */
    @Override
    public Parks selectParksById(Long id) {
        Parks parks = parksMapper.selectParksById(id);
        parks.setAtts(StrUtil.join(",", getAttachmentIds(id)));
        return parks;
    }


    /**
     * 查询停车场列表
     *
     * @param parks 停车场
     * @return 停车场
     */
    @Override
    public List<Parks> selectParksList(Parks parks) {

        List<Parks> parksList = parksMapper.selectParksList(parks);
        Map<Long, String> urlMap = attachmentService.getAttacUrlList(parksList.stream().map(Parks::getId).collect(Collectors.toList()));
        for (Parks parks1 : parksList) {
            parks1.setAtts(urlMap.getOrDefault(parks1.getId(), ""));
        }
        return parksList;
    }


    /**
     * 新增停车场
     *
     * @param parks 停车场
     * @return 结果
     */
    @Override
    public int insertParks(Parks parks) {
        return parksMapper.insertParks(parks);
    }

    /**
     * 修改停车场
     *
     * @param parks 停车场
     * @return 结果
     */
    @Override
    public int updateParks(Parks parks) {
        return parksMapper.updateParks(parks);
    }

    /**
     * 批量删除停车场
     *
     * @param ids 需要删除的停车场主键
     * @return 结果
     */
    @Override
    public int deleteParksByIds(Long[] ids) {
        return parksMapper.deleteParksByIds(ids);
    }

    /**
     * 删除停车场信息
     *
     * @param id 停车场主键
     * @return 结果
     */
    @Override
    public int deleteParksById(Long id) {
        return parksMapper.deleteParksById(id);
    }

    /**
     * 查询附近的停车场
     *
     * @param parks
     * @return List<Parks>
     * @author bigtian
     * @createTime 2022/5/12 11:41
     * @since 1.0
     */
    @Override
    public List<Parks> getNearbyParks(ParkVO parks, String socketId) {
        Map<Long, Double> parksMap = new HashMap<>();
        GeoOperations<String, Long> geo = redisTemplate.opsForGeo();
        RedisGeoCommands.GeoRadiusCommandArgs geoRadiusCommandArgs = RedisGeoCommands.GeoRadiusCommandArgs.newGeoRadiusArgs().sortAscending()// 排序
                .includeDistance();// 距离
        Circle circle = new Circle(new Point(parks.getLongitude().doubleValue(), parks.getLatitude().doubleValue()), new Distance(parks.getDistance(), RedisGeoCommands.DistanceUnit.KILOMETERS));
        GeoResults<RedisGeoCommands.GeoLocation<Long>> radius = geo.radius(RedisConstants.PARK_GEO, circle, geoRadiusCommandArgs);
        //从redis中拿附近停车场数据
        for (GeoResult<RedisGeoCommands.GeoLocation<Long>> result : radius.getContent()) {
            parksMap.put(result.getContent().getName(), Math.ceil(result.getDistance().getValue() * 1000));
        }
        List<Parks> list = new ArrayList<>();
        if (CollUtil.isNotEmpty(parksMap)) {
            list = getByIds(parksMap.keySet());
            Map<Long, String> urlMap = attachmentService.getAttacUrlList(parksMap.keySet());
            for (Parks park : list) {
                park.setDistance(parksMap.get(park.getId()));
                park.setAtts(urlMap.getOrDefault(park.getId(), ""));
            }
        }
        //距离排序
        list.sort(Comparator.comparing(Parks::getDistance));

        //当前用户定位缓存至redis中，方便做实时通知剩余车位
        redisTemplate.opsForGeo().add(RedisConstants.PARK_USERS, new Point(parks.getLongitude().doubleValue(), parks.getLatitude().doubleValue()), socketId);
        return list;
    }


    /**
     * 根据停车场id集合查询停车场信息
     *
     * @param ids 停车场id集合
     * @return List<Parks>
     * @author bigtian
     * @createTime 2022/5/12 16:50
     * @since 1.0
     */
    @Override
    public List<Parks> getByIds(Collection<Long> ids) {
        if(CollUtil.isEmpty(ids)){
            return new ArrayList<>();
        }
        LambdaQueryWrapper<Parks> wrapper = Wrappers.<Parks>lambdaQuery()
                .gt(Parks::getResidueVehicleNum, 0L)
                .in(Parks::getId, ids);
        return list(wrapper);
    }


    /**
     * 审核停车场、禁用停车场
     *
     * @param parks
     * @return AjaxResult
     * @author bigtian
     * @createTime 2022/5/12 20:29
     * @since 1.0
     */
    @Override
    public boolean applyPark(Parks parks) {
        boolean flag = updateById(parks);
        parks = getById(parks.getId());
        GeoOperations<String, Long> geo = redisTemplate.opsForGeo();
        //审核通过、把停车场添加到redis中
        if (Constants.PARK_STATUS.equals(parks.getState())) {
            geo.add(RedisConstants.PARK_GEO, new Point(Double.parseDouble(parks.getLongitude()),
                    Double.parseDouble(parks.getLatitude())), parks.getId());
            parks.setResidueVehicleNum(parks.getVehicleNum());
            flag = updateById(parks);
            success(parks);
        } else {
            //禁用、删除redis中的停车场
            geo.remove(RedisConstants.PARK_GEO, parks.getId());
            fail(parks);
        }
        return flag;
    }

    /**
     * 发送小程序审核通过订阅消息
     *
     * @param parks
     * @author bigtian
     * @createTime 2022/5/26 12:34
     * @since 6.0
     */
    public void success(Parks parks) {
        Map<String, String> params = new HashMap<>();

        // 审核类型
        params.put("thing1", "停车场审核");
        //项目名称
        params.put("thing2", parks.getName());
        //   审核状态
        params.put("phrase3", "审核通过");
        //申请时间
        params.put("time6", DateUtil.format(parks.getUpdateTime(), "yyyy年MM月dd日 HH:mm"));
        //审核时间
        params.put("time4", DateUtil.format(new Date(), "yyyy-MM-dd HH:mm"));
        //   备注
        params.put("thing10", "恭喜您，您的停车场审核已通过！");
        //    消息模板id
        params.put("templateId", "P2CokB6mII5Tqch1KfU6ix6_pqK2Mq23R8hm-jWzgEo");
        //    接收人
        SysUser user = sysUserService.selectUserById(Long.parseLong(parks.getCreateBy()));
        params.put("openId", user.getUserName());
        WeChatUtils.subscribe(params);
    }

    /**
     * 发送小程序驳回订阅消息
     *
     * @param parks
     * @author bigtian
     * @createTime 2022/5/26 12:34
     * @since 6.0
     */
    public void fail(Parks parks) {
        Map<String, String> params = new HashMap<>();

        // 审核类型
        params.put("thing1", "停车场审核");
        //项目名称
        params.put("thing2", parks.getName());
        //   审核状态
        params.put("phrase3", "审核不通过");
        //审核时间
        params.put("time4", DateUtil.format(new Date(), "yyyy-MM-dd HH:mm"));
        //   备注
        params.put("thing5", parks.getRemark());
        //    消息模板id
        params.put("templateId", "EB1w07QiGlASC-7XCfFv21Dh4pmxY6UqNN9di_x-Z4Y");
        //    接收人
        SysUser user = sysUserService.selectUserById(Long.parseLong(parks.getCreateBy()));
        params.put("openId", user.getUserName());
        params.put("page", "/pagesA/apply/apply?id=" + parks.getId());
        params.put("type", "1");
        WeChatUtils.subscribe(params);
    }

    /**
     * 出入场记录（暴露给其他平台调用）
     *
     * @param entrance
     * @return boolean
     * @author bigtian
     * @createTime 2022/5/25 09:30
     * @since 6.0
     */
    @Override
    public boolean entrance(EntranceVO entrance) {
        LambdaUpdateWrapper<Parks> wrapper = Wrappers.<Parks>lambdaUpdate()
                .setSql(Constants.PARK_IN.equals(entrance.getType()), "residue_vehicle_num= residue_vehicle_num - 1")
                .setSql(Constants.PARK_OUT.equals(entrance.getType()), "residue_vehicle_num= residue_vehicle_num + 1")
                .gt(Constants.PARK_IN.equals(entrance.getType()), Parks::getResidueVehicleNum, 0L)

                .eq(Parks::getId, entrance.getParkId());
        boolean flag = update(wrapper);
        if (flag) {
            //同步更新客户剩余车位数
            Parks parks = selectParksById(entrance.getParkId());
            GeoOperations<String, String> geo = redisTemplate.opsForGeo();
            RedisGeoCommands.GeoRadiusCommandArgs geoRadiusCommandArgs = RedisGeoCommands.GeoRadiusCommandArgs.newGeoRadiusArgs();
            Circle circle = new Circle(new Point(Double.parseDouble(parks.getLongitude()), Double.parseDouble(parks.getLatitude())), new Distance(1, RedisGeoCommands.DistanceUnit.KILOMETERS));
            GeoResults<RedisGeoCommands.GeoLocation<String>> radius = geo.radius(RedisConstants.PARK_USERS, circle, geoRadiusCommandArgs);
            //从redis中拿附近用户数据
            List<String> socketIds = new ArrayList<>();
            for (GeoResult<RedisGeoCommands.GeoLocation<String>> result : radius.getContent()) {
                socketIds.add(result.getContent().getName());
            }
            socketIOService.sendParks(socketIds, parks);
        }
        return flag;
    }

    /**
     * 根据停车场id查询附件
     *
     * @param id
     * @return Collection<Object>
     * @author bigtian
     * @createTime 2022/6/10 20:59
     * @since 6.0
     */
    @Override
    public Collection<String> getAttachmentIds(Long id) {
        return attachmentService.getByBusiId(id).stream()
                .map(Attachment::getUrl)
                .collect(Collectors.toList());

    }
}