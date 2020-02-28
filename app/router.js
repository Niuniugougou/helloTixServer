'use strict';

/**
 * 路由
 */

// 返回的失败信息必须有 code,errorMsg,status
// ctx.body = {
//   code: 40000,
//   errorMsg: '登录失败',
//   status: 'error'
// }
// 返回的成功信息必须有 code,message,status
// ctx.body = {
//   code: 200,
//   message: '登录成功',
//   status: 'success'
// }
module.exports = app => {
  const { router, controller } = app;
  const jwt = app.middleware.jwt();

  router.post('/admin/userlogin',controller.user.userLogin); 
  router.post('/admin/updateadmininfo',controller.user.updateAdminInfo);
  router.post('/admin/getadmininfo',controller.user.getAdminInfo);
  router.get('/api/getmenu', jwt, controller.api.getMenu);

  router.post('/user/getalluser', jwt, controller.user.getAllUser);
  router.post(`/user/deleteorstart`, jwt, controller.user.deleteOrStart);
  router.post(`/article/getallarticle`, jwt, controller.article.getAllArticle);
  router.post(`/article/deleteorstart`, jwt, controller.article.deleteOrStart);
  router.post(`/article/save`, jwt, controller.article.save);
  router.post(`/article/update`, jwt, controller.article.update);

  router.post(`/articletype/getallarticletype`, jwt, controller.articletype.getAllArticleType);
  router.post(`/articletype/deleteorstarttype`, jwt, controller.articletype.deleteOrStart);
  router.post(`/articletype/savetype`, jwt, controller.articletype.save);
  router.post(`/articletype/updatetype`, jwt, controller.articletype.update);
  
  router.post(`/file/upload`, controller.upload.upload);
  
  router.post(`/banner/getallbanner`, jwt, controller.banner.getAllBanner);
  router.post(`/banner/deleteorstart`, jwt, controller.banner.deleteOrStart);
  router.post(`/banner/save`, jwt, controller.banner.save);
  router.post(`/banner/update`, jwt, controller.banner.update);

  router.post(`/comments/getallcomments`, jwt, controller.comments.getAllComments);
  router.post(`/comments/deleteorstart`, jwt, controller.comments.deleteOrStart);
  router.post(`/comments/save`, jwt, controller.comments.save);

  router.post(`/crawler/articleCrawler`, jwt, controller.crawler.save);

  router.get('/', controller.home.index);
  router.get('/user/find/:id', jwt, controller.user.info);
  router.get('/user/create', controller.user.create);
};
