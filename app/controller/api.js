'use strict';

const Controller = require('egg').Controller;
const menuData = require('../../config/menu_plugin');

class apiController extends Controller {
  getMenu() {
    const { ctx } = this;
    ctx.body = menuData.menuList;
  }
}

module.exports = apiController;