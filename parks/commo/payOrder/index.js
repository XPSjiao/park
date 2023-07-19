import {get, post, put} from '../request.js'

let baseUrl = '/bigtian/payOrder'
export default {
   
    list(params) {
        return get(`${baseUrl}/list`, params)
    },
    //保存停车场
    save(data) {
        return post(`${baseUrl}`, data)
    }
}
