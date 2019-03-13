const Controller = require('egg').Controller;
const fs = require('mz/fs');
const path = require('path');

class EditController extends Controller{
    async index(){
        const {ctx, service} = this;
        await ctx.render('home/edit.tpl');
    }

    async uploadPic(){
        const { ctx } = this;
        const file = ctx.request.files[0];
        console.log('field: ' + file.fieldname);
        console.log('filename: ' + file.filename);
        console.log('encoding: ' + file.encoding);
        console.log('mime: ' + file.mime);
        console.log('tmp filepath: ' + file.filepath);

        try {
            // 处理文件，比如上传到云端
            // result = await fs.writeFile(target, file);
        } finally {
            // 需要删除临时文件
            //await fs.unlink(file.filepath);
        }

        ctx.body = {
            success : 1, //0表示上传失败;1表示上传成功
            message : "上传成功",
            url     : file.filepath.toString().split(this.config.baseDir+'\\app')[1] //上传成功时才返回
        }
    }
}

module.exports = EditController;