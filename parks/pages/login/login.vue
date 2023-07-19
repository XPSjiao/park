<template>
	<view>
		<view class="logo text-align-center">
			<image src="https://bigdai.oss-cn-hangzhou.aliyuncs.com/logo.png" mode=""></image>
		</view>
		<view class=" text-align-center mt-50">
			<text style="font-size: 30px;">实时车位小程序</text>
			<text class="d-block mt-20 text-grey">让您轻松出行，停车无忧</text>
		</view>
		<view class="" style="position: relative; bottom: -200px;">
			<!-- #ifdef MP-WEIXIN -->
			<tm-button openType="getUserInfo" @getUserInfo="login" icon="icon-weixin" icon-size="45" block
				width="80%">微信登录</tm-button>
			<!-- #endif -->
		</view>
		<tm-message ref="toast"></tm-message>
		<tm-poup v-model="show" position="bottom" :over-close='false' height="100%">
			<tm-sheet :padding="[32,32]" :shadow="0">
				<view style="margin-top: 200px;">
					<button class="avatar-wrapper" open-type="chooseAvatar" @chooseavatar="onChooseAvatar">
						<image class="avatar" :src="user.avatarUrl"></image>
					</button>
					<input type="nickname" @blur="toIndex" id="nickname-input" class="weui-input" placeholder="请输入昵称" />
				</view>
			</tm-sheet>
		</tm-poup>

	</view>
</template>

<script>
	import rest from '@/commo/login/login.js';
	export default {
		data() {
			return {
				show: false,
				pos: 'center',
				user: {}
			};
		},
		onLoad() {
			this.$initSocket();
			const loginInfo = uni.getStorageSync('token');
			if (loginInfo !== undefined && loginInfo !== null) {
				if (new Date(loginInfo.time) > new Date()) {
					this.$tm.vx.commit('index/setToken', loginInfo.token);
					this.$initSocket();
					uni.switchTab({
						url: '../index/index'
					});
				} else {
					uni.removeStorageSync('token');
				}
			}
		},
		methods: {
			onChooseAvatar(e) {
				const {
					avatarUrl
				} = e.detail
				let than = this

				uni.uploadFile({
					name: 'file',
					url: than.$http.fileUrl+'UrlAnonymous',
					filePath: avatarUrl,
					fail(err) {
						console.log(err);
					},
					success(res) {
						than.user.avatarUrl = 	JSON.parse(res.data).data
					}
				})


			},
			toIndex(e) {
				uni.createSelectorQuery().in(this) // 注意这里要加上 in(this)  
					.select("#nickname-input")
					.fields({
						properties: ["value"],
					})
					.exec((res) => {
						const nickName = res?.[0]?.value
						console.log('昵称', nickName)
						this.user.nickName = nickName
						this.role('teac')
					})

			},
			role(type) {
				let nickName = this.user.nickName
				console.log(nickName);
				if (nickName === '' || nickName === undefined || nickName.length == 0) {
					return
				}
				let user = this.user;
				user.type = type;
				this.$tm.vx.commit('index/setUserInfo', user);
				rest.saveWeChatUserInfo(user).then(res => {
					if (res.code === 200) {
						const nowTime = new Date();
						nowTime.setMinutes(nowTime.getMinutes() + 29);
						nowTime.setHours(nowTime.getHours() + 8);

						uni.setStorageSync('token', {
							time: nowTime,
							token: res.token
						});
						this.$tm.vx.commit('index/setToken', res.token);
						this.$initSocket();
						uni.switchTab({
							url: '../index/index'
						});
					} else {
						this.$refs.toast.show({
							model: 'error',
							label: '查询用户出错了'
						});
					}
				});
			},
			async login(e) {
				let user = e.userInfo;
				user.nickName = ''
				let that = this;
				this.$tm.vx.commit('index/setToken', '');
				let code = await this.getWeChatCode().then(code => {
					rest.getOpenId(code).then(res => {
						user.openId = res.data;
						that.user = user;
						that.show = true;
					});
				});
			},

			getWeChatCode() {
				return new Promise((resolve, reject) => {
					uni.login({
						provider: 'weixin',
						success: res => {
							resolve(res.code);
						}
					});
				});
			}
		}
	};
</script>

<style>
	.logo {
		margin-top: 300rpx;
		/* margin-left: 60rpx; */
	}

	.avatar-wrapper {
		padding: 0;
		width: 56px !important;
		border-radius: 8px;
		margin-top: 40px;
		margin-bottom: 40px;
	}

	.avatar {
		display: block;
		width: 56px;
		height: 56px;
	}
</style>