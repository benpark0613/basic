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
	<div class="row mb-3">
		<div class="col">
			<h1>jQuery의 이벤트핸들러함수에서 this</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<button class="btn btn-primary">버튼 1</button>
			<button class="btn btn-primary">버튼 2</button>
			<button class="btn btn-primary">버튼 3</button>
			<button class="btn btn-primary">버튼 4</button>
			<button class="btn btn-primary">버튼 5</button>
		</div>
	</div>
	<div class="row mb-3">
		<ul class="list-group">
			<li class="list-group-item">홍길동 <button class="btn btn-danger btn-sm float-end">삭제</button></li>
			<li class="list-group-item">김유신 <button class="btn btn-danger btn-sm float-end">삭제</button></li>
			<li class="list-group-item">강감찬 <button class="btn btn-danger btn-sm float-end">삭제</button></li>
			<li class="list-group-item">이순신 <button class="btn btn-danger btn-sm float-end">삭제</button></li>
			<li class="list-group-item">류관순 <button class="btn btn-danger btn-sm float-end">삭제</button></li>
		</ul>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	$(".row:eq(1) .btn").click(function() {
		// this에는 이벤트가 발생한 엘리먼트객체(jQuery결과집합객체가 아님)가 전달된다. 
		// this를 바로 사용하지 않고, $(this)를 실행해서 jQuery결과집합객체를 획득한 다음 사용한다.
		$(this).prop('disabled', true);
	});
	
	$(".btn-danger").click(function() {
		// this는 이벤트가 발생한 엘리먼트객체다.
		// $(this)는 이벤트가 발생한 엘리먼트를 포함하는 jQuery결과집합객체다.
		// $(this).parent()는 이벤트가 발생한 엘리먼트의 부모엘리먼트를 포함하는 jQuery결과집합객체다.
		// $(this).parent().remove()는 이벤트가 발생한 엘리먼트의 부모엘리먼트를 삭제하는 코드다.
		$(this).parent().remove();
	})

/*
	function fn() {
		console.log(this);
	}
	
	var obj1 = {
			name: "object1",
			fn: function() {
				console.log(this);
			}
	}
	
	var obj2 = {
			name: "object2"
	}
	
	// Window객체가 콘솔에 출력된다.
	fn();	
	// obj1객체가 콘솔에 출력된다.
	obj1.fn();
	// obj2객체가 콘솔에 출력된다. 즉, 함수의 this는 고정적이지 않다. 함수의 this에 임의의 객체를 전달하는 것이 가능하다.
	obj1.fn.call(obj2);
*/
	
	
</script>
</body>
</html>









