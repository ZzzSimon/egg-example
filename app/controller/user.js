const Controller = require('egg').Controller;

class UserController extends Controller{
    async login(){
        const ctx = this.ctx;
        ctx.logger.info('req body:: %j',ctx.request.body);
        const { username, password, rememberMe } = ctx.request.body;
        const user = await ctx.service.user.loginAndGetUser(username, password);
        if (user === null){
            ctx.body = {
                successFlag:'N',
                errorMsg:'用户名或密码错误！'
            }
        }else {
            // 设置 Session
            ctx.session.user = {username:user.username};
            ctx.cookies.set('username',user.username);
            // 如果用户勾选了 `记住我`，设置 60s 的过期时间
            if (rememberMe) ctx.session.maxAge = this.config.rememberMe;
            ctx.body = {
                successFlag:'Y',
                errorMsg:'登录成功！'
            };
            ctx.redirect('/')
        }

    }
}

module.exports = UserController;