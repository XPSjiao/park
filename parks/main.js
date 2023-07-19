import App from './App'
import socketio from 'commo/socket.js'
// #ifndef VUE3
import Vue from 'vue'
import tmVuetify from "./tm-vuetify";
import http from '@/uni_modules/zhouWei-request/js_sdk/requestConfig';
import {
	back
} from '@/utils/utils.js'

Vue.use(tmVuetify)


Vue.prototype.$initSocket = () => {
	Vue.prototype.$socket = new socketio().getsocket()
}


Vue.prototype.$http = http;
Vue.prototype.$back = back;

Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
	...App
})

app.$mount()
// #endif

// #ifdef VUE3
import {
	createSSRApp
} from 'vue'
export function createApp() {
	const app = createSSRApp(App)
	return {
		app
	}
}
// #endif
export default app
