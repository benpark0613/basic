<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>부트스트랩</title>
</head>
<body>
<div class="container">    
	<h1>탭</h1>
	
	<!-- 탭의 내비게이션 링크 목록 -->
	<ul class="nav nav-tabs mb-3" role="tablist">
		<li class="nav-item"><a href="#hr-dept" class="nav-link active" data-bs-toggle="tab">부서</a></li>
		<li class="nav-item"><a href="#hr-job" class="nav-link" data-bs-toggle="tab">직종</a></li>
		<li class="nav-item"><a href="#hr-emp" class="nav-link" data-bs-toggle="tab">사원</a></li>
	</ul>
	<!-- 탭의 내비게이션과 연결된 컨텐츠 영역 -->
	<div class="tab-content">
		<div id="hr-dept" class="container tab-pane active">
			<div class="card">
				<div class="card-header">부서 리스트</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th>부서아이디</th>
								<th>부서명</th>
								<th>부서담당자</th>
								<th>부서소재지</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>100</td>
								<td>영업1팀</td>
								<td>홍길동</td>
								<td>서울 종로구</td>
							</tr>
							<tr>
								<td>100</td>
								<td>영업1팀</td>
								<td>홍길동</td>
								<td>서울 종로구</td>
							</tr>
							<tr>
								<td>100</td>
								<td>영업1팀</td>
								<td>홍길동</td>
								<td>서울 종로구</td>
							</tr>
							<tr>
								<td>100</td>
								<td>영업1팀</td>
								<td>홍길동</td>
								<td>서울 종로구</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="hr-job" class="container tab-pane fade">
			<h3>직종 리스트</h3>
		</div>
		<div id="hr-emp" class="container tab-pane fade">
			<h3>사원 리스트</h3>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>