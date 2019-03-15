const path = require('path');
module.exports = appInfo => {
    return {
        keys: "123456",
        rememberMe : 24 * 60 * 60 * 1000, //选择记住我之后，session有效时长
        security : {
            domainWhiteList:['.127.0.0.1'],  // 安全白名单，以 . 开头
        },
        multipart : {
            mode: 'file',
            tmpdir: path.join(appInfo.baseDir, 'app/public/temp'),
        },
        session : {
            key: 'EGG_SESS',
            maxAge: 10 * 1000, // 单位毫秒
            httpOnly: true,
            encrypt: true,
        },
        view : {
            defaultViewEngine: 'nunjucks',
            mapping: {
                '.tpl': 'nunjucks',
            },
        },
        logger: {
            level: 'INFO',
            consoleLevel: 'INFO'
        },
        mysql : {
            // 单数据库信息配置
            client: {
                // host
                host: 'localhost',
                // 端口号
                port: '3306',
                // 用户名
                user: 'root',
                // 密码
                password: 'root',
                // 数据库名
                database: 'egg-example',
            },
            // 是否加载到 app 上，默认开启
            app: true,
            // 是否加载到 agent 上，默认关闭
            agent: false,
        },
        // 配置需要的中间件，数组顺序即为中间件的加载顺序
        middleware : [ 'auth','gzip' ],
        gzip : {
            threshold: 1048576, // 小于 1mb 的响应体不压缩
        },
        auth : {
            noAuth:['/login.htm','/user/login','/register.htm','/user/register'],
            noPermission:{
                admin:[],
                manager:['/admin'],
                user:['/admin','/edit.htm','/news/save','/edit/uploadPic']
            }
        },
    };
};