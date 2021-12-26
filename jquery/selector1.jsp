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
			<h1 id="page-title">jQuery 선택자</h1>
			<p>jQuery의 선택자 연습하기</p>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>기본 선택자</h3>
			<p>*, #id, .class, tag 등이 있다.</p>
		</div>
		<div class="col" id="box-filter">
			<h3>기본 필터 선택자</h3>
			<p>:first, :last, :even :odd 등이 있다.</p>
			<p>:first는 선택된 엘리먼트 중에서 첫번째 엘리먼트를 선택한다.</p>
			<p>:last는 선택된 엘리먼트 중에서 마지막번째 엘리먼트를 선택한다.</p>
			<p>:even는 선택된 엘리먼트 중에서 짝수번째 엘리먼트를 선택한다.</p>
			<p>:odd는 선택된 엘리먼트 중에서 홀수번째 엘리먼트를 선택한다.</p>
		</div>
		<div class="col" id="box-child">	
			<h3>자식, 자손, 형제 선택자</h3>
			<p>선택자 &gt; 선택자, 선택자 선택자, 선택자 ~ 선택자</p>
			<div>
				<h4>자식, 자손, 형제 엘리먼트</h4>
				<p>자식 엘리먼트는 DOM tree에서 바로 아래에 위치하고 있는 엘리먼트를 말한다.</p>
				<p>자손 엘리먼트는 DOM tree에서 아래에 위치하고 있는 엘리먼트를 말한다.</p>
				<p>형제 엘리먼트는 DOM tree에서 부모 엘리먼트가 서로 같은 엘리먼트를 말한다.</p>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col" id="box-filter-1">
			<h3>자식필터 선택자</h3>
			<p>:first-child, :last-child, nth-child(no) 등이 있다.</p>
			
			<h4>음료 메뉴</h4>
			<ul>
				<li>콜라</li>
				<li>사이다</li>
				<li>물</li>
			</ul>
			<h4>커피 메뉴</h4>
			<ul>
				<li>아메리카노</li>
				<li>카푸치노</li>
				<li>라떼</li>
			</ul>
			<h4>과일 메뉴</h4>
			<ul>
				<li>사과</li>
				<li>오렌지</li>
				<li>바나나</li>
			</ul>
		</div>
		<div class="col" id="box-filter-2">
			<h3>순서필터 선택자</h3>
			<p>:eq(n), :gt(n), :lt(n) 등이 있다.</p>
			<div id="box-content">
				<p>0번째 내용</p>
				<p>1번째 내용</p>
				<p>2번째 내용</p>
				<p>3번째 내용</p>
				<p>4번째 내용</p>
				<p>5번째 내용</p>
				<p>6번째 내용</p>
				<p>7번째 내용</p>			
			</div>
		</div>
		<div class="col" id="box-filter-3">
			<h3>기타필터 선택자</h3>
			<p>:has(선택자), :contains(텍스트), :not(선택자) 등이 있다.</p>
			<div>
				<p><span>100,000</span> 원</p>
				<p><span class="text-danger">280,000</span> 원</p>
				<p>무료배송</p>
				<p>할인 이벤트 진행 중</p>
				<p>무료당일배송</p>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	// 아이디 선택자.
	$("#page-title").css("color", "red");
	// 클래스 선택자
	$(".col").css('border', '1px solid black')
	// 태그 선택자
	$("h3").css('color', 'green')
	
	// 기본 필터 선택자
	$(".col:first").css("background-color", "yellow");
	$(".col:last").css("background-color", "lightgray");
	$("#box-filter p:even").css('color', 'red');	// 0번째, 2번째, 4번째 p 엘리먼트가 선택된다.
	
	// 자식, 자손, 형제 선택자.
	$("#box-child > p").css('color', 'red');
	$("#box-child  p").css('text-decoration', 'underline');
	$("#box-child h4 + p").css('background-color', 'yellow');	// h4엘리먼트 바로 다음에 위치하고 있는 p엘리먼트,
	$("#box-child h4 ~ p").css('border', '1px solid red');		// h4엘리먼트 다음에 위치하고 있는 모든 p엘리먼트들
	
	$("li:first").css("color", 'red');	// 콜라
	$("li:last").css("color", 'blue');	// 바나나
	// 자식필터 선택자.
	$("li:first-child").css('background-color', 'yellow')
	$("li:last-child").css('background-color', 'lightgray');
	$("li:nth-child(2)").css('background-color', 'lightgreen')
	
	// 순서 필터 선택자
	$('#box-content p:eq(0)').css('color', 'red');
	$('#box-content p:eq(1)').css('color', 'blue');
	$('#box-content p:eq(2)').css('color', 'green');
	$("#box-content p:gt(3)").css('border', '1px solid red');
	$("#box-content p:lt(3)").css('border', '1px solid blue');
	
	// 기타 필터 선택자
	$("#box-filter-3 p:has('span.text-danger')").css('border', '1px solid red')
	$("#box-filter-3 div p:not(':has(span)')").css('color', 'green')
	$("#box-filter-3 div p:contains('무료')").css('background-color', 'yellow')

</script>
</body>
</html>

























