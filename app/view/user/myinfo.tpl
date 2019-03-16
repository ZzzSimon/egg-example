{% extends "parent.tpl" %}

{% block head %}
<!--注意：模板中已添加bootstrap相关head-->
<!--此处添加<head>标签下的内容-->
<title>设置</title>
{% endblock %}


{% block content %}
<form class="center-block" style="width: 50%"
      method="POST" action="/user/modifyInfo?_csrf={{ ctx.csrf | safe }}" enctype="multipart/form-data">
    <div class="form-group ">
        <img src="{{userInfo.avatar_url}}" id="avatarPic" class="img-circle center-block" style="width: 64px;">
        <input type="file" id="avatarBtn" name="file" style="visibility: hidden">
        <p class="text-center help-block">点击头像更改，只支持jpg,png格式，大小≤ 200 kb</p>
    </div>
    <div class="form-group">
        <label for="username">账号</label>
        <input type="text" class="form-control" id="username" name="username" value="{{userInfo.username}}" disabled>
    </div>
    <div class="form-group">
        <label for="password">新密码</label>
        <input type="password" class="form-control" id="newPassword" placeholder="密码" name="newPassword">
    </div>
    <div class="form-group">
        <label for="password">确认新密码</label>
        <input type="password" class="form-control" id="confirmPassword" placeholder="密码">
        <p class="help-block" id="passwordDiff" style="color: red"></p>
    </div>
    <div class="form-group">
        <label for="phone">手机号</label>
        <input type="text" class="form-control" id="phone" value="{{userInfo.phone}}" name="phone">
    </div>
    <div class="form-group">
        <button type="submit" id="save" class="btn btn-info pull-right">保存</button>
    </div>
</form>
{% endblock %}

{% block script %}
<script>
    $('#confirmPassword').bind('change',function () {
        if ($('#newPassword').val()!== $('#confirmPassword').val()) {
            $('#passwordDiff').text('两次输入的密码不同！');
        }else {
            $('#passwordDiff').text('');
        }

    });
    $('#save').bind('click',function () {
        if ($('#newPassword').val()!== $('#confirmPassword').val()) {
            alert('两次输入的密码不同！');
            return false
        }
    });
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
{% endblock %}