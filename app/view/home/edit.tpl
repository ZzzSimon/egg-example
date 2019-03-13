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
        <input id="title" type="text" class="form-control">
    </div>
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

    let testEditor = editormd("test-editormd", {
        width: "100%",
        height: 740,
        path: '/public/editormd/lib/',
        // theme: "dark",
        // previewTheme: "dark",
        // editorTheme: "pastel-on-dark",
        // markdown: md,
        codeFold: true,
        //syncScrolling : false,
        saveHTMLToTextarea: true,    // 保存 HTML 到 Textarea
        searchReplace: true,
        //watch : false,                // 关闭实时预览
        htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
        //toolbar  : false,             //关闭工具栏
        //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
        emoji: true,
        taskList: true,
        tocm: true,         // Using [TOCM]
        tex: true,                   // 开启科学公式TeX语言支持，默认关闭
        flowChart: true,             // 开启流程图支持，默认关闭
        sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
        //dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
        //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
        //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
        //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
        //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
        imageUpload: true,
        imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
        imageUploadURL: "/edit/uploadPic?_csrf={{ ctx.csrf | safe }}",

   /*  后端需返回：   {
            success : 0 | 1, //0表示上传失败;1表示上传成功
            message : "提示的信息",
            url     : "图片地址" //上传成功时才返回
        }*/
        onload: function () {
            console.log('onload', this);
            //this.fullscreen();
            //this.unwatch();
            //this.watch().fullscreen();

            //this.setMarkdown("#PHP");
            //this.width("100%");
            //this.height(480);
            //this.resize("100%", 640);
        }
    });

    $('#save').bind('click', function () {
        data = {
            news: {
                title: $('#title').val(),
                detail: testEditor.getMarkdown()
            }
        };

        $.post('/news/save?_csrf={{ ctx.csrf | safe }}', data, function (resp) {
            if (resp.flag === '1') {
                window.location.href = resp.url;
            }
        })
    })


</script>
{% endblock %}
