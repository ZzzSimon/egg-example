<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="/public/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="/public/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container ">
    <form class="center-block" style="width: 50%;margin-top: 10%"
          method="POST" action="/user/register?_csrf={{ ctx.csrf | safe }}" enctype="multipart/form-data">
        <div class="form-group ">
            <img src="/public/avatar/default.jpg" id="avatarPic" class="img-circle center-block" style="width: 64px;">
            <input type="file" id="avatarBtn" name="file" style="visibility: hidden">
            <p class="text-center help-block">点击头像更改，只支持jpg,png格式，大小≤ 200 kb</p>
        </div>
        <div class="form-group">
            <label for="username">账号</label>
            <input type="text" class="form-control" id="username" placeholder="用户名" name="username">
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" class="form-control" id="password" placeholder="密码" name="password">
        </div>
        <div class="form-group">
            <label for="phone">手机号</label>
            <input type="text" class="form-control" id="phone" placeholder="手机号" name="phone">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-info pull-right">注册</button>
        </div>
    </form>
</div>
<script>
    $('#avatarBtn').bind('change',function (e) {
        if (window.FileReader) {
            var reader = new FileReader();
            reader.readAsDataURL(e.target.files[0]);
            //监听文件读取结束后事件
            reader.onloadend = function (e) {
                //e.target.result就是最后的路径地址
                $('#avatarPic').prop("src",e.target.result);
            };
        }
    });
    $('#avatarPic').bind('click', function () {
        $('#avatarBtn').click();
    });

</script>
</body>
</html>