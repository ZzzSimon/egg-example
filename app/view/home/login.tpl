<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/public/css/home.css" />
</head>
<body>
<form method="POST" action="/user/login?_csrf={{ ctx.csrf | safe }}" enctype="application/x-www-form-urlencoded">
    username: <input name="username" />
    password: <input name="password"  />
    Remember Me:<input type="checkbox" name="rememberMe">
    <button type="submit">登录</button>
</form>
</body>
</html>