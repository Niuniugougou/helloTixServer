'use strict'
const jwt = require('jsonwebtoken') //引入jsonwebtoken
const code = require('../../config/code')

module.exports = (options, app) => {
    return async function userInterceptor(ctx, next) {
        let authToken = ctx.header.authorization // 获取header里的authorization
        if (authToken) {
            authToken = authToken.substring(7)
            const res = verifyToken(authToken)[0] // 解密获取的Token
            console.log(res)
            if (res.GUID) {
                // 如果需要限制单端登陆或者使用过程中废止某个token，或者更改token的权限。也就是说，一旦 JWT 签发了，在到期之前就会始终有效
                // 此处使用redis进行保存
                // const redis_token = await app.redis.get('loginToken').get(res.corpid + res.userid) // 获取保存的token
                if (authToken) {
                    ctx.locals.GUID = res.GUID
                    await next()
                } else {
                    ctx.body = { code: code.landed_other_device, msg: '您的账号已在其他地方登录' }
                }
            } else {
                ctx.body = { code: code.token_expire, msg: '登录状态已过期' }
            }
        } else {
            ctx.body = { code: code.token_no, msg: '请登陆后再进行操作' }
        }
    }
}

// 解密，验证
function verifyToken(token) {
    const cert = 'hagoubang'
    let res = ''
    try {
        const result = jwt.verify(token, cert) || {}
        const { exp } = result,
            current = Math.floor(Date.now() / 1000)
        if (current <= exp) res = result.data || {}
    } catch (e) {
        console.log(e)
    }
    return res
}