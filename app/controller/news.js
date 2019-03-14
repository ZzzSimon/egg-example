const Controller = require('egg').Controller;

class NewsController extends Controller {
    async list() {
        const ctx = this.ctx;
        const newsList = await ctx.service.news.list();
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
        const news = ctx.request.body.news;
        news.id = ctx.helper.uuid();
        news.url = '/news/'+news.id;
        news.author = ctx.session.user.username;
        const nowTime = new Date();
        news.create_time = nowTime;
        news.update_time = nowTime;
        console.log(news.visibility);
        const result = await ctx.service.news.save(news);
        // 判断插入成功
        const insertSuccess = result.affectedRows === 1;
        if (insertSuccess) {
            ctx.body = {flag:'1',msg:'保存成功',url:news.url}
        }else {
            ctx.body = {flag:'0',msg:'保存失败'}
        }
    }
}

module.exports = NewsController;

