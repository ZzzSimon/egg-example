const Controller = require('egg').Controller;

class NewsController extends Controller {
    async list() {
        const ctx = this.ctx;
        const page = ctx.query.page || 1;
        const newsList = await ctx.service.news.list(page);
        await ctx.render('news/list.tpl', { list: newsList });
    }

    async detail(){
        const ctx = this.ctx;
        const queryRes = await ctx.service.news.detail(ctx.params.id);
        ctx.body = queryRes[0].detail;
    }
}

module.exports = NewsController;

