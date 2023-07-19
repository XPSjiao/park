<template>
	<tm-fullView>
		<template v-slot:default="{ info }">
			<view class="grey text pb-10" :class="[$tm.vx.state().tmVuetify.black ? 'black bk' : '']" :style="{ minHeight: info.height + 'px' }">
				<tm-menubars flat title="实时车位" iconColor="white" :showback="false" color="white" />

				<!-- 导航栏结束 -->
				<view class="fixed fulled mb-50 zIndex-22 mt--5">
					<tm-menu @change="menuChange" ref="menu" ment-direction="left" :list="list">
						<tm-search @input="input" :round="10" :show-right="false" v-model="search.keyword" @confirm="confirm"></tm-search>
					</tm-menu>
				</view>
				<view style="margin-top: 60px;">
					<tm-sheet :margin="[32, 32]">
						<big-map
							@back="mapBack"
							@markerClick="markerClick"
							:polyline="polyline"
							:scale="scale"
							:markers="markers"
							@move="mapMove"
							@position="position"
							ref="map"
							:height="300"
						/>
					</tm-sheet>
				</view>
				<p class="ml-10 mb-20 " style="height: 20px;">
					<tm-icons size="55" name="big-shuxian1" color="primary"></tm-icons>
					附近停车场
				</p>
				<view style="height: 50vh;overflow:scroll;"><big-list :data="poiList" @detail="details"></big-list></view>
			</view>
		</template>
		<tm-message ref="toast"></tm-message>
	</tm-fullView>
</template>

<script>
// import bigMap from '@/components/big-map/big-map.nvue'
var QQMapWX = require('@/commo/map/qqmap-wx-jssdk.min.js');
import park from '@/commo/park/index.js';

export default {
	components: {
		// bigMap
	},

	data() {
		return {
			scale: 14,
			checked_1: undefined,
			// 弹框位置
			pos: 'bottom',
			map: {},
			show: false,
			search: {
				keyword: '',
				km: 0,
				money: 0
			},
			qqMap: {},
			mapData: [],
			list: [],
			poiList: [],
			markers: [],
			polyline: [],
			currentPos: {},
			id: 0
		};
	},
	async mounted() {
		var qqMap = new QQMapWX({
			key: 'PE5BZ-TNGWF-EJEJU-JQARQ-WJXOK-5UBXD' // 必填
		});

		this.qqMap = qqMap;
		let than = this;
		// if (this.$socket) {
		// 	await this.$initSocket()
		// }
		this.$socket.on('park', data => {
			let item = than.poiList.filter(item => item.id === data.id)[0];
			var idx = than.poiList.indexOf(item);
			//更新停车场数据
			if (idx !== -1) {
				if (data.residueVehicleNum > 0) {
					item.residueVehicleNum = data.residueVehicleNum;
				} else {
					than.poiList.splice(idx, 1);
				}
			} else {
				than.calculateDistance({
					latitude: data.latitude,
					longitude: data.longitude
				});
				//  有车位实时动态显示
				than.nearParks(this.currentPos);
			}
		});

		this.$socket.on('reconnect', attemptNumber => {
			than.$tm.vx.commit('index/setSocketId', than.$socket.id);
			than.nearParks(than.currentPos);
		});
	},
	created() {
		// this.nearParks();
	},
	methods: {
		// 动态搜索位置
		input(val) {
			if (val) {
				let data = [];
				let that = this;

				this.qqMap.getSuggestion({
					keyword: val,
					success: function(res) {
						that.mapData = res.data;
						that.list = [];
						new Promise((reso, rej) => {
							res.data.forEach(el => {
								data.push({ title: el.title, address: el.address });
								that.list.push(el.title);
							});
							reso();
						}).then(() => {
							that.$refs.menu.open();
						});

						// that.$refs.menu.toogle();
					},
					fail: function(res) {
						if (res.status === 120) {
							$refs.toast.show({ model: 'warn', label: '搜索太快了，过些时候再试' });
						}
						console.log(res);
					}
				});
			}
		},
		calculateDistance(to) {
			this.qqMap.calculateDistance({
				from: this.currentPos,
				to,
				success(res) {
					console.log(res);
				}
			});
		},
		details(id) {
			uni.navigateTo({
				url: `/pagesB/parksDetail/parksDetail?id=${id}`
			});
		},
		mapBack() {
			this.polyline = [];
		},
		markerClick(e) {
			let idx = e.detail.markerId;
			let item = this.markers[idx];
			this.$refs.map.openMap(parseFloat(item.latitude), parseFloat(item.longitude), item.title);
			//uni.openLocation({
			//  latitude:parseFloat(item['latitude'] ) ,
			//  longitude:parseFloat(item['longitude']),
			//  name: item.title,
			//  scale: 12,
			//  success(){
			//    console.log('success')
			//  }
			//})
			this.navigation(item['latitude'] + ',' + item['longitude']);
		},
		navigation(to) {
			let { latitude, longitude } = this.$refs.map.getCurrentLocation();
			let than = this;
			this.qqMap.direction({
				mode: 'walking', //可选值：'driving'（驾车）、'walking'（步行）、'bicycling'（骑行），不填默认：'driving',可不填
				//from参数不填默认当前地址
				from: latitude + ',' + longitude,
				to: to,
				success: function(res) {
					var coors = res.result.routes[0].polyline,
						pl = [];
					//坐标解压（返回的点串坐标，通过前向差分进行压缩）
					var kr = 1000000;
					for (var i = 2; i < coors.length; i++) {
						coors[i] = Number(coors[i - 2]) + Number(coors[i]) / kr;
					}
					//将解压后的坐标放入点串数组pl中
					for (var i = 0; i < coors.length; i += 2) {
						pl.push({ latitude: coors[i], longitude: coors[i + 1] });
					}
					//设置polyline属性，将路线显示出来,将解压坐标第一个数据作为起点
					let data = {
						points: pl,
						color: '#22d1c8',
						width: 6,
						arrowLine: true
					};
					than.polyline = [data];
				}
			});
		},
		mapMove(posi) {
			posi.distance = 1;
			this.currentPos = posi;
			this.nearParks(posi);
		},
		// 当前位置
		position(pos) {},
		// 附近停车场
		nearParks(data) {
			let than = this;
			park.list(data).then(res => {
				if (res.code === 200) {
					than.markers = [];
					than.poiList = res.data;
					than.id = 0;
					res.data.forEach(el => {
						than.markers.push({
							id: than.id++,
							title: el.name,
							latitude: el.latitude,
							longitude: el.longitude,
							iconPath: '/static/location.png',
							height: 32,
							width: 32,
							callout: {
								content: el.name + `\n距离：${el.distance}米`,
								borderRadius: 20,
								padding: 20
							}
						});
					});
				}
			});
		},
		menuChange(e) {
			let location = this.mapData[e.index].location;
			let center = {
				latitude: location.lat,
				longitude: location.lng
			};
			this.$refs.map.currentLocation = center;
		},
		// 弹窗切换
		poupChange(val) {
			if (!val) {
				uni.showTabBar({});
			}
		},
		// 更多
		more() {
			let than = this;
			// 微信
			// #ifdef  MP-WEIXIN
			wx.vibrateShort({
				success() {
					uni.hideTabBar({
						animation: true,
						success() {
							than.show = true;
						}
					});
				}
			});
			// #endif

			// #ifdef APP-PLUS
			const mp = uni.requireNativePlugin('uniMP');
			mp.installUniMP(
				{
					appid: '__UNI__2A4537F',
					wgtFile: '/static/__UNI__2A4537F.wgt'
				},
				ret => {}
			);
			mp.openUniMP({
				appid: '__UNI__2A4537F'
			});
			// mp.openUniMP({
			// 	appid:''
			// })
			// uni.vibrate({
			// 	success: function() {
			// 		uni.hideTabBar();
			// 		than.show = true;
			// 	}
			// });
			//#endif
		},
		// 地点搜索
		confirm() {
			let keyword = this.search.keyword;
			let data = [];
			let that = this;
			that.list = [];
			this.qqMap.search({
				keyword: keyword,
				success: function(res) {
					that.mapData = res.data;
					res.data.forEach(el => {
						data.push({ title: el.title, address: el.address });
						that.list.push(el.title);
					});
					that.$refs.menu.toogle(that.list);
				},
				fail: function(res) {}
			});
		},
		back() {}
	}
};
</script>

<style></style>
