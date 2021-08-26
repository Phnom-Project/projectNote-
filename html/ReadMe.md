### Separate large html file `http://127.0.0.1:5500/index.html`
> index.html
```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content=
		"width=device-width, initial-scale=1.0">
	<script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	</script>
    <script src='main.js'></script>
</head>
<body>
	<!-- First div -->
	<div id="div-1">
		First Div
		<p>Click to load first html</p>
	</div>
	<!-- Second div -->
	<div id="div-2">
		Second div
		<p>Click to load first html</p>
	</div>
</body>
</html>
```
> div-1.html
```html
<div>home</div>
```
> div-2.html
```html
<div>home2</div>
```
