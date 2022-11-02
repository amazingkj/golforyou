<html>

<body>
hello
<form method="post" action="/testinsert" id="myform" enctype="multipart/form-data">
	<input type="file" name="oimage2">
	<input type="button" value="submit" class="btn01" onClick="test()">
</form>
</body>
</html>

<script>
function test(){
	window.event.preventDefault();
	//alert("");
	document.getElementById("myform").submit();
}
</script>