{% extends "parent.tpl" %}

{% block head %}
<title>文章列表</title>
{% endblock %}


{% block content %}
<ul class="article-view view">
    {% for item in list %}
    <li class="item">
        <dl>
            <dt><a href="{{ item.url }}">{{ item.title }}</a></dt>
            <dd><small>{{item.author}}</small> 最后更新于 {{helper.formatTime(item.update_time)}}</dd>
        </dl>
    </li>
    {% endfor %}
</ul>
{% endblock %}