import {del} from '../request.js'

let baseUrl = '/bigtian/attachment'
export default {
//    根据url删除附件
    del(param) {
        return del(`${baseUrl}/del`, param)
    }
}
