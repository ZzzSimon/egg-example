{% extends "parent.tpl" %}

{% block head %}
<title>Markdown Editor</title>
<link rel="stylesheet" href="/public/editormd/editormd.css">
<script type="text/javascript" src="/public/editormd/editormd.js"></script>
{% endblock %}

{% block content %}

<div class="row">
    <div class="form-group">
        <label for="title">文章标题：</label>
        <input id="title" type="text" class="form-control" value="{{article.title}}" disabled>
    </div>
    <div class="checkbox ">
        <label>
            <input id="invisible" type="checkbox">保密(勾选后将<strong style="color: red">不显示</strong>在文章列表)
        </label>
    </div>
    <div id="detail" style="visibility: hidden">{{article.detail}}</div>
    <div class="form-group pull-right">
        <button id="save" class="btn btn-success ">保存</button>
    </div>
</div>
<div class="row">
    <div id="layout">
        <div id="test-editormd"></div>
    </div>
</div>
{% endblock %}


{% block script %}
<script type="text/javascript">
    const markdown = $('#detail').text();
    let testEditor = editormd("test-editormd", {
        width: "100%",
        height: 740,
        path: '/public/editormd/lib/',
        markdown: markdown,
        codeFold: true,
        saveHTMLToTextarea: true,    // 保存 HTML 到 Textarea
        searchReplace: true,
        htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
        emoji: true,
        taskList: true,
        tocm: true,         // Using [TOCM]
        tex: true,                   // 开启科学公式TeX语言支持，默认关闭
        flowChart: true,             // 开启流程图支持，默认关闭
        sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
        imageUpload: true,
        imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
        imageUploadURL: "/edit/uploadPic?_csrf={{ ctx.csrf | safe }}",
        onload: function () {
            console.log('onload', this);
        }
    });

    $('#save').bind('click', function () {
        data = {
            article: {
                id: '{{article.id}}',
                detail: testEditor.getMarkdown(),
                invisible: $('#invisible').prop('checked')  ? 1:0
            }
        };

        $.post('/edit/modify?_csrf={{ ctx.csrf | safe }}', data, function (resp) {
            if (resp.flag === '1') {
                window.location.href = resp.url;
            }else {
                alert(resp)
            }
        })
    })


</script>
{% endblock %}
