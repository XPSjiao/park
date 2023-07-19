<template>
  <view>
    <big-feedback :list="list"></big-feedback>
    <tm-message ref="toast"></tm-message>
  </view>
</template>

<script>
import feedback from '@/commo/feedback/index.js';

export default {
  data() {
    return {
      list: [],
      data: {
        createBy: '1',
        pageNum: 1,
        pageSize: 10
      },
      pages: 1,
    };
  },
  onReachBottom() {
    if (this.pages > this.data.pageNum) {
      this.data.pageNum++;
      this.myList();
    }
  },
  mounted() {
    this.myList()
  },
  methods: {
    myList() {
      let than=this
      feedback.myFeedBackList(this.data).then(res => {
        if (res.code === 200) {
          than.list = than.list.concat(res.rows);
          than.pages = res.pages
        } else {
          this.$refs.toast.show({model: 'error', label: res.msg});
        }
      })
    }
  }
};
</script>

<style></style>
