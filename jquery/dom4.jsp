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
			<h1>클래스 조작하기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-6">
			<ul class="list-group" id="ul-dept-list">
				<li class="list-group-item">영업1팀</li>
				<li class="list-group-item">영업2팀</li>
				<li class="list-group-item">영업3팀</li>
				<li class="list-group-item">영업4팀</li>
			</ul>
		</div>
		<div class="col-6">
			<ul class="list-group" id="ul-dept-list-2">
				<li class="list-group-item">영업1팀</li>
				<li class="list-group-item">영업2팀</li>
				<li class="list-group-item">영업3팀</li>
				<li class="list-group-item">영업4팀</li>
			</ul>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col">
			<div class="card" id="card-user-list">
				<div class="card-header">컨퍼런스 참가자 현황</div>
				<div class="card-body">
					<h5 class="card-title">사원 리스트</h5>
					<ul class="list-group" id="ul-user-list-1">
						<li class="list-group-item">홍길동</li>
						<li class="list-group-item">김유신</li>
						<li class="list-group-item">강감찬</li>
						<li class="list-group-item">이순신</li>
						<li class="list-group-item">류관순</li>
						<li class="list-group-item">안중근</li>
					</ul>
				</div>
				<div class="card-body">
					<button class="btn btn-outline-dark" id="btn-down-emp">추가</button>
					<button class="btn btn-outline-dark" id="btn-up-emp">삭제</button>
				</div>
				<div class="card-body">
					<h5 class="card-title">참가 확정 사원리스트</h5>
					<ul class="list-group" id="ul-user-list-2"></ul>					
				</div>
				
			</div>
			<div class="my-3">
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	/*
		1. id="card-user-list"의 <li class="list-group-item"></li>들을 클릭하면 'list-group-item-secondary'를 토글시킨다.
		   + 클릭한 것 외에 다른 엘리먼트의 'list-group-item-secondary' 상태를 변경할 필요는 없다.
		   + 즉, 'list-group-item-secondary' 상태의 엘리먼트가 여러 개 있어도 된다.
		2. 추가버튼을 클릭하면 <ul class="list-group" id="ul-user-list-1">의 li 엘리먼트 중에서 'list-group-item-secondary' 상태인 것들만 선택한다.
		   + 선택된 엘리먼트들을 <ul class="list-group" id="ul-user-list-2">에 추가한다.
		   + <ul class="list-group" id="ul-user-list-2">에 추가된 li 엘리먼트들의 class에서 'list-group-item-secondary'클래스를 삭제한다.
	*/
	
	$("#card-user-list .list-group-item").click(function() {
		$(this).toggleClass('list-group-item-secondary');
	});
/*		   
	$('#btn-down-emp').click(function() {
		var $listGroupItems = $("#ul-user-list-1")		// id가 ul-user-list-1인 엘리먼트를 선택한다.
			.find(".list-group-item-secondary")			// 위에서 선택한 엘리먼트의 자손 중에서 클래스가 "list-group-item-secondary"를 선택한다.
			.removeClass("list-group-item-secondary");	// 위에서 선택한 엘리먼트의 class에서 "list-group-item-secondary"를 삭제한다.
		
		if ($listGroupItems.length == 0) {
			alert("선택된 사원이 없습니다.");
			return;
		}
		$("#ul-user-list-2").append($listGroupItems);
	});
	
	$("#btn-up-emp").click(function() {
		var $listGroupItems = $("#ul-user-list-2")		// id가 ul-user-list-2인 엘리먼트를 선택한다.
		.find(".list-group-item-secondary")				// 위에서 선택한 엘리먼트의 자손 중에서 클래스가 "list-group-item-secondary"를 선택한다.
		.removeClass("list-group-item-secondary");		// 위에서 선택한 엘리먼트의 class에서 "list-group-item-secondary"를 삭제한다.
	
		if ($listGroupItems.length == 0) {
			alert("선택된 사원이 없습니다.");
			return;
		}
		$("#ul-user-list-1").append($listGroupItems);
	});
*/
	
	
	
	
	
	
	
	
	// 선택된 엘리먼트에 클래스 추가/삭제하기
	$("#ul-dept-list li").click(function() {
		$(this).addClass('active').siblings().removeClass('active');
	});
	
	// 선택된 엘리먼트에 클래스 토글시키기
	$("#ul-dept-list-2 li").click(function() {
		$(this).toggleClass('active').siblings().removeClass('active');
	});
	
	
</script>
</body>
</html>