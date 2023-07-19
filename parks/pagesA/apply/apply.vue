<template>
	<view class="">
		<tm-message ref="toast"></tm-message>
		<tm-dialog v-model="showDialog" @confirm="confirmClose" content="还没有保存,确定关闭吗？"></tm-dialog>

		<tm-form @submit="submit">
			<tm-sheet :shadow="0" :padding="[12, 24]" :margin="[0, 0]">
				<tm-input name="name" focus-show required title="名称" placeholder="请输入停车场名称" :round="2" v-model="reqData.name"></tm-input>
				<tm-input name="linkman" focus-show required title="联系人" placeholder="请输入联系人" :round="2" v-model="reqData.linkman"></tm-input>
				<tm-input name="phone" focus-show input-type="number" required title="手机号" placeholder="请输入手机号" :round="2" v-model.number="reqData.phone">
					<template v-slot:rightBtn>
						<tm-button open-type="getPhoneNumber" class="text-white" :disabled="reqData.phone !== ''" @getphonenumber="getPhoneNumber" size="m">获取手机号</tm-button>
					</template>
				</tm-input>
				<tm-input name="price" focus-show input-type="number" required title="价格" placeholder="请输入价格每小时" :round="2" v-model.number="reqData.price"/>
				
				<tm-input name="vehicleNum" focus-show input-type="number" required title="车位" placeholder="请输入车位" :round="2" v-model.number="reqData.vehicleNum"></tm-input>
				<tm-input
					name="pointName"
					required
					title="位置"
					placeholder="请选择停车场位置"
					@click="showMap"
					:round="2"
					disabled
					v-model="reqData.pointName"
					right-icon="icon-angle-right"
				></tm-input>
				<tm-input name="point_detail" focus-show placeholder="如带出的地址不对,请手动修改" required title="详细地址" :round="2" v-model="reqData.pointDetail"></tm-input>
				<tm-sheet dense shadow="0">
					<view class="py-12 px-24 mx-12 round-3 border-b-1 grey text" :class="tmVuetify.black ? 'bk' : ''">
						<text class="text-size-n text-weight-b ">场内图片</text>
						<text class="text-grey text-size-xs px-10">（需上传4张)</text>
					</view>
					<view class="py-10">
						<tm-icons dense="" size="40" color="red" name="big-bitian"></tm-icons>
						<text class="text-size-n">场内图片</text>
					</view>
					<view class="py-14 mx-12 ">
						<tm-upload
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
						></tm-upload>
					</view>
				</tm-sheet>

				<view class="pb-n20 mb-n20">
					<tm-input
						:vertical="true"
						required
						@click="edit"
						focus-show
						:height="150"
						input-type="textarea"
						bg-color="grey-lighten-5"
						:maxlength="200"
						title="收费标准"
						:cursor-spacing="200"
						:showConfirmBar="false"
						:adjust-position="true"
						placeholder="简单介绍下收费标准~~"
						v-model="reqData.textContent"
						disabled
					></tm-input>
				</view>
				<tm-poup :value="showPoup" position="bottom" height="100%" round="0">
					<cu-editor
						ref="editor"
						v-if="showPoup"
						placeholder="请输入收费标准"
						:url="editUploadUrl"
						:header="header"
						:content="content"
						:readOnlys="false"
						@before="onUploadBefore"
						@update="onUpdate"
						@close="editClose"
						:showImgToolbar="true"
						:showImgResize="true"
						:showImgSize="true"
						@save="onSave"
					></cu-editor>
				</tm-poup>
				<view class="px-24  fixed  fulled grey-lighten-5	 pb-n15" style="width: 90%; bottom: 0px;"><tm-button navtie-type="form" block>提交申请</tm-button></view>
			</tm-sheet>
		</tm-form>
	</view>
</template>

<script>
import park from '@/commo/park/index.js';
import attachment from '@/commo/attachment/index.js';
import TmPoup from '../../tm-vuetify/components/tm-poup/tm-poup';
import cuEditor from '@/components/cu-editor/cu-editor';
import rest from '@/commo/login/login.js';
export default {
	components: { TmPoup, cuEditor },
	data() {
		return {
			show: false,
			reqData: {
				id: undefined,
				pointName: '',
				images: [],
				rates: '',
				phone: ''
			},
			showDialog: false,
			showPoup: false,
			uploadUrl: this.$http.fileUrl,
			editUploadUrl: this.$http.fileUrl + 'Url',
			header: {
				Authorization: 'Bearer ' + this.$tm.vx.state().index.token
			},
			content: '',
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
			park.getById(id).then(res => {
				let data = res.data;
				data.images = [];
				if (data.atts !== '') {
					let arr = data.atts.split(',');
					// than.$refs.upload.pushFile(arr);
					data.images = arr;
				}
				than.reqData = data;
				than.content = data.rates;
			});
		}
	},
	methods: {
		editClose() {
			this.showDialog = true;
		},
		confirmClose() {
			this.showPoup = false;
		},
		getPhoneNumber(e) {

			let than = this;
			rest.getPhone(e.detail.code).then(res => {
				if (res.code === 200) {
					than.reqData.phone = res.data;
				}
			});
		},
		onSave(val) {
			this.reqData.rates = val.html;
			this.showPoup = false;
			this.reqData.textContent = val.text.replaceAll('\n', '');
		},
		onUploadBefore(val) {},
		onUpdate(val) {},
		edit() {
			this.showPoup = true;
			//uni.navigateTo({
			//  url: '/pagesB/parkContent/parkContent'
			//});
		},
		removeImg(e) {
			attachment.del({ url: e.data });
		},
		showMap() {
			let than = this;
			uni.chooseLocation({
				success: function(res) {
					than.reqData.pointName = res.name;
					than.reqData.pointDetail = res.address;
					than.reqData.latitude = res.latitude;
					than.reqData.longitude = res.longitude;
				}
			});
		},
		submit(e) {
			if (e === false) {
				this.$refs.toast.show({ model: 'warn', label: '请填写必填项' });
				return;
			}
			if (this.reqData.images.length < 4) {
				this.$refs.toast.show({ model: 'warn', label: '场内图片至少4张图片' });
				return;
			}
			this.reqData.atts = this.reqData.images.join(',');
			this.reqData.residueVehicleNum = this.reqData.vehicleNum;
			if (this.reqData.id === undefined) {
				park.save(this.reqData).then(res => {
					if (res.code === 200) {
						this.$refs.toast.show({ model: 'success', label: '申请成功，我们会尽快审核' });
						this.subscribe();
					} else {
						this.$refs.toast.show({ model: 'error', label: res.msg });
					}
				});
			} else {
				this.reqData.atts = this.reqData.images.filter(item => !item.startsWith('http')).join(',');
				park.update(this.reqData).then(res => {
					if (res.code === 200) {
						this.$refs.toast.show({ model: 'success', label: '申请成功，我们会尽快审核' });
						this.subscribe();
					} else {
						this.$refs.toast.show({ model: 'error', label: res.msg });
					}
				});
			}
		},
		// 订阅消息
		subscribe() {
			let than = this;
			uni.requestSubscribeMessage({
				tmplIds: ['EB1w07QiGlASC-7XCfFv21Dh4pmxY6UqNN9di_x-Z4Y', 'P2CokB6mII5Tqch1KfU6ix6_pqK2Mq23R8hm-jWzgEo'],
				success(res) {
					than.$back();
				},
				fail(err) {}
			});
		}
	}
};
</script>

<style></style>
