'use strict';
const Controller = require('egg').Controller;
const uuidv1 = require('uuid/v1');
class CommentsController extends Controller {
  //$route POST /comments/getallcomments
  //desc   分页查询评论，带搜索条件
  //access private,jwt
  async getAllComments(){
    const { ctx } = this;
    const pageSize = ctx.request.body.pageSize;
    const pageNum = ctx.request.body.pageNum;
    const searchData = ctx.request.body.state;
    const comments = await ctx.service.comments.getAll(pageSize,pageNum,searchData);
    ctx.body = comments;
  }
  async deleteOrStart() {
    const { ctx } = this;
    const state = ctx.request.body.state;
    const id = ctx.request.body.id;
    const info = await ctx.service.comments.deleteOrStartComments(state,id);
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
    const saveInfo = await ctx.service.comments.saveComments(title,second_title,content,author,edit_type,article_type,id);
    ctx.body = saveInfo;
  }
}

module.exports = CommentsController;
