const Controller = require('egg').Controller;
const fs = require('mz/fs');


class EditController extends Controller{
    async index(){
        const {ctx, service} = this;
        await ctx.render('article/edit.tpl');
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