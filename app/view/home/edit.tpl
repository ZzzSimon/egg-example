<!DOCTYPE html>
<html>
<head>
    <title>Markdown Editor</title>
    <!--<link rel="stylesheet" href="/public/css/edit.css">-->
    <link rel="stylesheet" href="/public/highlight/styles/agate.css">
    <script type="text/javascript" src="/public/js/showdown.min.js"></script>
    <script type="text/javascript" src="/public/highlight/highlight.pack.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
</head>
<body>
<div>
    <table>

        <tr>
            <td>
    <textarea id="oriContent" style="height:400px;width:600px;" onkeyup="convert()">
```
public static void main(String[] args) {

}
```
    </textarea>
            </td>
            <td>
                <div id="result"></div>
            </td>
        </tr>
    </table>

</div>

<script type="text/javascript">
    convert();
    function convert(){
        var text = document.getElementById("oriContent").value;
        var converter = new showdown.Converter();
        var html = converter.makeHtml(text);
        document.getElementById("result").innerHTML = html;
        hljs.highlightBlock(document.getElementById("result"));
    }
</script>
</body>
</html>