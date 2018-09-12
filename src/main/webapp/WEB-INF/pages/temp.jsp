<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script type="text/javascript">
        function toggle_show(id) {
            document.getElementById(id).style.display = document.getElementById(id).style.display == 'none' ? 'block' : 'none';
        }
    </script>
</head>
<body>

<ul>
    <li>Название 1</li>
    <li onClick="toggle_show('bla-bla2')">Название 2
        <ul id="bla-bla2" style="display: none">
            <li>Бла Бла Бла</li>
            <li>Бла Бла Бла</li>
            <li>Бла Бла Бла</li>
        </ul>
    </li>
    <li>Название 3</li>
</ul>
</body>
</html>