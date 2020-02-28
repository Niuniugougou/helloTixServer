const Service = require('egg').Service;
class ArticleService extends Service {
    //文章列表
    async getAll(limitSize,page,search_name) {
        let { app } = this;
        let page_from = (page-1)*limitSize;
        if(!!search_name) {
            const total = await app.mysql.query(`select COUNT(*) as total from tb_article_type where type_name = '${search_name}'`);
            const dataList = await app.mysql.query(`select * from tb_article_type where id in (select id from tb_article_type where type_name = '${search_name}' order by id) limit ${limitSize};`);
            return {
                code: 200,
                status: "success",
                dataList,
                page,
                limitSize,
                total: total[0].total
            };
        }else {
            //如果存在搜索条件
            const total = await app.mysql.query(`select COUNT(*) as total from tb_article_type`);
            const dataList = await app.mysql.query(`select * from tb_article_type where id >=(select id from tb_article_type order by id limit ${page_from},1) limit ${limitSize};`);
            return {
                code: 200,
                status: "success",
                dataList,
                page,
                limitSize,
                total: total[0].total
            };
        }
    }
    //禁用或启用文章
    async deleteOrStartArticle(state,id) {
        let { app } = this;
        const info = await app.mysql.query(`select id from tb_article_type where id = ${id}`);
        if(info.length != 0) {
            const successInfo = await app.mysql.query(`update tb_article_type set state = ${state} where id = ${id}`);
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
    //保存文章类型
    async saveArticle(type_name,state) {
        let { app } = this;
        const saveInfo = await app.mysql.query(`insert into tb_article_type (type_name, state) values ('${type_name}','${state}')`);
        return {
            code: 200,
            status: "success",
            message: '操作成功',
            saveInfo
        };
    }
    //更新文章类型
    async updateArticle(type_name,id) {
        let { app } = this;
        const updateInfo = await app.mysql.query(`update tb_article_type set type_name = '${type_name}' where id = '${id}'`);
        return {
            code: 200,
            status: "success",
            message: '操作成功',
            updateInfo
        };
    }
}
module.exports = ArticleService;