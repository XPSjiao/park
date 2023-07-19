<template>
	<view>
		<tm-sheet :padding="[0,0]" flat>
			<h1 class="text-weight-b">{{ park.name }}</h1>
			<view class="flex flex-between">
				<view class="text-grey text-size-xs mt-10">
					<tm-icons name="icon-paper-plane" color="grey" />
					<span class="ml-10">{{ park.pointDetail }}</span>
				</view>
				<view> <tm-tags size="xs" class="nowrap" color="red" model="text">价格：{{ park.price }}元/小时</tm-tags>
				</view>
			</view>
		</tm-sheet>
		<tm-swiper :round="6" :margin="32" :autoplay="true" :indicator-dots="true" :list="list"></tm-swiper>
		<p class="ml-10 mb-20 mt-n10" style="height: 20px;">
			<tm-icons size="55" name="big-shuxian1" color="primary"></tm-icons>
			收费标准
		</p>
		<view class="text-grey" style="padding-bottom:60px;">
			<cu-editor v-if="showEditor" :readOnlys="true" :content="park.rates"></cu-editor>
		</view>
		<view class="fixed fulled pb-25 white  shadow-grey-10" style="bottom: 0px;width: 100%;">
			<tm-sheet flat :padding="[0,0]">
				<view class="flex flex-between">
					<tm-button theme="bg-gradient-orange-accent" :round="4" @click="navigator">导 航</tm-button>
					<tm-button v-if="park.state === 'apply_success'" :round="4" @click="pay">支 付</tm-button>
				</view>
			</tm-sheet>
		</view>
		<tm-dialog v-model="show" :content="`确定支付${park.price}元吗？`" title='支付提示' @confirm='payOrder'></tm-dialog>
		<tm-message ref="toast"></tm-message>

	</view>
</template>

<script>
	import TmSheet from "../../tm-vuetify/components/tm-sheet/tm-sheet";
	import TmIcons from "../../tm-vuetify/components/tm-icons/tm-icons";
	import park from "../../commo/park";
	import payOrder from "../../commo/payOrder";
	import cuEditor from '@/components/cu-editor/cu-editor';
	import TmDivider from "../../tm-vuetify/components/tm-divider/tm-divider";

	export default {
		components: {
			TmDivider,
			TmIcons,
			TmSheet,
			cuEditor
		},
		data() {
			return {
				show: false,
				showEditor: false,
				list: [
					'https://picsum.photos/800?jv=34',
					'https://picsum.photos/800?jv=74',
					'https://picsum.photos/800?jv=3',
					'https://picsum.photos/800?jv=5'
				],
				park: {}
			};
		},
		onLoad(e) {
			let than = this
			park.getById(e.id).then(res => {
				than.park = res.data
				than.list = res.data.atts.split(',')
				than.showEditor = true
			})
		},
		methods: {
			payOrder() {
				const data = {
					parkId: this.park.id,
					status: 1
				}
				let than = this
				payOrder.save(data).then(res => {
					if (res.code === 200) {
						than.$refs.toast.show({
							model: 'success',
							label: '支付成功'
						});
						than.subscribe();
					} else {
						than.$refs.toast.show({
							model: 'error',
							label: res.msg
						});
					}
				})
			},
			pay() {
				this.show = true
			},
			navigator() {
				uni.openLocation({
					latitude: parseFloat(this.park.latitude),
					longitude: parseFloat(this.park.longitude),
					name: this.park.name,
					address: this.park.name,
					scale: 28
				})
			}
		}
	};
</script>

<style scoped>
	/deep/ .cu-editor {
		padding-top: 0px !important;
		height: auto !important;
	}
</style>