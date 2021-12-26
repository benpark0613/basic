<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title></title>
</head>
<body>
<div class="container">    
	<div class="row">
		<div class="col">
			<input type="text" class="form-control w-50" name="score" value="90"/>
			<input type="text" class="form-control w-50" name="score" value="70"/>
			<input type="text" class="form-control w-50" name="score" value="60" />
			<input type="text" class="form-control w-50" name="score" value="50" />
			<input type="text" class="form-control w-50" name="score" value="100" />
			<input type="text" class="form-control w-50" name="score" value="80" />
			<input type="text" class="form-control w-50" name="score" value="70" />
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	var elements = document.querySelectorAll('[name=score]');
	
	var totalScore = 0;
	elements.forEach(el => totalScore += parseInt(el.value));
	console.log("합계", totalScore);
	
	/*
	elements.forEach(function(el) {
		var score = parseInt(el.value);
		totalScore += score;
	});
	*/
	
	
</script>
</body>
</html>