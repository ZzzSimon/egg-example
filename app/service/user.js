const Service = require('egg').Service;

class UserService extends Service {
    async loginAndGetUser(username, password) {
        const user =await this.app.mysql.get('user', {username : username});
        if (!user || user.password !== password){
            return false
        } else {
            return user;
        }
    }

    async getRoleByUsername(username) {
        const sql = "SELECT role FROM user WHERE username = ?";
        const role =await this.app.mysql.query(sql, [username]);
        return role[0].role;
    }

    async getUserInfoById(id){
        const user =await this.app.mysql.get('user', {id : id});
        if (!user){
            return false
        } else {
            return user;
        }
    }

    async getUserInfoByUsername(username){
        const user =await this.app.mysql.get('user', {username : username});
        if (!user){
            return false
        } else {
            return user;
        }
    }

    async save(user){
        const userQ =await this.app.mysql.get('user', {username : user.username});
        if (userQ){
            return false
        }else {
            const result =await this.app.mysql.insert('user', user);
            // 判断插入成功
            const insertSuccess = result.affectedRows === 1;
            if (insertSuccess) {
                return true
            }
        }
        return false
    }

    async modify(user){
        const options = {
            where: {
                username: user.username
            }
        };
        const res = await this.app.mysql.update('user',user,options);
        return res.affectedRows === 1;
    }

}

module.exports = UserService;