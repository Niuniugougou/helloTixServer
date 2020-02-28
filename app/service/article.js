const Service = require('egg').Service;
class ArticleService extends Service {
    //文章列表
    async getAll(limitSize,page,search_name) {
        let { app } = this;
        let page_from = (page-1)*limitSize;
        if(!!search_name) {
            const total = await app.mysql.query(`select COUNT(*) as total from tb_article where title = '${search_name}'`);
            const dataList = await app.mysql.query(`select * from tb_article where id in (select id from tb_article where title = '${search_name}' order by id) limit ${limitSize};`);
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
            const total = await app.mysql.query(`select COUNT(*) as total from tb_article`);
            const dataList = await app.mysql.query(`select * from tb_article where id >=(select id from tb_article order by id limit ${page_from},1) limit ${limitSize};`);
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
        const info = await app.mysql.query(`select id from tb_article where id = ${id}`);
        if(info.length != 0) {
            const successInfo = await app.mysql.query(`update tb_article set state = ${state} where id = ${id}`);
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
    //保存富文本编写的文章
    async saveArticle(title,second_title,content,author,edit_type,article_type,id) {
        let { app } = this;
        const saveInfo = await app.mysql.query(`insert into tb_article (title, summary, content, author_name, edit_type, type, id) values ('${title}','${second_title}','${content}','${author}','${edit_type}','${article_type}','${id}')`);
        return {
            code: 200,
            status: "success",
            message: '操作成功'
        };
    }
    //更新文章
    async updateArticle(title,second_title,content,author,article_type,id) {
        let { app } = this;
        const updateInfo = await app.mysql.query(`update tb_article set title='${title}', summary='${second_title}', content='${content}', author_name='${author}', type='${article_type}' where id = '${id}'`);
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
module.exports = ArticleService;