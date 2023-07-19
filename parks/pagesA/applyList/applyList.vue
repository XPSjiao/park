<template>
	<view>
		<big-list :data="poiList" @detail="details" type="my" @reApply="reApply"></big-list>
		<tm-message ref="toast"></tm-message>
	</view>
</template>

<script>
import parks from '@/commo/park/index.js';

export default {
	data() {
		return {
			poiList: [],
			data: {
				createBy: '1',
				pageNum: 1,
				pageSize: 10
			},
			pages: 1
		};
	},
	onReachBottom() {
		if (this.pages > this.data.pageNum) {
			this.data.pageNum++;
			this.list();
		}
	},
	mounted() {
		this.list();
	},
	methods: {
		details(id) {
			uni.navigateTo({
				url: `/pagesB/parksDetail/parksDetail?id=${id}`
			});
		},
		reApply(id) {
			uni.navigateTo({
				url: `/pagesA/apply/apply?id=${id}`
			});
		},
		list() {
			let than = this;
			parks.myParks(this.data).then(res => {
				if (res.code === 200) {
					than.poiList = than.poiList.concat(res.rows);
					than.pages = res.pages;
				} else {
					this.$refs.toast.show({ model: 'error', label: res.msg });
				}
			});
		}
	}
};
</script>

<style></style>
