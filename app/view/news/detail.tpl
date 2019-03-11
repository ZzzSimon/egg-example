<html>
<head>
    <title>News</title>

    <link rel="stylesheet" href="/public/editormd/editormd.css">
    <script type="text/javascript" src="/public/js/jquery.min.js"></script>

    <!-- <script src="js/zepto.min.js"></script>
		<script>
			var jQuery = Zepto;  // 为了避免修改flowChart.js和sequence-diagram.js的源码，所以使用Zepto.js时想支持flowChart/sequenceDiagram就得加上这一句
		</script> -->
    <script src="/public/editormd/lib/marked.min.js"></script>
    <script src="/public/editormd/lib/prettify.min.js"></script>
    <script src="/public/editormd/lib/raphael.min.js"></script>
    <script src="/public/editormd/lib/underscore.min.js"></script>
    <script src="/public/editormd/lib/sequence-diagram.min.js"></script>
    <script src="/public/editormd/lib/flowchart.min.js"></script>
    <script src="/public/editormd/lib/jquery.flowchart.min.js"></script>
    <script type="text/javascript" src="/public/editormd/editormd.js"></script>
</head>
<body>
{{news.title}}<br>
<div id="detail" style="visibility: hidden">{{news.detail}}</div>
<div id="layout">
    <div id="test-editormd-view">

    </div>
</div>


<script type="text/javascript">
    $(function () {
        let markdown = $('#detail').text();
        var testEditormdView = editormd.markdownToHTML("test-editormd-view", {
            markdown: markdown,//+ "\r\n" + $("#append-test").text(),
            //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
            htmlDecode: "style,script,iframe",  // you can filter tags decode
            //toc             : false,
            tocm: true,    // Using [TOCM]
            //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
            //gfm             : false,
            //tocDropdown     : true,
            // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
            emoji: true,
            taskList: true,
            tex: true,  // 默认不解析
            flowChart: true,  // 默认不解析
            sequenceDiagram: true,  // 默认不解析
        });

        //console.log("返回一个 jQuery 实例 =>", testEditormdView);

        // 获取Markdown源码
        //console.log(testEditormdView.getMarkdown());

        //alert(testEditormdView.getMarkdown());


    });
</script>
</body>
</html>