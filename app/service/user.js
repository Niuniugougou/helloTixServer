const Service = require('egg').Service;
class UserService extends Service {
    async find(uid) {
        // 假如 我们拿到用户 id 从数据库获取用户详细信息
        let { app } = this;
        const user = await app.mysql.query('select * from hagoubang_users where uid = ?', [uid]);
        return user;
    }
    async create(user) {
        let { app } = this;
        let result = await app.mysql.insert('hagoubang_users',
            user
        );
        return result;
    }
    async findByPhoneNum(phone_num) {
        // 假如 我们拿到用户 id 从数据库获取用户详细信息
        let { app } = this;
        const user = await app.mysql.query('select * from admin where admin_name = ?', [phone_num]);
        return user;
    }
    //用户列表
    async getAll(limitSize,page,search_name) {
        let { app } = this;
        let page_from = (page-1)*limitSize;
        if(!!search_name) {
            const total = await app.mysql.query(`select COUNT(*) as total from tb_users where nickname = '${search_name}'`);
            const userList = await app.mysql.query(`select * from tb_users where uid in (select uid from tb_users where nickname = '${search_name}' order by uid) limit ${limitSize};`);
            return {
                code: 200,
                status: "success",
                userList,
                page,
                limitSize,
                total: total[0].total
            };
        }else {
            //如果存在搜索条件
            const total = await app.mysql.query(`select COUNT(*) as total from tb_users`);
            const userList = await app.mysql.query(`select * from tb_users where uid >=(select uid from tb_users order by uid limit ${page_from},1) limit ${limitSize};`);
            return {
                code: 200,
                status: "success",
                userList,
                page,
                limitSize,
                total: total[0].total
            };
        }
    }
    //禁用或启用用户
    async deleteOrStartUser(state,id) {
        let { app } = this;
        const info = await app.mysql.query(`select uid from tb_users where uid = ${id}`);
        if(info.length != 0) {
            const successInfo = await app.mysql.query(`update tb_users set state = ${state} where uid = ${id}`);
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
    //更新admin的信息
    async updateAdminInfoService(userName,imgurl) {
        let { app } = this;
        const info = await app.mysql.query(`update admin set admin_logo_url = '${imgurl}' where admin_name = '${userName}'`);
        return {
            code: 200,
            status: "success"
        };
    }
    //得到管理员信息
    async getAdminInfoService(userName) {
        let { app } = this;
        const info = await app.mysql.query(`select admin_logo_url from admin where admin_name = '${userName}'`);
        return {
            code: 200,
            status: "success",
            info
        };
    }
}
module.exports = UserService;