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
			<h1>함수를 파라미터를 전달하기</h1>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function 계산기(num1, num2, type) {
		if (type === '더하기') {
			console.log("결과", num1 + num2)
		} else if (type === '곱하기') {
			console.log("결과", num1*num2)
		}
	}
	
	계산기(10, 20, '더하기');
	계산기(10, 20, '곱하기');
	
	// 함수를 매개변수로 전달받는 함수
	// 새로운 연산기능이 추가되더라도 계산기2()의 코드를 변경할 필요가 없다.
	// 계산기2()는 두 수를 연산하는 기능을 직접 구현하지 않고, 연산 기능이 구현된 함수를 전달받아서 그 함수를 실행시키기만 한다.
	function 계산기2(num1, num2, fn) {
		fn(num1, num2);
	}
	
	function plus(a, b) {
		console.log(a + b);
	}	
	function minus(a, b) {
		console.log(a - b);
	}
	
	// 계산기2()함수를 실행할 때 미리 정의된 함수를 전달했다.
	계산기2(100, 200, plus);	// 계산기2(100, 200, function plus(a, b) { console.log(a + b)} )
	계산기2(100, 200, minus);	// 계산기2(100, 200, function minus(a, b) { console.log(a - b)} )
	// 계산기2()함수를 실행할 때 익명함수를 호출싯점에 직접 작성해서 전달했다.
	계산기2(100, 200, function(a, b) {
		console.log(a*b);
	})
	계산기2(100, 200, function(a, b) {
		console.log(a/b);
	})
</script>
</body>
</html>