import axios from 'axios'
import Element from 'element-ui'
import store from './store'
import router from './router'

axios.defaults.baseURL='http://192.168.3.103:9090'

//前置拦截
axios.interceptors.request.use(config =>{
    return config
})

axios.interceptors.response.use(response =>{
    let res = response.data;

    console.log("-------------------------------")
    console.log(res)
    console.log("-------------------------------")

    if(res.code === 200){
        return response
    }else {
        Element.Message({
            message: response.data.msg,
            type: 'error',
            duration: 2 * 1000
        })
        return Promise.reject(response.data.msg)
    }

},
    error =>{
        console.log(error)

        if(error.response.data){
            error.message = error.response.data.msg
        }

        if(error.response.status === 401){
            store.commit("REMOVE_INFO")
            router.push("/login")
            error.message = '请重新登录';
        }else {
            Element.Message.error(error.message,{duration:3*1000});
            return Promise.reject(error)
        }
    } )