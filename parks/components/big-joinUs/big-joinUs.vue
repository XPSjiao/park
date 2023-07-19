<template>
  <view>
    <view v-for="item in list" :key="item.id">
      <tm-sheet>
        <view class="">
          <view class="text-weight-b flex flex-between">
            <view>{{ item.title }}</view>
            <view>
              <tm-images :src="item.state==='wait_apply'?waitImg:successImg"
                         :width="80"/>
            </view>
          </view>
          <view class="text-grey text-size-xs">
            反馈时间：{{ item.createTime }}
          </view>
          <view class="text-size-xs text-grey row-hidden mt-10">
            {{item.content}}
          </view>
        </view>
      </tm-sheet>
    </view>
	<view class="pa-50" v-if="list.length == 0"><tm-empty label="暂无数据"></tm-empty></view>
  </view>
</template>

<script>

import TmSheet from "../../tm-vuetify/components/tm-sheet/tm-sheet";

export default {
  name: "big-joinUs",
  components: {TmSheet},
  data() {
    return {}
  },
  props: {
    list: {
      type: Array,
      default: () => []
    },
    successImg: {
      type: String,
      default: () => 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/handlered.png'
    },
    waitImg: {
      type: String,
      default: () => 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/wait_handler.png'
    }
  },
  mounted() {

  },
  methods: {}
}
</script>

<style scoped>
.row-hidden {
  word-break: break-all;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3; /* 这里是超出几行省略 */
  overflow: hidden;
}
</style>