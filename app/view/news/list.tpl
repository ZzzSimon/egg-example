{% extends "parent.tpl" %}

{% block head %}
<title>文章列表</title>
<link rel="stylesheet" href="/public/css/news.css"/>
{% endblock %}


{% block content %}
<ul class="news-view view">
    {% for item in list %}
    <li class="item">
        <a href="{{ item.url }}">{{ item.title }}</a>
    </li>
    {% endfor %}
</ul>
{% endblock %}