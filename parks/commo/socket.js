import io from '@hyoga/uni-socket.io';
import self from '@/main.js'

class socketio {
    constructor(data) {
        //首次使用构造器实例
        if (!socketio.instance) {
            // socketio.instance = this.getsocket(data);
            return socketio.instance;
        }
    }

    getsocket(data) {

        const socket = io(self.$http.socketUrl, {
            query: data || {},
            transports: ['websocket', 'polling'],
            timeout: 5000
        });
        socket.on('connect', () => {
            // ws连接已建立，此时可以进行socket.io的事件监听或者数据发送操作
            console.log('ws 已连接');
            // socket.io 唯一连接id，可以监控这个id实现点对点通讯
            self.$tm.vx.commit('index/setSocketId', socket.id)
        });
        // 正在连接
        socket.on('connecting', d => {
            console.log('正在连接', d);
        });
        // 连接错误
        socket.on('connect_error', d => {
            console.log('连接失败', d);
        });
        // 连接超时
        socket.on('connect_timeout', d => {
            console.log('连接超时', d);
        });
        // 断开连接
        socket.on('disconnect', reason => {
            console.log('断开连接', reason);
        });
        // 重新连接

        // 连接失败
        socket.on('reconnect_failed', () => {
            console.log('重连失败');
        });
        // 尝试重新连接
        socket.on('reconnect_attempt', () => {
            console.log('尝试重新重连');
        });
        // 错误发生，并且无法被其他事件类型所处理
        socket.on('error', err => {
            console.log('错误发生，并且无法被其他事件类型所处理', err);
        });
        return socket
    }
}

export default socketio
