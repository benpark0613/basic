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
			<h1>현재 존재하지 않는 엘리먼트에 이벤트핸들러 등록하기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="card">
				<div class="card-header">
					<h4>입력폼 <button class="btn btn-outline-primary btn-sm float-end" id="btn-add-field">추가</button></h4>
				</div>
				<div class="card-body">
					<div class="mb-3">
						<label class="form-label">이름</label>
						<input type="text" class="form-control" />
					</div>
					<div class="mb-3">
						<label class="form-label">경력사항</label>
						<input type="text" class="form-control w-75" />
					</div>
					<div class="mb-3">
						<div class="d-flex justify-content-between">
							<input type="text" class="form-control w-75" />
							<button class="btn btn-outline-danger btn-sm">삭제</button>
						</div>
					</div>
					<!-- 새 경력사항이 추가될 곳 -->
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	// id가 btn-add-field 엘리먼트를 클릭했을 실행되는 이벤트 핸들러함수 등록하기
	$("#btn-add-field").click(function() {
		var template = `
			<div class="mb-3 d-flex justify-content-between">
				<input type="text" class="form-control w-75" />
				<button class="btn btn-outline-danger btn-sm">삭제</button>
			</div>`;
			
		// class가 card-body인 엘리먼트안에 있는 클래스가 .mb-3인 엘리먼트중에서 맨 마지막번째 엘리먼트를 선택하기
		$('.card-body .mb-3:last').after(template);
	});
	
	// 현재 존재하지 않는 엘리먼트에 이벤트핸들러함수를 추가하기
	/*
		$('컨테이너엘리먼트를 선택하는 선택자').on('이벤트명', '이벤트를 발생시키는 엘리먼트를 선택하는 선택자', 이벤트핸들러함수)
			+ 컨테이너엘리먼트를 선택하는 선택자
				- 새로 엘리먼트가 추가되는 부모 엘리먼트를 선택하는 선택자를 정의한다.
				- '.card-body'는 경력사항입력필드와 삭제버튼이 추가되는 곳이다.
			+ 처리대상 이벤트명
				- 이벤트명을 지정한다.
			+ 이벤트를 발생시키는 엘리먼트를 선택하는 선택자
				- 이벤트를 발생시키는 엘리먼트를 선택하는 선택자를 정의한다.
				- '.btn-outline-danger'버튼을 클릭했을 때 이벤트핸들러 함수가 실행된다.
			+ 이벤트핸들러함수
				- '.btn-outline-danger'버튼을 클릭했을 때 실행되는 이벤트핸들러 함수다.
	*/
	$('.card-body').on('click', '.btn-outline-danger', function() {
		$(this).closest('.mb-3').remove();
	})
</script>
</body>
</html>