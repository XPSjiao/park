<template>
  <view>
    <map
        :show-location="showLocation"
        id="MapTm"
        ref="MapTm"
        :controls="controls"
        @regionchange="mapMove"
        :markers="markers"
        :enable-poi="true"
        :scale="scales"
        :polyline="polyline"
        :min-scale="minScale"
        :max-scale="maxScale"
        :enable-building="enableBuilding"
        :latitude="currentLocation.latitude"
        :longitude="currentLocation.longitude"
        @markertap="markerClick"
        @controltap="controlClick"
        :enable-zoom="enableZoom"
        :enable-scroll="enableScroll"
        :style="{ width: `${width}%`, height: `${height}rpx` }"
    >
      <!-- 	<cover-view 	:style="{ width: `${width}%`, height: `${height}rpx` }" >
      <cover-image src="/static/location.png" style="width: 32px;height: 32px;" />
    </cover-view> -->
    </map>
  </view>
</template>

<script>
export default {
  name: 'big-map',
  props: {
    enableZoom: {
      type: Boolean,
      default: true
    },
    moveCurrentPosition: {
      type: Boolean,
      default: false
    },
    enableBuilding: {
      type: Boolean,
      default: false
    },
    showLocation: {
      type: Boolean,
      default: true
    },

    markers: {
      type: Array,
      default: () => []
    },
    width: {
      type: Number,
      default: 100
    },
    scale: {
      type: Number,
      default: 14
    },
    height: {
      type: Number,
      default: 500
    },
    enableScroll: {
      type: Boolean,
      default: true
    },
    minScale: {
      type: Number,
      default: 10
    },
    maxScale: {
      type: Number,
      default: 20
    },
    polyline: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      scales: this.scale,
      controls: [
        {
          //在地图上显示控件
          id: 'center', //控件id
          iconPath: '/static/location.png', //显示的图标
          position: {
            //控件在地图的位置
            left: this.width * 1.61,
            top: this.height / 4 + (this.height > 450 ? 5 : -5),
            width: 32,
            height: 32
          }
        },
        {
          //在地图上显示控件
          id: 'dingwei', //控件id
          iconPath: '/static/current.png', //显示的图标
          position: {
            //控件在地图的位置
            left: this.width * 3.1,
            top: this.height / 2.5,
            width: 32,
            height: 32
          },
          clickable: true
        }
      ],
      //当前位置
      currentLocation: {
        latitude: 0,
        longitude: 0
      },
      map: {}
    };
  },
  mounted() {
    this.map = uni.createMapContext('MapTm', this);
    //this.mapContext是地图对象

    let that = this;
    wx.startLocationUpdate({
      success: res => {
        wx.onLocationChange(res => that.listener(res));
      }
    });

    this.mapCenterLocation();
  },
  methods: {
    //打开第三方地图准备导航
    openMap(latitude, longitude, title) {
      this.map.openMapApp({
        latitude: latitude, //目标地址的纬度
        longitude: longitude, //目标地址的经度
        destination: title, //目标地址详情（将显示在弹出框顶部）
        success() {
          console.log('success');
        },
        fail(err) {
          console.log(err);
          console.log('fail');
        },
        complete() {
          console.log('complete');
        }
      });
    },
    getCurrentLocation() {
      return this.currentLocation;
    },
    listener(res) {
      this.currentLocation = {
        latitude: res.latitude,
        longitude: res.longitude
      };
      wx.offLocationChange(res => this.listener(res));
      wx.stopLocationUpdate({
        success() {
          console.log('关闭');
        }
      });
      this.$emit('position', this.currentLocation);
    },
    controlClick(e) {
      if (e.detail.controlId === 'dingwei') {
        this.moveCurrentLocation();
      }
    },
    // 获取地图中心点
    mapCenterLocation() {
      let than = this;
      this.map.getCenterLocation({
        success: res => {
          console.log(res);
        },
        fail: err => {
          console.log(err);
        }
      });
    },
    mapClick() {
      //地图被点击 this.mapCenter
    },
    markerClick(e) {
      this.scales = 16;
      this.$emit('markerClick', e);
    },
    moveCurrentLocation() {
      let than = this;
      wx.vibrateShort({
        success() {
        }
      });
      this.map.moveToLocation(this.mapCenter);
      this.map.getScale({
        success: res => {
          than.scales = res.scale;
          than.$nextTick(() => {
            than.scales = 14;
          });
        }
      });
      this.$emit('back');
    },
    mapMove(e) {
      if (e.detail.type === 'end') {
        this.$emit('move', e.detail.centerLocation);
      }
    }
  }
};
</script>

<style></style>
