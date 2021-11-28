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
	<h1>javascript의 변수가 가지는 타입들</h1>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	// 자바스크립트 기본형 타입
	
	// undefined 타입
	// 초기화되지 않은 변수가 가지는 타입이다. (값이 할당되지 않은 변수)
	// undefined 타입의 변수는 undefined 값을 가진다.
	// 변수를 정의하면 그 변수는 undefined 타입의 변수가 되고, 값은 undefined를 가진다.
	var a;
	console.log("a의 타입", typeof a);
	console.log("a의 값", a);
	
	// number 타입
	// 변수에 정수 혹은 실수가 대입되면 number 타입이 된다.
	var b;		// 변수 b의 타입 : undefined	변수 b의 값 : undefined
	console.log("b의 타입", typeof b);
	console.log("b의 값", b);
	b = 10; 	// 변수 b의 타입 : number		변수 b의 값 : 10
	console.log("b의 타입", typeof b);
	console.log("b의 값", b);
	
	var c = 3.14;
	console.log("c의 타입", typeof c);
	console.log("c의 값", c);
	
	// string 타입
	// 변수에 문자열이 대입되면 string 타입이 된다.
	var d = "";
	console.log("d의 타입", typeof d);
	console.log("d의 값", d);
	var e = "홍길동";
	console.log("e의 타입", typeof e);
	console.log("e의 값", e);
	
	// boolean 타입
	// 변수에 true 혹은 false가 대입되면 boolean 타입이 된다.
	var f = false;
	var g = true;
	console.log("f의 타입", typeof f);
	console.log("f의 값", f);
	
	/*
		자바스크립트에서 false로 판정되는 것
			false, 길이가 0인 문자열, 0, undefined, null, NaN
		if (false)
		if (0)
		if ('')
		if (undefined)
		if (null)
		if (NaN)
			
		+ 위에 나열한 6가지를 제외한 모든 값은 true다.
	*/
</script>
</body>



















</html>