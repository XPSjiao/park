<template>
	<view>
		<view class="mt-10" v-for="item in data" :key="item.id" @click="details(item.id)">
			<tm-sheet :margin="[32, 20]">
				<tm-row>
					<tm-col grid="3"><tm-images round="4" :height="200" model="aspectFill" :previmage="false"
							:width="150" :src="item.atts.split(',')[0]"></tm-images></tm-col>
					<tm-col grid="9">
						<view class="text-align-left ml-20 flex-between	">
							<view class="overflow-x text-size-n nowrap text-overflow">{{ item.name }}</view>
							<view v-if="type == 'list'">
								<tm-tags size="xs" class="nowrap"
									model="text">剩余车位：{{ item.residueVehicleNum }}</tm-tags>
								<tm-tags size="xs" class="nowrap"
								color="red"
									model="text">价格：{{ item.price }}元/小时</tm-tags>
							</view>
							<view class="" v-else>
								<tm-images round="4" :previmage="false" :width="80"
									:src="item.state === 'wait_apply' ? waitImg : item.state === 'fail_apply' ? failImg : successImg"></tm-images>
							</view>
						</view>
						<view class="text-align-left ml-20 flex-between	">
							<view class="text-size-xs text-grey">
								<view class="flex-between">
									<view style="width: 40vw;">
										<span class=" text-size-n overflow   text-overflow text-overflow-5">
											<tm-icons color="grey" size="28" class="mr-10"
												name="icon-paper-plane"></tm-icons>
											{{ item.pointDetail }}
										</span>
									</view>
									<view v-if="type == 'list'">
										<tm-tags size="xs" class="nowrap" color="pink"
											model="text">距离：{{ item.distance }}米</tm-tags>
									</view>
								</view>
								<view style="height: 40px">
									<span class="ml-10 text-size-n">收费明细</span>
									<view class="ml-10 row-hidden ">{{ item.textContent }}</view>
								</view>
							</view>
						</view>
					</tm-col>
				</tm-row>
				<view class="mt-20 " v-if="item.state === 'fail_apply'">
					<tm-listitem bg-color="bg-grey" shadow="0" dense group title="驳回原因" title-color="red"
						font-size="24">
						<template v-slot:group>
							<tm-sheet :margin="[0, 0]" :shadow="0" color="red text text-size-s">
								<view>{{ item.remark }}</view>
							</tm-sheet>
							<tm-button size="m" @click="restApply(item.id)">重新发起</tm-button>
						</template>
					</tm-listitem>
				</view>
			</tm-sheet>
		</view>
		<view class="pa-50" v-if="data.length == 0"><tm-empty label="附近暂无实时停车场"></tm-empty></view>
	</view>
</template>

<script>
	export default {
		name: 'big-list',
		props: {
			data: {
				type: Array,
				default: () => []
			},
			type: {
				type: String,
				default: () => 'list'
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
			}
		},
		data() {
			return {};
		},
		methods: {
			restApply(id) {
				this.$emit('reApply', id);
			},
			details(id) {
				this.$emit('detail', id);
			}
		}
	};
</script>

<style>
	.row-hidden {
		word-break: break-all;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
		/* 这里是超出几行省略 */
		overflow: hidden;
	}

	--root {
		--big-color: red;
	}
</style>