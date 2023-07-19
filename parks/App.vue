<script>
export default {
	onLaunch: function() {
		console.log('App Launch');
	},
	onShow: function() {
		console.log('App Show');
	},
	onHide: function() {
		console.log('App Hide');
	}
};
</script>

<style>

/*每个页面公共css */
@import './tm-vuetify/mian.min.css';
/* 主题包 */
@import './tm-vuetify/scss/theme.css';
@import './tm-vuetify/scss/fonts/iconfont.css';
/* @import 'https://at.alicdn.com/t/font_3248326_jwzgib6dqwk.css'; */
</style>
