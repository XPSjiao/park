import self from '@/main.js'

export function get(url, params) {
	return self.$http.get(url, params)
}

export function post(url, options) {
	return self.$http.post(url, options)
}

export function del(url, options) {
	return self.$http.delete(url, options)
}

export function put(url, options) {
	return self.$http.put(url, options)
}
