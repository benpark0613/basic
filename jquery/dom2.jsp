<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<title></title>
</head>
<body>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1>data-xxx 속성값 읽기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div>
				구매금액: <span id="order-price" data-order-price="54000"><strong>54,000</strong> 원</span> 
				추가금액: <span id="add-price" data-add-price="3000"><strong>3,000</strong> 원</span> 
				총결제금액: <span id="total-price" data-total-price="57000"><strong>57,000</strong> 원</span>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div>
				구매금액: <span id="order-price-2" data-order-price="54000"><strong>54,000</strong> 원</span> 
				추가금액: <span id="add-price-2" data-add-price="3000"><strong>3,000</strong> 원</span> 
				총결제금액: <span id="total-price-2" data-total-price="57000"><strong>57,000</strong> 원</span>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	// <tag data-xxx="값"/>에서 값 읽어오기
	// var 값 = $(선택자).data('xxx');
	
	// .data() 메소드로 데이터 읽어오기
	// var 구매금액 = $("#order-price").data("order-price");
	// var 추가금액 = $("#add-price").data("add-price");
	// var 총결제금액 = $("#total-price").data("total-price");
	
	// .attr() 메소드로 데이터 읽어오기
	var 구매금액 = $("#order-price").attr("data-order-price");
	var 추가금액 = $("#add-price").attr("data-add-price");
	var 총결제금액 = $("#total-price").attr("data-total-price");
	
	console.log(구매금액, 추가금액, 총결제금액);
	
	// <tag data-xxx="값"/> 에서 값 변경하기
	// $(선택자).attr("data-xxx", 값)
	$("#order-price-2")						// span 엘리먼트를 포함하는 jQuery결과집합이 반환됨
		.attr("data-order-price", 30000)	// span 엘리먼트의 data-order-price="54000"을 data-order-price="30000"으로 변경, span 엘리먼트를 포함하는 jQuery결과집합이 반환됨
		.find("strong")						// span 엘리먼트의 자손 중에서 strong 엘리먼트를 검색해서 strong 엘리먼트를 포함하는 jQuery결과집합이 반환됨
		.text('30,000')						// strong 엘리먼트의 <strong>54,000</strong>을 <strong>30,000</strong>으로 변경, strong 엘리먼트를 포함하는 jQuery결과집합이 반환됨
		.addClass("text-danger");
		
	$("#add-price-2").attr('data-add-price', 1000)
		.find('strong').text('1,000');
	
	$("#total-price-2").attr("data-total-price", 31000)
		.find("strong").text('31,000');
</script>
</body>
</html>























