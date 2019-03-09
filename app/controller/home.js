const Controller = require('egg').Controller;

class HomeController extends Controller {
    async index() {
        const {ctx, service} = this;
        if (typeof(ctx.session.user)!=='undefined') {

            const userInfo = ctx.session.user;
            ctx.logger.info('session:: %j',userInfo);
            await ctx.render('home/home.tpl',
                {
                    time: new Date(),
                    user:userInfo
                });
        }else {
            ctx.redirect('/login')
        }
    }

    async login(){
        const {ctx, service} = this;

        await ctx.render('home/login.tpl');
    }


}

module.exports = HomeController;