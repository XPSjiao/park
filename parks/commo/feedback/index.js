import {del, get, post} from '../request.js'

let baseUrl = '/bigtian/feedback'
export default {
    save(data) {
        return post(`${baseUrl}`, data)
    },
    //我的反馈列表
    myFeedBackList(params) {
        return get(`${baseUrl}/list`, params)
    },
}
