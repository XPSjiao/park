<template>
  <view>
    <view v-for="item in list" :key="item.id">
      <tm-sheet>
        <view class="">
          <view class="text-weight-b flex flex-between">
            <view>{{ item.title }}</view>
            <view>
              <tm-images
                  round="4"
                  :previmage="false"
                  :src="type==='feedback'?(item.state==='wait_apply'?waitHanlder:handlered):(item.state === 'wait_apply' ? waitImg : item.state === 'fail_apply' ? failImg : successImg)"
                  :width="80"/>
            </view>
          </view>
          <view class="flex-between flex">
            <view class="text-grey text-size-xs">
              {{ type === 'feedback' ? '反馈日期' : '申请日期' }}：{{ item.createTime }}
            </view>
            <view v-if="type!=='feedback'">
              <tm-tags size="s" model="text">附件：{{ item.attCount }}</tm-tags>
            </view>
          </view>
          <view class="text-size-xs text-grey row-hidden mt-10">
            {{ item.content }}
          </view>
        </view>
        <view class="mt-20 " v-if="item.state === 'fail_apply'">
          <tm-listitem bg-color="bg-grey" shadow="0" dense group title="驳回原因" title-color="red" font-size="24">
            <template v-slot:group>
              <tm-sheet :margin="[0, 0]" :shadow="0" color="red text text-size-s">
                <view>{{ item.remark }}</view>
              </tm-sheet>
              <tm-button  size="m" @click="restApply(item.id)">重新发起</tm-button>
            </template>
          </tm-listitem>

        </view>
      </tm-sheet>
    </view>
	<view class="pa-50" v-if="list.length == 0"><tm-empty label="暂无数据"></tm-empty></view>
	
  </view>
</template>

<script>

import TmSheet from "../../tm-vuetify/components/tm-sheet/tm-sheet";
import TmTags from "../../tm-vuetify/components/tm-tags/tm-tags";

export default {
  name: "big-feedback",
  components: {TmTags, TmSheet},
  data() {
    return {}
  },
  props: {
    type: {
      type: String,
      default: () => "feedback"
    },
    list: {
      type: Array,
      default: () => []
    },
    failImg: {
      type: String,
      default: () => 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/fail.png'
    },
    successImg: {
      type: String,
      default: () => 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/success.png'
    },
    waitImg: {
      type: String,
      default: () => 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/wait.png'
    }, waitHanlder: {
      type: String,
      default: () => 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/wait_handler.png'
    }, handlered: {
      type: String,
      default: () => 'https://bigdai.oss-cn-hangzhou.aliyuncs.com/handlered.png'
    }
  },
  mounted() {

  },
  methods: {
    restApply(id) {
      uni.navigateTo({
        url: `/pagesA/joinUs/joinUs?id=${id}`
      });
    }
  }
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