{% extends "parent.tpl" %}

{% block head %}
<!--注意：模板中已添加bootstrap相关head-->
<head>我的文章</head>
{% endblock %}


{% block content %}
<!--此处添加<body><div class="container">    </div> </body>下的内容-->
<ul class="article-view view">
    {% for item in list %}
    <li class="item">
        <dl>
            <dt><small style="color: red">{{helper.formatInvisible(item.invisible)}}</small> <a href="{{ item.url }}">{{ item.title }}</a><a class="btn btn-link" href='/modify/{{item.id}}.htm'>编辑</a></dt>
            <dd><small>{{item.author}}</small> 最后更新于 {{helper.formatTime(item.update_time)}}  </dd>
            <dd></dd>
        </dl>
    </li>
    {% endfor %}
</ul>
{% endblock %}

{% block script %}
<!--此处添加js-->
<script>

</script>
{% endblock %}