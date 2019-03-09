const Controller = require('egg').Controller;

class EditController extends Controller{
    async index(){
        const {ctx, service} = this;
        await ctx.render('home/edit.tpl');
    }
}

module.exports = EditController;