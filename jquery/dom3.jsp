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
			<h1>엘리먼트 추가하기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="mb-3">
				<button class="btn btn-outline-dark btn-sm" id="btn-append">append</button>
				<button class="btn btn-outline-dark btn-sm" id="btn-prepend">prepend</button>
				<button class="btn btn-outline-dark btn-sm" id="btn-before">before</button>
				<button class="btn btn-outline-dark btn-sm" id="btn-after">after</button>
			</div>
			<div class="p-3 border">
				<div class="p-3 border" id="box">
					<p>내용입니다.</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col">
			<label>월</label> 
			<select id="select-months"></select>
			
			<label>일</label> 
			<select id="select-dates">
				<option value="" selected disabled> 월을 먼저 선택하세요</option>
			</select>
		</div>
	</div>
	
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
	// 월을 선택하면 자동으로 해당 월에 맞는 날짜들이 추가되게 하기
	// 월별 마지막날을 나타내는 배열이다.
	var dates = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	// 월과 날을 표시하는 select 엘리먼트를 미리 검색해둔다.
	var $months = $("#select-months");
	var $dates = $("#select-dates");
	
	// 월을 표시하는 select 엘리먼트에 옵션을 추가한다.
	$months.append('<option value="" selected disabled> 선택하세요</option>');
	for (var i=1; i<=12; i++) {
		var option = '<option value="'+i+'"> '+i+'월</option>';
		$months.append(option);
	}
	
	// 월에서 선택된 항목이 변경될 때마다 실행되는 이벤트핸들러 함수를 등록한다.
	$months.change(function() {
		// 날을 표시하는 select 엘리먼트 내의 모든 option 엘리먼트를 삭제한다.
		$dates.empty();
		// 월을 표시하는 select 엘리먼트에서 현재 선택된 값을 조회한다.
		var month = $(this).val();
		// 현재 선택된 월에 맞는 날짜가 포함된 옵션을 배열의 값을 참고해서 추가한다.
		for (var i=1; i<=dates[month-1]; i++) {
			var option = '<option value="'+i+'"> '+i+'일</option>';
			$dates.append(option);
		}		
	});




	$("#btn-append").click(function() {
		$("#box").append("<p>append로 추가된 내용입니다.</p>")
	})
	$("#btn-prepend").click(function() {
		$("#box").prepend("<p>prepend로 추가된 내용입니다.</p>")
	})
	$("#btn-before").click(function() {
		$("#box").before("<p>before로 추가된 내용입니다.</p>")
	})
	$("#btn-after").click(function() {
		$("#box").after("<p>after로 추가된 내용입니다.</p>")
	})
	
	
	
</script>
</body>
</html>