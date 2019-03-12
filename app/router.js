module.exports = app => {
    const { router, controller } = app;

    //页面
    router.get('/', controller.home.index);
    router.get('/edit.htm',controller.edit.index);
    router.get('/login.htm',controller.home.login);
    router.get('/news/:id',controller.news.detail);
    router.get('/news.htm', controller.news.list);

    //接口
    router.post('/user/login',controller.user.login);
    router.post('/news/save',controller.news.save);
};
