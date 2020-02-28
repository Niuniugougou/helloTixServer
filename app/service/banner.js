const Service = require('egg').Service;
class BannerService extends Service {
    //轮播列表
    async getAll(limitSize,page) {
        let { app } = this;
        const total = await app.mysql.query(`select COUNT(*) as total from tb_banner`);
        const dataList = await app.mysql.query(`select * from tb_banner where id in (select id from tb_banner order by id) limit ${limitSize};`);
        return {
            code: 200,
            status: "success",
            dataList,
            page,
            limitSize,
            total: total[0].total
        };
    }
    //禁用或启用轮播
    async deleteOrStartBanner(state,id) {
        let { app } = this;
        const info = await app.mysql.query(`select id from tb_banner where id = ${id}`);
        if(info.length != 0) {
            const successInfo = await app.mysql.query(`update tb_banner set state = ${state} where id = ${id}`);
            if(successInfo) {
                return { 
                    code: 200,
                    status: "success",
                    message: '操作成功'
                 }
            } else {
                return { 
                    code: 200,
                    status: "error",
                    errorMsg: '操作失败'
                 }
            }
        }else {
            return { 
                code: 200,
                status: "error",
                errorMsg: '操作失败'
             }
        }
    }
    //保存轮播
    async saveBanner(title,second_title,author,img_url,article_url) {
        let { app } = this;
        const saveInfo = await app.mysql.query(`insert into tb_banner (title, summary, author_name, img_url, article_url) values ('${title}','${second_title}','${author}','${img_url}','${article_url}')`);
        return {
            code: 200,
            status: "success",
            message: '操作成功'
        };
    }
    //更新轮播信息
    async updateBanner(title,second_title,author,img_url,article_url,id) {
        let { app } = this;
        const updateInfo = await app.mysql.query(`update tb_banner set title='${title}', summary='${second_title}', author_name='${author}', img_url='${img_url}', article_url='${article_url}' where id = '${id}'`);
        if(!!updateInfo) {
            return {
                code: 200,
                status: "success",
                message: '更新成功'
            };
        }else {
            return { 
                code: 200,
                status: "error",
                errorMsg: '更新失败'
             }
        }
    }
}
module.exports = BannerService;