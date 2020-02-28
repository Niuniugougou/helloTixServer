'use strict';
//上传单个文件
const Controller = require('egg').Controller;
const fs = require('fs');
const path = require('path')
const sendToWormhole = require('stream-wormhole');
module.exports = class extends Controller {
  async upload() {
    const { ctx } = this;
    let stream = await ctx.getFileStream();
    // stream对象也包含了文件名，大小等基本信息
    let filename = new Date().getTime() + stream.filename;
    // 创建文件写入路径
    let target = path.join('./app/public/', `uploadfile/${filename}`);
    const result = await new Promise((resolve, reject) => {
      // 创建文件写入流
      const remoteFileStrem = fs.createWriteStream(target)
      // 以管道方式写入流
      stream.pipe(remoteFileStrem)
      let errFlag
      // 监听error事件
      remoteFileStrem.on('error', err => {
        errFlag = true
        // 停止写入
        sendToWormhole(stream)
        remoteFileStrem.destroy()
        console.log(err)
        reject(err)
      })
      // 监听写入完成事件
      remoteFileStrem.on('finish', () => {
        if (errFlag) return;
        resolve({ filename, name: stream.fields.name })
      })
    })
    ctx.body = { code: 200, message: '上传成功', status: 'success', data: result }
  }
};