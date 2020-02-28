const Service = require('egg').Service;

const puppeteer = require('puppeteer');
const fs = require('fs');
var http = require('http');

class CrawlerService extends Service {
  //文章列表
  async saveCrawler(htmlUrl, titleUrl, secondTitleUrl, contentUrl, id) {
    let { app } = this;
    console.log(contentUrl)

    // 返回解析为Promise的浏览器
    const browser = await puppeteer.launch();

    // 返回新的页面对象
    const page = await browser.newPage({ headless: false });

    // 页面对象访问对应的url地址
    await page.goto(htmlUrl, {
      waitUntil: 'networkidle2'
    })

    // 等待5s，等待浏览器的加载
    await page.waitFor(5000);
    // 可以在page.evaluate的回调函数中访问浏览器对象，可以进行DOM操作
    const bodyHandle = await page.$(`${contentUrl}`);
    const content = await page.evaluate(body => {
      // 在这里就可以获取所有的html结构了，就像操作dom那样操作然后写数据就可以了
      return body.innerHTML
    },bodyHandle)

    const bodyHandleTitle = await page.$(`${titleUrl}`);
    const title = await page.evaluate(body => {
      // 在这里就可以获取所有的html结构了，就像操作dom那样操作然后写数据就可以了
      return body.innerHTML
    },bodyHandleTitle)

    const bodyHandleSecondTitle = await page.$(`${secondTitleUrl}`);
    const secondTitle = await page.evaluate(body => {
      // 在这里就可以获取所有的html结构了，就像操作dom那样操作然后写数据就可以了
      return body.innerHTML
    },bodyHandleSecondTitle)


    // 销毁
    await bodyHandle.dispose();
    // 关闭无头浏览器
    await browser.close();
    //这里存数据
    console.log(content)
    console.log(title)
    console.log(secondTitle)

    const saveInfo = await app.mysql.query(`insert into tb_article (title, summary, content, id) values ('${title}','${secondTitle}','${content}','${id}')`);
    if (saveInfo.affectedRows === 1) {
      return {
          code: 200,
          status: "success",
          message: '操作成功'
      };
    }else {
      return {
        code: 40000,
        status: "error",
        errorMsg: '存储失败。'
    };
    }


  }

}
module.exports = CrawlerService;