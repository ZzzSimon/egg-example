const Controller = require('egg').Controller;

class ArticleController extends Controller {

    async myarticle(){
        const ctx = this.ctx;
        const articleList = await ctx.service.article.getArticleByAuthor(ctx.session.user.username);
        await ctx.render('article/myarticle.tpl', { list: articleList });
    }

    async list() {
        const ctx = this.ctx;
        const articleList = await ctx.service.article.list();
        await ctx.render('article/list.tpl', { list: articleList });
    }

    async detail(){
        const ctx = this.ctx;
        const queryRes = await ctx.service.article.detail(ctx.params.id);
        ctx.logger.info(queryRes);
        await ctx.render('article/detail.tpl', { article: queryRes[0] });
    }




}

module.exports = ArticleController;

