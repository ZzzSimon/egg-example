const Service = require('egg').Service;

class UserService extends Service {
    async loginAndGetUser(username, password) {

        const user =await this.app.mysql.get('user', {username : username});

        if (user.password !== password){
            return null
        } else {
            return user;
        }

    }

}

module.exports = UserService;