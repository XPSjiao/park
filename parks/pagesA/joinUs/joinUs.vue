<template>
  <view>
    <view class="">
      <tm-message ref="toast"></tm-message>
      <tm-form @submit="submit">
        <tm-sheet :shadow="0" :padding="[12, 24]" :margin="[0, 0]">
          <tm-input name="title" focus-show required title="意向" placeholder="请说明来意" :round="2"
                    v-model="reqData.title"></tm-input>
          <tm-input name="linkman" focus-show required title="联系人" placeholder="请输入联系人" :round="2"
                    v-model="reqData.linkman"></tm-input>
          <tm-input name="phone" focus-show input-type="number" required title="手机号" placeholder="请输入手机号" :round="2"
                    v-model.number="reqData.phone">
            <template v-slot:rightBtn>
              <tm-button open-type="getPhoneNumber" :disabled="reqData.phone !== ''" @getphonenumber="getPhoneNumber"
                         size="m">获取手机号
              </tm-button>
            </template>
          </tm-input>
          <tm-sheet dense shadow="0">
            <view class="py-10">
              <tm-icons dense="" size="40" color="red" name="big-bitian"></tm-icons>
              <text class="text-size-n">合作资料</text>
            </view>
            <view class="py-14 mx-12 ">
              <!--      <tm-upload
                  :header="header"
                  :responseStu="responseStu"
                  :url="uploadUrl"
                  code="200"
                  :tips="false"
                  model="aspectFill"
                  name="images"
                  :filelist.sync="reqData.images"
                  autoUpload
                  @del="removeImg"
                  ref="upload"
                  :max="4"
                  :grid="4"
              ></tm-upload> -->
              <tm-uploadfile
                  :filelist.sync="reqData.images"
                  @del="removeImg"
                  code="200"
                  autoUpload
                  ref="upload"
                  :url="uploadUrl"
                  :header="header"
                  :responseStu="responseStu"
              ></tm-uploadfile>
            </view>
          </tm-sheet>

          <view class="pb-n20 mb-n20">
            <tm-input
                :vertical="true"
                required
                focus-show
                :height="150"
                input-type="textarea"
                bg-color="grey-lighten-5"
                :maxlength="200"
                title="详细说明"
                :cursor-spacing="200"
                :showConfirmBar="false"
                :adjust-position="true"
                placeholder="简单说明下合作意向"
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
import attachment from '@/commo/attachment/index.js';
import rest from '@/commo/login/login.js';
import joinUp from '@/commo/joinUs/index.js';

export default {
  data() {
    return {
      show: false,
      reqData: {
        id: undefined,
        phone: '',
        images: [],
        state: 'wait_apply',
      },
      uploadUrl: this.$http.fileUrl,
      header: {
        Authorization: 'Bearer ' + this.$tm.vx.state().index.token
      },
      responseStu: {
        code: 'code', //服务器返回的码的字段名称
        data: 'id', //服务上传成功后返回 的数据字段名称
        msg: 'msg' //服务器响应信息的字段名称。
      }
    };
  },
  onLoad(e) {
    let id = e.id;
    let than = this;
    if (id !== undefined) {
      joinUp.getById(id).then(res => {
        let data = res.data;
        data.images = [];
        if (data.atts !== '' && data.atts !== null) {
          let arr = data.atts.split(',');
          than.$refs.upload.pushFile(arr);
          data.images = arr;
        }
        than.reqData = data;
      });
    }
  },
  methods: {
    removeImg(e) {
      attachment.del({url: e.data});
    },
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
      if (this.reqData.images.length < 1) {
        this.$refs.toast.show({model: 'warn', label: '请上传合同意向书'});
        return;
      }
      this.reqData.atts = this.reqData.images.join(',');
      this.subscribe()
    },
    save() {
      if (this.reqData.id === undefined) {
        joinUp.save(this.reqData).then(res => {
          if (res.code === 200) {
            this.$refs.toast.show({model: 'success', label: '申请成功，我们会尽快与您联系'});
            this.$back();
          } else {
            this.$refs.toast.show({model: 'error', label: res.msg});
          }
        });
      } else {
        this.reqData.atts = this.reqData.images.filter(item => !item.startsWith('http')).join(',');
        this.reqData.state = 'wait_apply'
        this.reqData.remark = ""
        joinUp.update(this.reqData).then(res => {
          if (res.code === 200) {
            this.$refs.toast.show({model: 'success', label: '申请成功，我们会尽快与您联系'});
            this.$back();

          } else {
            this.$refs.toast.show({model: 'error', label: res.msg});
          }
        });
      }
    },
    // 订阅消息
    subscribe() {
      let than = this
      uni.requestSubscribeMessage({
        tmplIds: ['EB1w07QiGlASC-7XCfFv21Dh4pmxY6UqNN9di_x-Z4Y', 'P2CokB6mII5Tqch1KfU6ix6_pqK2Mq23R8hm-jWzgEo'],
        success(res) {
          than.save()
        },
        fail(err) {
          console.log(err);
        }
      });
    }
  }
};
</script>

<style></style>
