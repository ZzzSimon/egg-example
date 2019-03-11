<!DOCTYPE html>
<html>
<head>
    <title>Markdown Editor</title>
    <link rel="stylesheet" href="/public/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/public/highlight/styles/agate.css">
    <link rel="stylesheet" href="/public/editormd/editormd.css">
    <script type="text/javascript" src="/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="/public/js/showdown.min.js"></script>
    <script type="text/javascript" src="/public/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/public/highlight/highlight.pack.js"></script>
    <script type="text/javascript" src="/public/editormd/editormd.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
</head>
<body>
<div class="container">

    <div class="row">
        <div class="col-md-6">
            <textarea id="oriContent" style="height: 600px;width:100%;" onkeyup="convert()"></textarea>
        </div>
        <div class="col-md-6">
            <div id="result" style="height: 600px;width:100%;background: #0f0f0f" ></div>
        </div>
    </div>
    <div class="row">
        文章标题：
        <input id="title" >
    </div>
    <div class="row">
        <div id="layout">
            <div id="test-editormd"></div>
        </div>
    </div>
    <div class="row">
        <button id="save" title="保存">保存</button>
    </div>
</div>

<script type="text/javascript">
    convert();

    function convert() {
        var text = document.getElementById("oriContent").value;
        var converter = new showdown.Converter();
        var html = converter.makeHtml(text);
        document.getElementById("result").innerHTML = html;
        hljs.highlightBlock(document.getElementById("result"));
    }

    let testEditor = editormd("test-editormd", {
        width: "100%",
        height: 740,
        path: '/public/editormd/lib/',
        theme: "dark",
        previewTheme: "dark",
        editorTheme: "pastel-on-dark",
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
        imageUploadURL: "./php/upload.php",
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

    $('#save').bind('click',function () {
        data = {
            news:{
                title:$('#title').val(),
                detail:testEditor.getMarkdown()
            }
        };

        $.post('/news/save?_csrf={{ ctx.csrf | safe }}',data,function (data) {
            console.log(data)
        })
    })


</script>
</body>
</html>