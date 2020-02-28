'use strict';
const Controller = require('egg').Controller;
class BannerController extends Controller {
  //$route POST /banner/getallbanner
  //desc   分页查询轮播
  //access private,jwt
  async getAllBanner(){
    const { ctx } = this;
    const pageSize = ctx.request.body.pageSize;
    const pageNum = ctx.request.body.pageNum;
    const banner = await ctx.service.banner.getAll(pageSize,pageNum);
    ctx.body = banner;
  }
  async deleteOrStart() {
    const { ctx } = this;
    const state = ctx.request.body.state;
    const id = ctx.request.body.id;
    const info = await ctx.service.banner.deleteOrStartBanner(state,id);
    ctx.body = info;
  }
  async save() {
    const { ctx } = this;
    const title = ctx.request.body.title;
    const second_title = ctx.request.body.second_title;
    const author = ctx.request.body.author;
    const img_url = ctx.request.body.img_url;
    const article_url = ctx.request.body.article_url;
    const saveInfo = await ctx.service.banner.saveBanner(title,second_title,author,img_url,article_url);
    ctx.body = saveInfo;
  }
  async update() {
    const { ctx } = this;
    const title = ctx.request.body.title;
    const second_title = ctx.request.body.second_title;
    const author = ctx.request.body.author;
    const img_url = ctx.request.body.img_url;
    const article_url = ctx.request.body.article_url;
    const id = ctx.request.body.id;
    const updateInfo = await ctx.service.banner.updateBanner(title,second_title,author,img_url,article_url,id);
    ctx.body = updateInfo;
  }
}

module.exports = BannerController;
