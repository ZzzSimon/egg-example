module.exports = (options, app) => {
    return async function auth(ctx, next) {

        if (typeof (ctx.session.user) !== 'undefined') {
            const username = ctx.session.user.username;
            //这里有两种做法，第一种每次都查库校验角色，优点：实时，角色变更对用户无感。缺点：查库效率低，可考虑用redis
            //第二种，把角色信息放进session,优点：无需查库，效率高。缺点：角色变更时需额外逻辑来处理老的session，否则用户角色无法实时更新
            const role = await ctx.service.user.getRoleByUsername(username);
            const noPerList = options.noPermission[role];
            if (noPerList && !noPerList.includes(ctx.path)) {
                await next();
            } else {
                ctx.body = '无权限，请联系网站管理员！';
            }
        } else if (options.noAuth.includes(ctx.path)) {
            await next();
        } else {
            ctx.redirect('/login.htm')
        }
    }
};