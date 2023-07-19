<template>
  <view>
    <big-feedback :list="list" type="join"></big-feedback>
  </view>
</template>

<script>
import joinUs from "../../commo/joinUs";
export default {
  components: {},

  data() {
    return {
      list: [],
      data: {
        createBy: '1',
        pageNum: 1,
        pageSize: 10
      },
      pages: 1,
    }
  },
  onReachBottom() {
    if (this.pages > this.data.pageNum) {
      this.data.pageNum++;
      this.myList();
    }
  },
  onShow() {
    this.list=[]
    this.myList()
  },
  methods: {
    myList() {
      let than = this
      joinUs.myFeedBackList(this.data).then(res => {
        if (res.code === 200) {
          than.list = than.list.concat(res.rows);
          than.pages = res.pages
        } else {
          this.$refs.toast.show({model: 'error', label: res.msg});
        }
      })
    }
  }
}
</script>

<style>

</style>
