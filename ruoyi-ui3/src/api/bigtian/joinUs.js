import request from '@/utils/request'

// 查询合同共赢列表
export function listJoinUs(query) {
  return request({
    url: '/bigtian/joinUs/list',
    method: 'get',
    params: query
  })
}

// 查询合同共赢详细
export function getJoinUs(id) {
  return request({
    url: '/bigtian/joinUs/' + id,
    method: 'get'
  })
}

// 新增合同共赢
export function addJoinUs(data) {
  return request({
    url: '/bigtian/joinUs',
    method: 'post',
    data: data
  })
}

// 修改合同共赢
export function updateJoinUs(data) {
  return request({
    url: '/bigtian/joinUs',
    method: 'put',
    data: data
  })
}

// 删除合同共赢
export function delJoinUs(id) {
  return request({
    url: '/bigtian/joinUs/' + id,
    method: 'delete'
  })
}
