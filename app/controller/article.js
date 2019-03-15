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

    async save(){
        const ctx = this.ctx;
        const article = ctx.request.body.article;
        article.id = ctx.helper.uuid();
        article.url = '/article/'+article.id;
        article.author = ctx.session.user.username;
        const nowTime = new Date();
        article.create_time = nowTime;
        article.update_time = nowTime;
        console.log(article.visibility);
        const result = await ctx.service.article.save(article);
        // 判断插入成功
        const insertSuccess = result.affectedRows === 1;
        if (insertSuccess) {
            ctx.body = {flag:'1',msg:'保存成功',url:article.url}
        }else {
            ctx.body = {flag:'0',msg:'保存失败'}
        }
    }


}

module.exports = ArticleController;

