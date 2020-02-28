const Service = require('egg').Service;
class CommentsService extends Service {
    //文章列表
    async getAll(limitSize,page,state) {
        let { app } = this;
        let page_from = (page-1)*limitSize;
        if(state === '0' || state === '1') {
            const total = await app.mysql.query(`select COUNT(*) as total from tb_comments where state = '${state}'`);
            // const dataList = await app.mysql.query(`select * from tb_comments where id in (select id from tb_comments where state = '${state}' order by id) limit ${limitSize};`);
            const dataList = await app.mysql.query(`select a.comments_id,a.comments_content,a.from_uid,a.to_uid,a.state,a.create_time,b.type,b.title from tb_comments a left join tb_article b on a.article_id=b.id where a.id in (select id from tb_comments where state = '${state}' order by id) limit ${limitSize};`);
            return {
                code: 200,
                status: "success",
                dataList,
                page,
                limitSize,
                total: total[0].total
            };
        }else {
            //如果不存在搜索条件
            const total = await app.mysql.query(`select COUNT(*) as total from tb_comments`);
            // const dataList = await app.mysql.query(`select * from tb_comments where id >=(select id from tb_comments order by id limit ${page_from},1) limit ${limitSize};`);
            const dataList = await app.mysql.query(`select a.repeat_content,a.comments_id,a.comments_content,a.from_uid,a.to_uid,a.state,a.create_time,b.type,b.title from tb_comments a left join tb_article b on a.article_id=b.id where a.id >=(select id from tb_comments order by id limit ${page_from},1) limit ${limitSize};`);
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
    async deleteOrStartComments(state,id) {
        let { app } = this;
        const info = await app.mysql.query(`select id from tb_comments where id = ${id}`);
        if(info.length != 0) {
            const successInfo = await app.mysql.query(`update tb_comments set state = ${state} where id = ${id}`);
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
    async saveComments(title,second_title,content,author,edit_type,article_type,id) {
        let { app } = this;
        const saveInfo = await app.mysql.query(`insert into tb_comments (title, summary, content, author_name, edit_type, type, id) values ('${title}','${second_title}','${content}','${author}','${edit_type}','${article_type}','${id}')`);
        return {
            code: 200,
            status: "success",
            message: '操作成功'
        };
    }
}
module.exports = CommentsService;