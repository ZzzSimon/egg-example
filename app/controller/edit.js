const Controller = require('egg').Controller;
const fs = require('mz/fs');


class EditController extends Controller{
    async editHtm(){
        await this.ctx.render('article/edit.tpl');
    }

    async modifyHtm(){
        const {ctx, service} = this;
        const article = await service.article.getArticleById(ctx.params.id);
        await ctx.render('article/modify.tpl',{article:article})
    }

    async save(){
        const ctx = this.ctx;
        const article = ctx.request.body.article;
        article.id = ctx.helper.uuid();
        article.url = '/article/'+article.id+'.htm';
        article.author = ctx.session.user.username;
        const nowTime = new Date();
        article.create_time = nowTime;
        article.update_time = nowTime;
        const result = await ctx.service.article.save(article);
        if (result) {
            ctx.body = {flag:'1',msg:'保存成功',url:article.url}
        }else {
            ctx.body = {flag:'0',msg:'保存失败'}
        }
    }

    async modify(){
        const {ctx, service} = this;
        const article = ctx.request.body.article;
        const nowTime = new Date();
        article.update_time = nowTime;
        const result = await service.article.modify(article);
        if (result) {
            ctx.body = {flag:'1',msg:'保存成功',url:'/article/'+article.id+'.htm'}
        }else {
            ctx.body = {flag:'0',msg:'保存失败'}
        }
    }

    async uploadPic(){
        const { ctx } = this;
        const file = ctx.request.files[0];
        // console.log('file Suffix: ' + file.filename.split('.').pop());
        // console.log('filename: ' + file.filename);
        // console.log('encoding: ' + file.encoding);
        // console.log('mime: ' + file.mime);
        // console.log('tmp filepath: ' + file.filepath);
        // console.log('file:%j', file);
        let filenameNew = ctx.helper.uuid() +'.'+  file.filename.split('.').pop();
        let filepathNew = this.config.baseDir+'\\app\\public\\mdPic\\'+filenameNew;
        //把临时文件剪切到新目录去
        await fs.rename(file.filepath, filepathNew);
        //按editormd要求格式返回
        ctx.body = {
            success : 1, //0表示上传失败;1表示上传成功
            message : "上传成功",
            url     : filepathNew.split(this.config.baseDir+'\\app')[1] //上传成功时才返回
        }
    }
}

module.exports = EditController;