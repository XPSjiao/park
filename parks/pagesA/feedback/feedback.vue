<template>
  <view>
    <view class="">
      <tm-message ref="toast"></tm-message>
      <tm-form @submit="submit">
        <tm-sheet :shadow="0" :padding="[12, 24]" :margin="[0, 0]">
          <tm-input name="title" focus-show required title="事由" placeholder="请输入事由" :round="2"
                    v-model="reqData.title"></tm-input>
          <tm-input name="phone" focus-show input-type="number" title="回访手机号" placeholder="请输入手机号" :round="2"
                    v-model.number="reqData.phone">
            <template v-slot:rightBtn>
              <tm-button open-type="getPhoneNumber" :disabled="reqData.phone !== ''" @getphonenumber="getPhoneNumber"
                         size="m">获取手机号
              </tm-button>
            </template>
          </tm-input>
          <view class="pb-n20 mb-n20">
            <tm-input
                :vertical="true"
                required
                focus-show
                :height="150"
                input-type="textarea"
                bg-color="grey-lighten-5"
                :maxlength="200"
                title="反馈内容"
                :cursor-spacing="200"
                :showConfirmBar="false"
                :adjust-position="true"
                placeholder="请说明反馈内容"
                v-model="reqData.content"
            ></tm-input>
          </view>
          <view class="px-24  fixed  fulled grey-lighten-5	 pb-n15" style="width: 90%; bottom: 0px;">
            <tm-button navtie-type="form" block>提交申请</tm-button>
          </view>
        </tm-sheet>
      </tm-form>
    </view>
  </view>
</template>

<script>
import feedback from '@/commo/feedback/index.js';
import rest from '@/commo/login/login.js';

export default {
  data() {
    return {
      show: false,
      reqData: {phone: ''},
    };
  },

  methods: {
    getPhoneNumber(e) {
      let than = this;
      rest.getPhone(e.detail.code).then(res => {
        if (res.code === 200) {
          than.reqData.phone = res.data;
        }
      });
    },
    submit(e) {
      if (e === false) {
        this.$refs.toast.show({model: 'warn', label: '请填写必填项'});
        return;
      }
      this.save()
    },
    save() {
      feedback.save(this.reqData).then(res => {
        if (res.code === 200) {
          this.$refs.toast.show({model: 'success', label: '感谢您的宝贵反馈,我们将尽快处理'});
          this.$back();
        } else {
          this.$refs.toast.show({model: 'error', label: res.msg});
        }
      });
    },
  }
};
</script>

<style></style>
