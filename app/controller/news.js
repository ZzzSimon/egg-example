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
        ctx.logger.info(queryRes);
        await ctx.render('news/detail.tpl', { news: queryRes[0] });
    }

    async save(){
        const ctx = this.ctx;
        ctx.logger.info(ctx.request.body);
        const result = await ctx.service.news.save(ctx.request.body.news);
        // 判断插入成功
        const insertSuccess = result.affectedRows === 1;
        if (insertSuccess) {
            ctx.body = {flag:'1',msg:'保存成功'}
        }
    }
}

module.exports = NewsController;

