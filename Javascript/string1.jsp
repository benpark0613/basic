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
			<h1>자바스크립트의 문자열</h1>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	// 자바스크립트의 기본자료형
	// 종류 : 문자(문자열), 숫자, 불린, null, undefined
	// 특징 : 기본자료형이지만 객체처럼 다룰 수 있다. 기본자료형이지만, 멤버변수(프로퍼티)도 있고, 메소드도 있다.
	// var a = "홍길동";		// "홍길동"은 기본자료형값이다.
	// var b = 3.141592;	// 3.1415921는 기본자료형값이다.
	// a.toUpperCase();		// .toUpperCase()메소드를 실행하려고 하면 "홍길동"은 객체로 변한다.
	// b.toFixed(2);		// .toFized()메소드를 실행하려고 하면 3.141592는 객체로 변한다.
	
	// 자바스크립트 String의 주요 프로퍼티와 메소드
	// 주요 프로퍼티
	// length
	var str1 = "홍길동";
	console.log("길이", str1.length);
	
	// 주요 메소드
	// split(구분자) : 문자열을 구분자를 기준으로 나누고, 배열에 담아서 반환한다.
	var str2 = "김유신,이순신,강감찬";
	var names = str2.split(",");	// names = ["김유신", "이순신", "강감찬"]
	console.log(names[0], names[1], names[2]);
	
	// replace(문자, 대체할문자), replace(정규표현식, 대체할문자) : 문자 혹은 정규표현식에 해당하는 글자를 지정된 글자로 대체된 문자를 반환한다.
	var str3 = "나는 빨강색 지붕과 빨강색 대문을 가진 빨강색 벽돌집에서 살고 있다.";
	console.log(str3.replace("빨강", "노랑"));
	console.log(str3.replace(/빨강/g, "노랑"));
	
	// substr(start, length) : start부터 lenght만큼 문자열을 반환한다. 
	// substring(start, end) : start부터 end범위의 문자열을 반환한다.
	var str4 = "문자열을 구분자를 기준으로 나누고, 배열에 담아서 반환한다.";
	console.log(str4.substr(10, 2));
	console.log(str4.substring(10, 13));
	
	// trim() : 문자열의 좌우에 있는 의미없는 공백이 제거된 문자열을 반환한다.
	var str5 = "        abc              def                   ";
	console.log("[", str5.trim(), "]")
	
	
</script>
</body>
</html>