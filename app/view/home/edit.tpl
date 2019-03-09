<!DOCTYPE html>
<html>
<head>
    <title>Markdown Editor</title>
    <link rel="stylesheet" href="/public/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/public/highlight/styles/agate.css">
    <script type="text/javascript" src="/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="/public/js/showdown.min.js"></script>
    <script type="text/javascript" src="/public/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/public/highlight/highlight.pack.js"></script>
    <!--<script>hljs.initHighlightingOnLoad();</script>-->
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
</script>
</body>
</html>