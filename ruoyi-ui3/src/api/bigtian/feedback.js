import request from '@/utils/request'

// 查询反馈列表
export function listFeedback(query) {
  return request({
    url: '/bigtian/feedback/list',
    method: 'get',
    params: query
  })
}

// 查询反馈详细
export function getFeedback(id) {
  return request({
    url: '/bigtian/feedback/' + id,
    method: 'get'
  })
}

// 新增反馈
export function addFeedback(data) {
  return request({
    url: '/bigtian/feedback',
    method: 'post',
    data: data
  })
}

// 修改反馈
export function updateFeedback(data) {
  return request({
    url: '/bigtian/feedback',
    method: 'put',
    data: data
  })
}

// 删除反馈
export function delFeedback(id) {
  return request({
    url: '/bigtian/feedback/' + id,
    method: 'delete'
  })
}
