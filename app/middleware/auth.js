

module.exports = (options, app) => {
    return async function auth(ctx, next) {

        if (typeof(ctx.session.user)!=='undefined' || options.noAuth.includes(ctx.path)) {
            await next();
        }else {
            ctx.redirect('/login')
        }
    }
};