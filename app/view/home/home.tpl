{% extends "parent.tpl" %}

{% block head %}
<title>首页</title>
<link rel="stylesheet" href="/public/css/home.css" />
{% endblock %}

{% block content %}
<div class="home">
    hello ! {{user.username}}
    {{helper.formatTime(time)}}
</div>
{% endblock %}
