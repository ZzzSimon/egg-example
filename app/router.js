module.exports = app => {
    const { router, controller } = app;

    //页面
    router.get('/', controller.home.index);
    router.get('/edit.htm',controller.edit.index);
    router.get('/login.htm',controller.home.login);
    router.get('/article/:id',controller.article.detail);
    router.get('/article.htm', controller.article.list);
    router.get('/register.htm', controller.home.register);
    router.get('/myarticle.htm',controller.article.myarticle);
    //接口
    router.post('/user/login',controller.user.login);
    router.get('/user/logout',controller.user.logout);
    router.post('/article/save',controller.article.save);
    router.post('/edit/uploadPic',controller.edit.uploadPic);
    router.post('/user/register',controller.user.register);
    router.get('/user/userInfo',controller.user.userInfo);
};
