'use strict';
const Controller = require('egg').Controller;
const uuidv1 = require('uuid/v1');
class ArticleController extends Controller {
  //$route POST /article/getallarticle
  //desc   分页查询文章，带搜索条件
  //access private,jwt
  async getAllArticle(){
    const { ctx } = this;
    const pageSize = ctx.request.body.pageSize;
    const pageNum = ctx.request.body.pageNum;
    const searchData = ctx.request.body.searchName;
    const article = await ctx.service.article.getAll(pageSize,pageNum,searchData);
    ctx.body = article;
  }
  async deleteOrStart() {
    const { ctx } = this;
    const state = ctx.request.body.state;
    const id = ctx.request.body.id;
    const info = await ctx.service.article.deleteOrStartArticle(state,id);
    ctx.body = info;
  }
  async save() {
    const { ctx } = this;
    const title = ctx.request.body.title;
    const second_title = ctx.request.body.second_title;
    const content = ctx.request.body.content;
    const author = ctx.request.body.author;
    const edit_type = ctx.request.body.edit_type;
    const article_type = ctx.request.body.article_type;
    const id = uuidv1();
    const saveInfo = await ctx.service.article.saveArticle(title,second_title,content,author,edit_type,article_type,id);
    ctx.body = saveInfo;
  }
  async update() {
    const { ctx } = this;
    const title = ctx.request.body.title;
    const second_title = ctx.request.body.second_title;
    const content = ctx.request.body.content;
    const author = ctx.request.body.author;
    const article_type = ctx.request.body.article_type;
    const id = ctx.request.body.id;
    const updateInfo = await ctx.service.article.updateArticle(title,second_title,content,author,article_type,id);
    ctx.body = updateInfo;
  }
}

module.exports = ArticleController;
