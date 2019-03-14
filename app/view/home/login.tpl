<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/public/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="/public/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container ">
    <form class="center-block" style="width: 50%;margin-top: 20%"
          method="POST" action="/user/login?_csrf={{ ctx.csrf | safe }}" enctype="application/x-www-form-urlencoded">
        <div class="form-group">
            <label for="username">账号</label>
            <input type="text" class="form-control" id="username" placeholder="用户名" name="username">
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" class="form-control" id="password" placeholder="密码" name="password">
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" name="rememberMe">记住登录状态
            </label>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-info pull-right">登录</button>
            <div>
                <a href="/register.htm" class="btn btn-link pull-right">注册</a>
            </div>

        </div>
    </form>
</div>

</body>
</html>