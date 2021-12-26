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
			<h1>HTML DOM 조작하기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<p id="text-content">텍스트컨텐츠 입니다.</p>
			<button class="btn btn-outline-primary btn-sm" id="btn-read-text">.text()</button>
			<button class="btn btn-outline-primary btn-sm" id="btn-change-text">.text(텍스트)</button>
		</div>
		<div class="col-3">
			<div id="html-content" class="alert alert-danger">
				<strong>로그인 오류</strong> 존재하지 않는 회원입니다..
			</div>
			<button class="btn btn-outline-primary btn-sm" id="btn-read-html">.html()</button>
			<button class="btn btn-outline-primary btn-sm" id="btn-change-html">.html(html텍스트)</button>
		</div>
		<div class="col-3">
			<h3>회원목록 <button class="btn btn-primary btn-sm" id="btn-change-userlist">회원목록 조회</button></h3>
			<ul class="list-group" id="list-group-users">
				<li class="list-group-item">정보가 없습니다.</li>
			</ul>
		</div>
		<div class="col-3">
			<input type="text" class="form-control" name="amount" value="1">
			<div class="mt-3">
				<button class="btn btn-outline-dark btn-sm" id="btn-plus-amount">증가</button>
				<button class="btn btn-outline-dark btn-sm" id="btn-minus-amount">감소</button>
			</div>
		</div>
		<div class="col-6">
			<table class="table" id="table-users">
				<thead>
					<tr>
						<th><input type="checkbox" id="checkbox-toggle-checked"/></th>
						<th>이름</th>
						<th>연락처</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="userNo" value="10"/></td>
						<td>이순신</td>
						<td>010-1111-1111</td>
						<td><button class="btn btn-danger btn-sm">삭제</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="userNo" value="10"/></td>
						<td>김유신</td>
						<td>010-1111-1111</td>
						<td><button class="btn btn-danger btn-sm">삭제</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="userNo" value="10"/></td>
						<td>이성계</td>
						<td>010-1111-1111</td>
						<td><button class="btn btn-danger btn-sm">삭제</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="userNo" value="10"/></td>
						<td>이하응</td>
						<td>010-1111-1111</td>
						<td><button class="btn btn-danger btn-sm">삭제</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="userNo" value="10"/></td>
						<td>강감찬</td>
						<td>010-1111-1111</td>
						<td><button class="btn btn-danger btn-sm">삭제</button></td>
					</tr>
				</tbody>
			</table>
			<div class="mt-3">
				<button class="btn btn-outline-secondary btn-sm" id="btn-delete-all-rows">전체 삭제</button>
				<button class="btn btn-outline-secondary btn-sm" id="btn-delete-selected-rows">선택 삭제</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	// 엘리먼트의 텍스트 컨텐츠를 조회/변경하기, .text(), .text(텍스트컨텐츠)
	$("#btn-read-text").click(function() {
		var textContent = $("#text-content").text();
		alert(textContent);
	});
	$("#btn-change-text").click(function() {
		$("#text-content").text("텍스트컨텐츠가 변경되었습니다.");
	})
	
	// 엘리먼트의 html 컨텐츠를 조회/변경하기, .html(), .html(html컨텐츠)
	$('#btn-read-html').click(function() {
		var htmlContent = $("#html-content").html();
		alert(htmlContent);
	})
	$('#btn-change-html').click(function() {
		var htmlContent = '<strong>로그인 오류</strong> 비밀번호가 일치하지 않습니다.';
		$("#html-content").html(htmlContent);
	})
	
	// 회원목록을 조회해서 리스트에 반영하기
	$("#btn-change-userlist").click(function() {
		// 서버와 ajax통신해서 데이터를 조회함.
		var users = [{name:'김유신', email:'kim@gmail.com'}, {name:'강감찬', email:'kang@naver.com'}, {name:'이순신', email:'lee@daum.net'}];
		
		var htmlContent = '';
		users.forEach(function(user, index) {
			htmlContent += '<li class="list-group-item">'+user.name+'<span class="text-muted float-end">'+user.email+'</span></li>'
		});
		
		$("#list-group-users").html(htmlContent);
	});
	
	// 폼 입력필드의 값 조회 및 변경하기
	$("#btn-plus-amount").click(function() {
		var textContent = $("input[name=amount]").val();	// 값 조회
		var amount = parseInt(textContent) + 1;
		 $("input[name=amount]").val(amount);				// 값 변경
	})
	$("#btn-minus-amount").click(function() {
		var amount = parseInt($("input[name=amount]").val()) - 1;
		$("input[name=amount]").val(amount);
	})

	// 폼 입력요소 중 체크박스의 체크여부 조회/변경하기
	// 전체 선택/해제 체크박스의 체크여부에 따라서 테이블의 체크박스 선택/해제 시키기
	$("#checkbox-toggle-checked").change(function() {
		// 전체 선택/해제버튼의 체크여부를 조회한다. .prop("checked")로 조회하면 true/false값이 반환됨
		var checked = $(this).prop("checked")
		// 테이블의 tbody에 포함됨 모든 체크박스를 조회하고, .prop("checked", 체크여부)로 체크상태를 변경한다.
		$("#table-users :checkbox[name=userNo]").prop("checked", checked);
	})
	
	// 테이블의 체크박스 중 하나를 선택/해제하면 전체 선택/해제 체크박스의 상태를 변경하기
	$("#table-users :checkbox[name=userNo]").change(function() {
		var totalLen = $("#table-users :checkbox[name=userNo]").length;
		var len = $("#table-users :checkbox[name=userNo]:checked").length;
		
		if (totalLen == len) {
			$("#checkbox-toggle-checked").prop("checked", true);
		} else {
			$("#checkbox-toggle-checked").prop("checked", false);
		}
	})
	
	$("#btn-delete-all-rows").click(function() {
		// $("#table-users tbody tr").remove();
		
		/*
		var elements = document.querySelectorAll("#table-users tbody tr");
		elements.forEach(function(tr, index) {
			tr.remove();
		});
		*/
		
		$("#table-users tbody").empty();
	});
	$("#btn-delete-selected-rows").click(function() {
		/* 
		$("#table-users [name=userNo]:checked").each(function() {
			$(this).closest("tr").remove();
		}); 
		*/
		
		$("#table-users [name=userNo]:checked").closest("tr").remove();
		
		/*
		var elements = document.querySelectorAll("#table-users [name=userNo]");
		elements.forEach(function(checkbox, index) {
			if (checkbox.checked) {
				var tr = checkbox.parentElement.parentElement;
				tr.remove();
			}
		});
		*/
	})
	
</script>
</body>
</html>





