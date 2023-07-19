<template>
	<view>
		<view class="mt-10" v-for="item in data" :key="item.id" >
			<tm-sheet :margin="[32, 20]">
				<tm-row>
					<tm-col grid="3"><tm-images round="4" :height="200" model="aspectFill" :previmage="false"
							:width="150" :src="item.picUrl"></tm-images></tm-col>
					<tm-col grid="9">
						<view class="text-align-left ml-20 	">
							<view>
								<span class="text-grey">支付人：{{item.nickName}}</span>
							</view>
							<view>
								<span class="text-grey">停车场名称：{{item.parkName}}</span>
							</view>	
							<view>
								<span class="text-grey">支付金额：{{item.price}}</span>
							</view>
							<view>
								<span class="text-grey">支付时间：{{item.createTime}}</span>
							</view>
							
							
						</view>
					</tm-col>
				</tm-row>
				
			</tm-sheet>
		</view>
	</view>
</template>

<script>
	import payOrder from "../../commo/payOrder";

	export default {
		data() {
			return {
				data: []
			}
		},
		mounted() {
			const than = this
			payOrder.list({}).then(res => {
				
				than.data = res.rows
			})
		},
		methods: {

		}
	}
</script>

<style>

</style>