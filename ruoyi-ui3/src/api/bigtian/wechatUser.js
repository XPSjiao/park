import request from '@/utils/request'

// 查询微信用户列表
export function listWechatUser(query) {
  return request({
    url: '/bigtian/wechatUser/list',
    method: 'get',
    params: query
  })
}

// 查询微信用户详细
export function getWechatUser(id) {
  return request({
    url: '/bigtian/wechatUser/' + id,
    method: 'get'
  })
}

// 新增微信用户
export function addWechatUser(data) {
  return request({
    url: '/bigtian/wechatUser',
    method: 'post',
    data: data
  })
}

// 修改微信用户
export function updateWechatUser(data) {
  return request({
    url: '/bigtian/wechatUser',
    method: 'put',
    data: data
  })
}

// 删除微信用户
export function delWechatUser(id) {
  return request({
    url: '/bigtian/wechatUser/' + id,
    method: 'delete'
  })
}
