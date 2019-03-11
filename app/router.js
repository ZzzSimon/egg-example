module.exports = app => {
    const { router, controller } = app;
    router.get('/', controller.home.index);
    router.get('/news', controller.news.list);
    router.get('/news/:id',controller.news.detail);
    router.get('/login',controller.home.login);
    router.post('/user/login',controller.user.login);
    router.get('/edit',controller.edit.index);
    router.post('/news/save',controller.news.save);
};
