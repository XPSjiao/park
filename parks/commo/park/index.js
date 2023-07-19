import {get, post, put} from '../request.js'

let baseUrl = '/bigtian/parks'
export default {
    // 获取附近停车场
    list(params) {
        return post(`${baseUrl}/getNearbyParks`, params)
    },
    //保存停车场
    save(data) {
        return post(`${baseUrl}`, data)
    }, //修改停车场
    update(data) {
        return put(`${baseUrl}`, data)
    },
//	我申请的停车场
    myParks(params) {
        return get(`${baseUrl}/list`, params)
    },
    //获取停车场详情
    getById(id) {
        return get(`${baseUrl}/${id}`);
    }
}
