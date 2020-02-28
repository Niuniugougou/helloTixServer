// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportApi = require('../../../app/controller/api');
import ExportArticle = require('../../../app/controller/article');
import ExportArticletype = require('../../../app/controller/articletype');
import ExportBanner = require('../../../app/controller/banner');
import ExportComments = require('../../../app/controller/comments');
import ExportCrawler = require('../../../app/controller/crawler');
import ExportHome = require('../../../app/controller/home');
import ExportUpload = require('../../../app/controller/upload');
import ExportUser = require('../../../app/controller/user');

declare module 'egg' {
  interface IController {
    api: ExportApi;
    article: ExportArticle;
    articletype: ExportArticletype;
    banner: ExportBanner;
    comments: ExportComments;
    crawler: ExportCrawler;
    home: ExportHome;
    upload: ExportUpload;
    user: ExportUser;
  }
}
