import request from '@/utils/request'

// 查询支付订单列表
export function listPayOrder(query) {
  return request({
    url: '/bigtian/payOrder/list',
    method: 'get',
    params: query
  })
}

// 查询支付订单详细
export function getPayOrder(id) {
  return request({
    url: '/bigtian/payOrder/' + id,
    method: 'get'
  })
}

// 新增支付订单
export function addPayOrder(data) {
  return request({
    url: '/bigtian/payOrder',
    method: 'post',
    data: data
  })
}

// 修改支付订单
export function updatePayOrder(data) {
  return request({
    url: '/bigtian/payOrder',
    method: 'put',
    data: data
  })
}

// 删除支付订单
export function delPayOrder(id) {
  return request({
    url: '/bigtian/payOrder/' + id,
    method: 'delete'
  })
}
