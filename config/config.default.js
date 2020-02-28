/* eslint valid-jsdoc: "off" */
'use strict';

const path = require('path');


module.exports = appInfo => {
  const config = exports = {};
  config.keys = appInfo.name + '_1569481712663_9666';
  config.middleware = [];
  // 配置单个数据库的连接情况
  exports.mysql = {
    client: {
      host: '', //自己数据库地址
      port: '3306',//端口号
      user: '',//用户名
      password: '',//密码
      database: ''//数据库
    },
    // 是否加载到 app 上，默认开启
    app: true,
    // 是否加载到 agent 上，默认关闭
    agent: false,
  }
  //关闭POST方法会提示invalid csrf token错误。
  // csrf需要开启，前台自己到cookie中取csrf-token，带在header中就行了
  config.security = {
    domainWhiteList: [ 'http://localhost:8080' ], //本地开发解决跨越问题
    csrf: {
      enable: false,
    },
  };
  const userConfig = {};

  //不配置就访问不到这个路径
  config.static = {
    prefix:'/app/public/',
    dir: [path.join(appInfo.baseDir, 'app/public'), path.join(appInfo.baseDir, 'app/public/uploadfile')]
  }

  return {
    ...config,
    ...userConfig,
  };
};