'use strict';
const Controller = require('egg').Controller;
class ArticleTypeController extends Controller {
  //$route POST /article/getallarticletype
  //desc   分页查询文章类型，带搜索条件
  //access private,jwt
  async getAllArticleType(){
    const { ctx } = this;
    const pageSize = ctx.request.body.pageSize;
    const pageNum = ctx.request.body.pageNum;
    const searchData = ctx.request.body.searchName;
    const article = await ctx.service.articletype.getAll(pageSize,pageNum,searchData);
    ctx.body = article;
  }
  async deleteOrStart() {
    const { ctx } = this;
    const state = ctx.request.body.state;
    const id = ctx.request.body.id;
    const info = await ctx.service.articletype.deleteOrStartArticle(state,id);
    ctx.body = info;
  }
  async save() {
    const { ctx } = this;
    const type_name = ctx.request.body.type_name;
    const state = ctx.request.body.state;
    const saveInfo = await ctx.service.articletype.saveArticle(type_name,state);
    ctx.body = saveInfo;
  }
  async update() {
    const { ctx } = this;
    const type_name = ctx.request.body.type_name;
    const id = ctx.request.body.id;
    const updateInfo = await ctx.service.articletype.updateArticle(type_name,id);
    ctx.body = updateInfo;
  }
}

module.exports = ArticleTypeController;
