<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <title>부트스트랩</title>
</head>
<body>
<div class="container">    
	<div class="row mb-3">
		<div class="col">
			<div class="d-flex justify-content-between p-2 border-bottom">
				<div>
					<a href="">고객센터</a>
					<a href="">빠른메뉴</a>
				</div>
				<div>
					<a href="">마이샵</a>
					<a href="">로그인</a>
					<a href="">회원가입</a>
					<a href="">주문조회</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="d-flex justify-content-between">
				<nav aria-label="breadcrumb">
				  <ol class="breadcrumb">
				    <li class="breadcrumb-item"><a href="#">홈</a></li>
				    <li class="breadcrumb-item active" aria-current="page">드레스</li>
				  </ol>
				</nav>
				<div>
					<a href="">MY</a> | <a href="">HELP</a> | <a href="">QUICK</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col text-center">
			<div>
				<strong class="display-5">Dress</strong> 
				<small><i class="bi bi-hand-thumbs-up"></i></small>
				<small><span class="badge rounded-pill bg-success">0</span></small>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<!-- 
			xs < 576px		sm ≥ 576px		md ≥ 768px		lg ≥ 992px		xl ≥ 1200px		xxl ≥ 1400px
			
			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			col-lg-3 : 뷰포트의 너비가 992px 이상일 때는 한 행에 4개씩 배치되게 한다.
			col-md-4 : 뷰포트의 너비가 768px 이상일 때는 한 행에 3개씩 배치되게 한다.
			col-sm-6 : 뷰포트의 너비가 576px 이상일 때는 한 행에 2개씩 배치되게 한다.
			col-xs-12: 뷰포트의 너비가 576px 미만일 때는 한 행에 1개씩 배치되게 한다.
		-->
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="card mb-3">
				<img class="card-img-top" src="resources/images/1.jpg">
				<div class="card-body">
					<h5 class="card-title border-bottom"><small>[프리미엄]롤렌 실키 롱 원피스</small></h5>
					<div class="mb-2">
						<button class="btn btn-outline-dark btn-sm">Q &amp; A</button>
						<button class="btn btn-outline-dark btn-sm">REVIEW</button>
					</div>
					<p class="card-text-muted mb-2">부드러움과 촉촉함, 고급스러움을 모두 갖춘 드레스</p>
					<p class="card-text mb-2"><strong>157,000 원</strong></p>
					<div>
						<span class="border p-1 bg-success text-white">당일배송</span>
						<span class="border p-1 text-danger">new</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="card mb-3">
				<img class="card-img-top" src="resources/images/1.jpg">
				<div class="card-body">
					<h5 class="card-title border-bottom"><small>[프리미엄]롤렌 실키 롱 원피스</small></h5>
					<div class="mb-2">
						<button class="btn btn-outline-dark btn-sm">Q &amp; A</button>
						<button class="btn btn-outline-dark btn-sm">REVIEW</button>
					</div>
					<p class="card-text-muted mb-2">부드러움과 촉촉함, 고급스러움을 모두 갖춘 드레스</p>
					<p class="card-text mb-2"><strong>157,000 원</strong></p>
					<div>
						<span class="border p-1 bg-success text-white">당일배송</span>
						<span class="border p-1 text-danger">new</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="card mb-3">
				<img class="card-img-top" src="resources/images/1.jpg">
				<div class="card-body">
					<h5 class="card-title border-bottom"><small>[프리미엄]롤렌 실키 롱 원피스</small></h5>
					<div class="mb-2">
						<button class="btn btn-outline-dark btn-sm">Q &amp; A</button>
						<button class="btn btn-outline-dark btn-sm">REVIEW</button>
					</div>
					<p class="card-text-muted mb-2">부드러움과 촉촉함, 고급스러움을 모두 갖춘 드레스</p>
					<p class="card-text mb-2"><strong>157,000 원</strong></p>
					<div>
						<span class="border p-1 bg-success text-white">당일배송</span>
						<span class="border p-1 text-danger">new</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<div class="card mb-3">
				<img class="card-img-top" src="resources/images/1.jpg">
				<div class="card-body">
					<h5 class="card-title border-bottom"><small>[프리미엄]롤렌 실키 롱 원피스</small></h5>
					<div class="mb-2">
						<button class="btn btn-outline-dark btn-sm">Q &amp; A</button>
						<button class="btn btn-outline-dark btn-sm">REVIEW</button>
					</div>
					<p class="card-text-muted mb-2">부드러움과 촉촉함, 고급스러움을 모두 갖춘 드레스</p>
					<p class="card-text mb-2"><strong>157,000 원</strong></p>
					<div>
						<span class="border p-1 bg-success text-white">당일배송</span>
						<span class="border p-1 text-danger">new</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


















