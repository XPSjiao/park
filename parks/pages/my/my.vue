<template>
	<tm-fullView>
		<tm-menubars title="我的" iconColor="white" :showback="false" color="white"></tm-menubars>
		<tm-dialog v-model="show" @confirm="toLogin" content="您还没有登录" confirmText="去登录"></tm-dialog>
		<tm-sheet>
			<tm-listitem shadow="0" color="gray" :left-icon-size="100" :title="user.nickName" label=" " left-icon=""
				show-left-icon round="10" :showRightIcon="false">
				<template v-slot:left>
					<tm-avatar :src="user.avatarUrl"></tm-avatar>
				</template>
			</tm-listitem>
		</tm-sheet>
		<tm-sheet>
			<tm-row>
				<tm-col grid="3" @click="myApplyList">
					<tm-icons size="50" color="green" name="big-shenqing"></tm-icons>
					<p class="text-size-xs mt-10">我的申请</p>
				</tm-col>
				<tm-col grid="3" @click="joinUsList">
					<tm-icons size="50" name="big-shangwuhezuo" color="pink"></tm-icons>
					<p class="text-size-xs mt-10">合作列表</p>
				</tm-col>
				<tm-col grid="3" @click="feedbackList">
					<tm-icons size="50" color="orange" name="big-chulijindu"></tm-icons>
					<p class="text-size-xs mt-10">反馈列表</p>
				</tm-col>
				<tm-col grid="3" @click="orderList">
					<tm-icons size="50" color="pink" name="icon-transanction"></tm-icons>
					<p class="text-size-xs mt-10">订单</p>
				</tm-col>
			</tm-row>
		</tm-sheet>
		<tm-grouplist title="" title-theme="blue text" :shadow="24" :round="10" :padding="[42, 42]">
			<tm-listitem title="申请入住" @click="toApply" left-icon-color="green" left-icon="big-shenqingjiaru"
				show-left-icon></tm-listitem>
			<tm-listitem title="商务合作" left-icon="big-cooperation" @click="joinUs" show-left-icon
				left-icon-color="black"></tm-listitem>
			<tm-listitem title="反馈" left-icon="big-fankuifaqs" @click="feedback" show-left-icon
				left-icon-color="red"></tm-listitem>
		</tm-grouplist>
	</tm-fullView>
</template>

<script>
	import TmImages from '../../tm-vuetify/components/tm-images/tm-images';

	export default {
		components: {
			TmImages
		},
		data() {
			return {
				show: false,
				user: {}
			};
		},
		onLoad() {
			this.user = this.$tm.vx.state().index.userInfo;
		},
		methods: {
			joinUsList() {
				uni.navigateTo({
					url: '/pagesA/joinUsList/joinUsList'
				});
			},
			feedbackList() {
				uni.navigateTo({
					url: '/pagesA/feedBackList/feedBackList'
				});
			},
			orderList(){
				uni.navigateTo({
					url: '/pagesB/orderList/orderList'
				});
			},
			feedback() {
				uni.navigateTo({
					url: '/pagesA/feedback/feedback'
				});
			},
			joinUs() {
				uni.navigateTo({
					url: '/pagesA/joinUs/joinUs'
				});
			},
			myApplyList() {
				uni.navigateTo({
					url: '/pagesA/applyList/applyList'
				});
			},
			toApply() {
				uni.navigateTo({
					url: '/pagesA/apply/apply'
				});
			}
		}
	};
</script>

<style></style>