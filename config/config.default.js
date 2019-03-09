exports.keys = "123456";
exports.rememberMe = 60 * 1000 ;//选择记住我之后，session有效时长

exports.security = {
    domainWhiteList:['.127.0.0.1'],  // 安全白名单，以 . 开头
};

exports.session = {
    key: 'EGG_SESS',
    maxAge: 10 * 1000, // 单位毫秒
    httpOnly: true,
    encrypt: true,
};

// 添加 view 配置
exports.view = {
    defaultViewEngine: 'nunjucks',
    mapping: {
        '.tpl': 'nunjucks',
    },
};

exports.logger = {
    level: 'INFO',
    consoleLevel: 'INFO'
};

exports.mysql = {
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
};

// 配置需要的中间件，数组顺序即为中间件的加载顺序
exports.middleware = [ 'gzip' ];

// 配置 gzip 中间件的配置
exports.gzip= {
    threshold: 1048576, // 小于 1mb 的响应体不压缩
};
