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
			<h1>EL 표현식 연습1</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>기본자료형타입, String타입의 값을 요청객체의 속성으로 저장한 경우</h3>
			<%-- EL 표현식
							${속성명 }
							
							${속성명 }					-> 기본자료형값 혹은 String값이 조회됨
			--%>
			<p>메세지		: ${message }</p>
			<p>조회수		: ${viewCount }</p>
			<p>삭제여부 	: ${userDeleted }</p>
			<p>할인율		: ${discountRate }</p>
			<p>부서명		: ${deptName }</p>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>기본자료형, String을 요소로 포함하는 배열타입의 값을 요청객체의 속성으로 저장한 경우</h3>
			<%-- EL 표현식
							${속성명[인덱스] }
							
							${속성명 }						-> 배열객체가 조회됨
							${속성명[인덱스] }				-> 배열객체에서 지정된 인덱스번째의 값이 조회됨
			--%>
			<ul>
				<li>${names[0] }</li>
				<li>${names[1] }</li>
				<li>${names[2] }</li>
			</ul>
			<ul>
				<li>${scores[0] }</li>
				<li>${scores[1] }</li>
				<li>${scores[2] }</li>
				<li>${scores[3] }</li>
				<li>${scores[4] }</li>
				<li>${scores[5] }</li>	<!--  인덱스 범위를 벗어난 값을 조회하면 "" 값이 출력된다. -->
			</ul>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>객체타입(VO객체, DTO객체)의 값을 요청객체의 속성으로 저장한 경우</h3>
			<%-- EL 표현식
							${속성명.프로퍼티명 }
							${속성명["프로퍼티명"] }
							
							${속성명 }					-> User객체가 조회됨
							${속성명.변수명 }				-> User객체에서 지정된 변수명로 저장된 값이 조회됨
			--%>
			<p>${u1.id } ${u1.password } ${u1.name } ${u1.createdDate }</p>
			<p>${u2.id } ${u2.password } ${u2.name } ${u2.createdDate }</p>
			<p>${u3["id"] } ${u3["password"] } ${u3["name"] } ${u3["createdDate"] }</p>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>Map타입의 값을 요청객체의 속성을 저장한 경우</h3>
			<%-- EL 표현식
							${속성명.key }
							${속성명["key"] }
							
							${속성명 }						-> Map객체가 조회됨
							${속성명.key }					-> Map객체에 지정된 key로 저장된 값이 조회됨
			--%>
			<p>${dept.id }</p> <p>${dept.name }</p> <p>${dept.manager }</p> <p>${dept["address"] }</p> <p>${dept['tel'] }</p>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>객체(VO객체, DTO객체)을 요소로 포함하는 List타입의 값을 요청객체의 속성으로 저장한 경우 </h3>
			<%-- EL 표현식
							${속성명[인덱스].프로퍼티명 }
							${속성명[인덱스]["프로퍼티명"] }
							
							${속성명 }						-> List객체가 조회됨
							${속성명[인덱스] } 				-> List객체의 지정된 인덱스에 저장된 VO객체나 DTO객체가 조회됨
							${속성명[인덱스].프로퍼티명 }			-> List객체의 지정된 인덱스에 저장된 VO객체나 DTO객체의 멤버변수에 저장된 값이 조회됨
			--%>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>