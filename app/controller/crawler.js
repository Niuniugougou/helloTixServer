'use strict';
const Controller = require('egg').Controller;
const uuidv1 = require('uuid/v1');
class CrawlerController extends Controller {
  async save() {
    const { ctx } = this;
    const htmlUrl = ctx.request.body.htmlUrl;
    const titleUrl = ctx.request.body.titleUrl;
    const secondTitleUrl = ctx.request.body.secondTitleUrl;
    const contentUrl = ctx.request.body.contentUrl;
    const id = uuidv1();
    const saveInfo = await ctx.service.crawler.saveCrawler(htmlUrl,titleUrl,secondTitleUrl,contentUrl,id);
    ctx.body = saveInfo;
  }
}

module.exports = CrawlerController;
