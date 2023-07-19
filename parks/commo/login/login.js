import {
	get,
	post
} from '../request.js'
export default {
	getOpenId(code) {
		return get("/getOpenId", {
			code
		})
	},
	getPhone(code) {
		return get("/getPhone", {
			code
		})
	},
	saveWeChatUserInfo(data) {
		return post('/bigtian/wechatUser/wx/save', data)
	}
}
