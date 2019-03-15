<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/public/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="/public/bootstrap/js/bootstrap.min.js"></script>
    {% block head %}{% endblock %}
</head>

<body>
<div id="nav">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">妖云小离</a>
            </div>

            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/article.htm">文章</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Separated link</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/edit.htm"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 发表文章</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">
                            <img src="" id="avatarNav" class="img-circle" style="width: 26px; margin-top: -6px">
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/myarticle.htm">我的文章</a></li>
                            <li><a href="#">设置</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/user/logout">注销</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

        </div>
    </nav>
</div>
<div id="top" class="row" style="margin-top: 10%"></div>
<div class="container">
    {% block content %}{% endblock %}
</div>

<script type="text/javascript">
    function getCookie(c_name)
    {
        if (document.cookie.length>0)
        {
            c_start=document.cookie.indexOf(c_name + "=")
            if (c_start!=-1)
            {
                c_start=c_start + c_name.length+1
                c_end=document.cookie.indexOf(";",c_start)
                if (c_end==-1) c_end=document.cookie.length
                return unescape(document.cookie.substring(c_start,c_end))
            }
        }
        return ""
    }
    $('#avatarNav').attr('src',getCookie('avatarUrl'));
</script>
{% block script %}{% endblock %}
</body>
</html>