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
			<h1>장바구니</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<table class="table" id="table-cart-items">
				<thead>
					<tr>
						<th style="width: 5%;"><input type="checkbox" id="checkbox-toggle-checked" checked/></th>
						<th style="width: 40%;">상품명</th>
						<th style="width: 15%;" class="text-end pe-5">가격</th>
						<th style="width: 15%;">수량</th>
						<th style="width: 15%;" class="text-end pe-5">구매가격</th>
						<th style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="itemNo" value="10" checked/></td>
						<td>iphone 13 pro max</td>
						<td class="text-end pe-5"><strong id="price-10">1,500,000</strong> 원</td>
						<td><input type="number" name="amount" id="amount-10" value="1" min="1" style="width: 50px;"/> <button data-item-no="10" data-btn="update">변경</button></td>
						<td class="text-end pe-5"><strong class="text-danger" id="order-price-10" data-order-price="1500000">1,500,000</strong> 원</td>
						<td><button data-item-no="10" data-btn="delete">삭제</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="itemNo" value="20" checked/></td>
						<td>갤럭시z 플립 3</td>
						<td class="text-end pe-5"><strong id="price-20">1,700,000</strong> 원</td>
						<td><input type="number" name="amount" id="amount-20" value="1" min="1" style="width: 50px;"/> <button data-item-no="20" data-btn="update">변경</button></td>
						<td class="text-end pe-5"><strong class="text-danger" id="order-price-20" data-order-price="1700000">1,700,000</strong> 원</td>
						<td><button data-btn="delete">삭제</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name="itemNo" value="30" checked/></td>
						<td>apple watch 7</td>
						<td class="text-end pe-5"><strong id="price-30">600,000</strong> 원</td>
						<td><input type="number" name="amount" id="amount-30" value="1" min="1" style="width: 50px;"/> <button data-item-no="30" data-btn="update">변경</button></td>
						<td class="text-end pe-5"><strong class="text-danger" id="order-price-30" data-order-price="600000">600,000</strong> 원</td>
						<td><button data-item-no="30" data-btn="delete">삭제</button></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" class="text-end">총구매가격</td>
						<td><strong id="total-order-price"></strong> 원</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	// 총구매가격 계산해서 반영하기
	var totalOrderPrice = 0;
	$("strong[data-order-price]").each(function() {
		var orderPrice = parseInt($(this).data('order-price'));
		totalOrderPrice += orderPrice;
	});
	$("#total-order-price").text(totalOrderPrice.toLocaleString());
	
	// 구매수량을 변경하고 변경버튼을 클릭하면 구매가격을 계산해서 반영하기
	$("button[data-btn='update']").click(function() {
		// 아이템 번호 조회, <button data-item-no="숫자" data-btn="update">
		var itemNo = $(this).data("item-no");						   		
		// 가격조회, <strong id="price-10">1,500,000</strong>
		var price = parseInt($("#price-"+itemNo).text().replace(/,/g, ''));	 
		// 구매수량 조회, <input type="text" id="amount-20" value="1"/>
		var amount = parseInt($("#amount-"+itemNo).val());					 
		// 구매가격 계산
		var orderPrice = price*amount;
		// 구매가격 표시하기, <strong class="text-danger" id="order-price-10" data-order-price="1500000">1,500,000</strong>
		$("#order-price-"+itemNo).attr("data-order-price", orderPrice).text(orderPrice.toLocaleString());
		
		updateTotalOrderPrice();
	});
	
	// 삭제버튼을 클릭하면 해당 아이템을 삭제하기
	$("button[data-btn='delete']").click(function() {
		$(this).closest("tr").remove();
		
		updateTotalOrderPrice();
	});
	
	// 전체 선택/해제 체크박스를 변경하면 장바구니 아이템의 체크박스가 선택/해제되게 하기
	$("#checkbox-toggle-checked").change(function() {
		$(":checkbox[name=itemNo]").prop("checked", $(this).prop("checked"));
		
		updateTotalOrderPrice();
	})
	
	// 장바구니 아이템의 체크박스를 변경하면 전체 선택/해제 체크박스가 선택/해제되게 하기
	$(":checkbox[name='itemNo']").change(function() {
		// 장바구니 아이템 체크박스의 전체 개수를 조회한다.
		var length = $(":checkbox[name='itemNo']").length;
		// 장바구니 아이템 체크박스 중에서 체크된 개수를 조회한다.
		var checkedLength = $(":checkbox[name='itemNo']:checked").length;
		// 장바구니 아이템 체크박스의 전체 개수와 체크된 개수가 일치하면 전체 선택/해제 체크박스의 체크여부를 true로 그외는 false로 설정한다.
		$("#checkbox-toggle-checked").prop('checked', length == checkedLength);
		
		updateTotalOrderPrice();
	})
	
	// 총구매가격을 갱신한다.
	function updateTotalOrderPrice() {
		// 총구매가격을 저장하는 변수
		var totalOrderPrice = 0;
		// 아이템 체크박스 중에서 체크된 체크박스만 선택한다.
		// 선택된 체크박스의 개수만큼 each(함수)의 함수가 실행된다.
		// 함수내부에서 사용하는 this에는 선택된 체크박스들이 순서대로 전달된다.
		$(":checkbox[name=itemNo]:checked").each(function() {
			// this로 전달된 체크박스에서 아이템번호값을 조회한다.
			// this > <input type="checkbox" name="itemNo" value="10" checked/>
			var itemNo = $(this).val();
			// 아이템 번호에 해당하는 상품의 구매가격을 조회한다.
			// $("#order-price-" + 10) > <strong id="order-price-10" data-order-price="1500000">1,500,000</strong>
			var orderPrice = $("#order-price-" + itemNo).attr("data-order-price");
			// 조회된 구매가격을 totalOrderPrice에 누적시킨다.
			totalOrderPrice += parseInt(orderPrice);
		});
		// 계산된 총구매가격을 표시한다.
		$("#total-order-price").text(totalOrderPrice.toLocaleString());
	}
	
</script>
</body>
</html>



















