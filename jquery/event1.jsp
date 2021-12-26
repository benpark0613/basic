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
			<h1>이벤트 처리</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<h3 class="fs-5">인라인 이벤트 처리</h3>
			<div>
				<button class="btn btn-primary" id="btn-1" onclick="eventHandler()">버튼</button>
			</div>
		</div>
		<div class="col-3">
			<h3 class="fs-5">엘리먼트의 onXXX에 이벤트 핸들러 함수를 등록해서 이벤트 처리</h3>
			<div>
				<button class="btn btn-primary" id="btn-2">버튼</button>
			</div>
		</div>
		<div class="col-3">
			<h3 class="fs-5">엘리먼트의 addEventListener로 이벤트 핸들러 함수를 등록해서 이벤트 처리</h3>
			<div>
				<button class="btn btn-primary" id="btn-3">버튼</button>
			</div>
		</div>
		<div class="col-3">
			<h3 class="fs-5">jQuery로 이벤트 처리</h3>
			<div>
				<button class="btn btn-primary" id="btn-4">버튼</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function eventHandler() {
		alert("버튼이 클릭되었습니다.")
	}
	
	/*
	var btn2 = document.getElementById("btn-2");
	btn2.onclick = eventHandler;	// btn2엘리먼트의 onclick 프로퍼티에 eventHandler함수를 등록한다.
	
	var btn3 = document.getElementById("btn-3");
	btn3.addEventListener("click", eventHandler);	// btn3엘리먼트에서 onclick 이벤트 발생시 실행할 함수로 eventHandler를 전달한다.
	
	$("#btn-4").on('click', eventHandler);	// 아이디가 "btn-4"인 엘리먼트를 선택자함수로 찾고, 엘리먼트에서 click 이벤트 발생시 실행할 함수로 eventHandler를 전달한다.
	*/
	
	document.getElementById("btn-2").onclick = function(event) {
		alert("2번째 버튼이 클릭되었습니다.");
	};
	
	document.getElementById("btn-3").addEventListener("click", function(event) {
		alert("3번째 버튼이 클릭되었습니다.");
	});
	
	$("#btn-4").on('click', function(event) {
		alert("4번째 버튼이 클릭되었습니다.");
	});
	
</script>
</body>
</html>