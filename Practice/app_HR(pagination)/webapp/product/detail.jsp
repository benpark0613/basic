<%@page import="java.util.Date"%>
<%@page import="com.sample.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세정보</title>
<style type="text/css">
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 10px;
	text-align: Left;
}
</style>
</head>
<body>
	<h1>상품 상세정보</h1>	
<%
	/*
		list.jsp에서는 detail.jsp를 요청할 때, 상세정보를 조회할 상품의 번호를전달한다.
		
		상품의 상세정보를 요청하는 URL은 항상 아래와 같은 모양이어야 한다.
		detail.jsp?no=상품번호
	*/
	int no = Integer.parseInt(request.getParameter("no"));
	System.out.println("조회할 상품번호: " + no);
	Product product = new Product(no, "갤럭시z 플립3", "삼성전자", 1500000, 1250000, 10, "판매중", new Date());
%>
	
	<table>
		<tbody>
			<tr>
				<th>상품번호</th>
				<td><%=product.getNo() %></td>
				<th>등록일자</th>
				<td><%=product.getCreatedDate() %>></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><%=product.getName() %></td>
				<th>제조회사</th>
				<td><%=product.getMaker() %></td>
			</tr>
			<tr>
				<th>재고현황</th>
				<td><%=product.getStock() %></td>
				<th>판매상태</th>
				<td><%=product.getOnSale() %></td>
			</tr>
		</tbody>
	</table>
</body>
</html>