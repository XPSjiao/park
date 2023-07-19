import request from '@/utils/request'

// 查询停车场列表
export function listParks(query) {
  return request({
    url: '/bigtian/parks/list',
    method: 'get',
    params: query
  })
}

// 查询停车场详细
export function getParks(id) {
  return request({
    url: '/bigtian/parks/' + id,
    method: 'get'
  })
}

// 新增停车场
export function addParks(data) {
  return request({
    url: '/bigtian/parks',
    method: 'post',
    data: data
  })
}

// 修改停车场
export function updateParks(data) {
  return request({
    url: '/bigtian/parks',
    method: 'put',
    data: data
  })
}

// 审批停车场
export function applyPark(data) {
  return request({
    url: '/bigtian/parks/applyPark',
    method: 'put',
    data: data
  })
}

// 删除停车场
export function delParks(id) {
  return request({
    url: '/bigtian/parks/' + id,
    method: 'delete'
  })
}
