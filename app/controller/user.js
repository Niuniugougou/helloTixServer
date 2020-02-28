'use strict';
const code = require('../../config/code')
// 返回的失败信息必须有 code,errorMsg,status
// ctx.body = {
//   code: 40000,
//   errorMsg: '登录失败',
//   status: 'error'
// }
// 返回的成功信息必须有 code,message,status
// ctx.body = {
//   code: 200,
//   message: '登录成功',
//   status: 'success'
// }

const Controller = require('egg').Controller;
const CryptoJS  = require("crypto-js");

function decrypt(content, key){
  var sKey = CryptoJS.enc.Utf8.parse(key);
  var decrypt = CryptoJS.AES.decrypt(content, sKey, {mode:CryptoJS.mode.ECB,padding: CryptoJS.pad.Pkcs7});
  return CryptoJS.enc.Utf8.stringify(decrypt).toString();
}

class UserController extends Controller {
  //$route POST /admin/userlogin
  //desc   使用手机号或账号登录
  //access Public
  async userLogin() {
    const { ctx } = this;
    const phoneNum = ctx.query.loginName;
    //解密
    var passwordSecret = decrypt(ctx.query.password,ctx.helper.key);
    //md5加密
    const password = ctx.helper.md5(passwordSecret + ctx.header.MD5_SUFFIX);
    const user = await ctx.service.user.findByPhoneNum(phoneNum);
    //空数组用 !!取反之后为true,数组谨慎使用
    if(!!user && user.length != 0 && password == user[0].password) {
      const token = ctx.helper.loginToken(user);
      ctx.body = {
        code: 200,
        status: 'success',
        message: '登录成功',
        user,
        token:  "Bearer " + token
      }
    }else {
      ctx.body = code.failedMsg;
    }
  }
  //$route POST /user/getalluser
  //desc   分页查询用户，加搜索条件
  //access private,jwt
  async getAllUser(){
    const { ctx } = this;
    const pageSize = ctx.request.body.pageSize;
    const pageNum = ctx.request.body.pageNum;
    const searchData = ctx.request.body.userName;
    const user = await ctx.service.user.getAll(pageSize,pageNum,searchData);
    ctx.body = user;
  }

  async deleteOrStart() {
    const { ctx } = this;
    const state = ctx.request.body.state;
    const id = ctx.request.body.id;
    const info = await ctx.service.user.deleteOrStartUser(state,id);
    ctx.body = info;
  }

  async info() {
    const ctx = this.ctx;
    const userId = ctx.params.id;
    const user = await ctx.service.user.find(userId);
    ctx.body = user;
  }
  async create() {
    const { ctx, service } = this;
    let user = ctx.request.body;
    let result = await service.user.create(user);
    console.log(result);
    this.ctx.body = result;
    if (result.affectedRows === 1) {
      this.ctx.body = {
        code: 200,
        data: result.insertId
      }
    } else {
      this.ctx.body = {
        code: 50000,
        data: '用户添加失败'
      }
    }
  }
  async updateAdminInfo() {
    const { ctx } = this;
    const userName = ctx.request.body.userName;
    const imgurl = ctx.request.body.imgurl;
    const info = await ctx.service.user.updateAdminInfoService(userName,imgurl);
    ctx.body = info;
  }
  async getAdminInfo() {
    const { ctx } = this;
    const userName = ctx.request.body.userName;
    const info = await ctx.service.user.getAdminInfoService(userName);
    ctx.body = info;
  }
}

module.exports = UserController;
