import {del, get, post, put} from '../request.js'

let baseUrl = '/bigtian/joinUs'
export default {
//    根据url删除附件
    del(param) {
        return del(`${baseUrl}/del`, param)
    },
    save(data) {
        return post(`${baseUrl}`, data)
    }, //修改停车场
    update(data) {
        return put(`${baseUrl}`, data)
    },
    //我的商务合作申请列表
    myFeedBackList(params) {
        return get(`${baseUrl}/list`, params)
    },
    getById(id) {
        return get(`${baseUrl}/${id}`);
    }
}
