// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportArticle = require('../../../app/service/article');
import ExportArticletype = require('../../../app/service/articletype');
import ExportBanner = require('../../../app/service/banner');
import ExportComments = require('../../../app/service/comments');
import ExportCrawler = require('../../../app/service/crawler');
import ExportUser = require('../../../app/service/user');

declare module 'egg' {
  interface IService {
    article: ExportArticle;
    articletype: ExportArticletype;
    banner: ExportBanner;
    comments: ExportComments;
    crawler: ExportCrawler;
    user: ExportUser;
  }
}
