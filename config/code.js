'use strict';

module.exports = {
  success: 200, // 操作成功
  failed: 500, // 操作失败
  landed_other_device: 50012, // 已在其他设备登录
  token_expire: 50012, // token失效,登录状态已过期
  token_no: 50008, // 没有token,未登录
  failedMsg: {
    code: 40000,
    errorMsg: '操作失败,请注意填写内容或操作方式是否正确',
    status: 'error'
  }
}