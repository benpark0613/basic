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
			<h1>폼 선택자</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<form class="border p-3 bg-light" method="post" action="register.jsp">
				<div class="mb-3">
					<label class="form-label" for="user-name">이름</label>
					<input type="text" class="form-control" name="username" id="user-name">
				</div>
				<div class="mb-3">
					<label class="form-label" for="user-email">이메일</label>
					<input type="email" class="form-control" name="email" id="user-email">
				</div>
				<div class="mb-3">
					<label class="form-label" for="user-password">비밀번호</label>
					<input type="password" class="form-control" name="password" id="user-password">
				</div>
				<div class="mb-3">
					<label class="form-label" for="user-career">경력사항</label>
					<select class="form-select" name="career" id="user-career">
						<option value=""> 경력사항을 선택하세요</option>
						<option value="0"> 신입</option>
						<option value="1"> 1년 이상</option>
						<option value="3" selected> 3년 이상</option>
						<option value="5"> 5년 이상</option>
						<option value="7"> 7년 이상</option>
						<option value="10"> 10년 이상</option>
					</select>
				</div>
				<div class="mb-3">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="jobType" id="job-type-1" value="정규" checked/>
						<label class="form-check-label" for="job-type-1"> 정규직</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="jobType" id="job-type-2" value="비정규"/>
						<label class="form-check-label" for="job-type-2"> 비정규직</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="jobType" id="job-type-3" value="인턴"/>
						<label class="form-check-label" for="job-type-3"> 인턴</label>
					</div>
				</div>
				<div class="mb-3">
					<label class="form-label">보유 기술</label>
					<div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="skill" id="skill-1" value="java" checked/>
							<label class="form-check-label" for="skill-1"> java</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="skill" id="skill-2" value="c" checked/>
							<label class="form-check-label" for="skill-2"> c</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="skill" id="skill-3" value="python" />
							<label class="form-check-label" for="skill-3"> python</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="skill" id="skill-4" value="javascript" />
							<label class="form-check-label" for="skill-4"> javascript</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="skill" id="skill-5" value="sql" checked/>
							<label class="form-check-label" for="skill-5"> sql</label>
						</div>
					</div>
				</div>
				<div class="mb-3">
					<label class="form-label" for="career-file">경력증명서</label>
					<input type="file" class="form-control" name="file" id="career-file" />
					<div class="form-text">경력증명서는 압축파일로 만들어서 업로드해 주시기 바랍니다.</div>
				</div>
				<div class="mb-3">
					<label class="form-label" for="user-prifile">자기 소개</label>
					<textarea rows="5" class="form-control" name="profile" id="user-profile"></textarea>	
				</div>
				<div class="mb-3 text-end">
					<button class="btn btn-primary btn-lg">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	// 폼 입력요소를 선택해서 입력값, 선택된 값, 체크된 값 조회하기
	
	// 입력필드(텍스트필드, 비밀번호필드, 날짜필드, 숫자필드, 첨부파일필드, 히든필드)에 입력된 값 조회하기
	// var 입력값 = $(선택자).val()
	// 입력필드(텍스트필드, 비밀번호필드, 날짜필드, 숫자필드, 첨부파일필드, 히든필드)에 값 입력하기
	// $(선택자).val('값')
	var username = $("input[name=username]").val();		// <input type="text" name="username" id="user-name">
	var email = $("input[name=email]").val();			// <input type="email" name="email" id="user-email>
	var password = $("#user-password").val();			// <input type="password" name="password" id="user-password>
	
	// textarea에 입력된 값 조회하기
	// var 입력값 = $(선택자).val()
	// textarea에 값 입력하기
	// $(선택자).val('값')
	var profile = $("#user-profile").val();				// <textarea name="profile" id="user-profile"></textarea>
	
	// select박스에서 선택된 항목의 값 조회하기
	// var 입력값 = $(입력필드선택자).val()
	// select박스에 특정 항목 선택하기
	// $(선택자).val('값')
	var career = $('[name=career]').val();				// <select name="career" id="user-career">
	
	// 체크박스, 라디오버튼의 값 조회하기
	// 라디오 버튼의 값 조회하기
	// var 입력값 = $(선택자:checked).val()
	
	// 체크박스, 라디오버튼 체크하기
	// $(선택자).prop('checked', true);
	// 체크박스, 라디오버튼 체크해제하기
	// $(선택자).prop('checked', false);
	var jobType = $(":radio[name='jobType']:checked").val();
	
</script>
</body>
</html>






















