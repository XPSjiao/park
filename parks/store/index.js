export default {
    state: {
        userInfo: {
            avatarUrl: '',
            nickName: '',
            gender: 0
        },
        socketId: '',
        token:''
    },
    mutations: {
        setUserInfo(state, info) {
            state.userInfo = info
        },
        setToken(state, token) {
            state.token = token
        },
        setSocketId(state, socketId) {
            state.socketId = socketId
        }
    },
    actions: {}
}
