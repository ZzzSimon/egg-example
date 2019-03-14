const Controller = require('egg').Controller;

class HomeController extends Controller {
    async index() {
        const {ctx, service} = this;
            const userInfo = ctx.session.user;
            ctx.logger.info('session:: %j',userInfo);
            await ctx.render('home/home.tpl',
                {
                    time: new Date(),
                    user:userInfo
                });
    }

    async login(){
        await this.ctx.render('home/login.tpl');
    }

    async register(){
        await this.ctx.render('home/register.tpl')
    }
}

module.exports = HomeController;