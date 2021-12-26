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
			<h1>박스오피스 조회하기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="mb-3 d-flex justify-content-end">
				<form class="row row-cols-lg-auto g-3 align-items-center">
  					<div class="col-12">
    					<label class="form-label">조회날짜</label>
  					</div>
  					<div class="col-12">
    					<input type="date" name="date" class="form-control"/>
  					</div>
  					<div class="col-12">
    					<button type="button" class="btn btn-outline-dark" id="btn-get-boxoffice">조회</button>
  					</div>
				</form>
			</div>
			<table class="table" id="table-boxoffice">
				<thead>
					<tr>
						<th style="width: 8%;" class="text-center">순위</th>
						<th style="width: 32%;">제목</th>
						<th style="width: 10%;">개봉일</th>
						<th style="width: 10%;" class="text-end pe-3">관객수</th>
						<th style="width: 15%;" class="text-end pe-3">누적관객수</th>
						<th style="width: 10%;" class="text-end pe-3">점유율</th>
						<th style="width: 10%;" class="text-end pe-3"></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<!-- 영화상세정보를 표현하는 모달 -->
	<div class="modal" tabindex="-1" id="modal-boxoffice">
  		<div class="modal-dialog modal-xl">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title">영화 상세정보</h5>
        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<div class="modal-body">
        			<div class="card">
        				<div class="card-header"><strong id="movie-title"></strong></div>
        				<table class="table">
        					<tr>
        						<th style="width: 10%;">개봉일자</th>
        						<td style="width: 35%;"><span id="movie-open-data"></span></td>
        						<th style="width: 10%;">상영시간</th>
        						<td style="width: 55%;"><span id="movie-show-time"></span> 분</td>
        					</tr>
        					<tr>
        						<th>영화명(영문)</th>
        						<td colspan="3"><span id="movie-name-en"></span></td>
        					</tr>
        					<tr>
        						<th>쟝르</th>
        						<td><span id="movie-genre"></span></td>
        						<th>관람등급</th>
        						<td><span id="movie-watch-grade"></span></td>
        					</tr>
        					<tr>
        						<th>감독</th>
        						<td><span id="movie-directors"></span></td>
        						<th>배우</th>
        						<td><span id="movie-actors"></span></td>
        					</tr>
        					<tr>
        						<th><span>제작/배급사</span></th>
        						<td colspan="3"><span id="movie-companys"></span></td>
        					</tr>
        				</table>
        			</div>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      			</div>
    		</div>
  		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	// 조회버튼 클릭할 때 실행되는 이벤트핸들러 메소드 등록
	$("#btn-get-boxoffice").click(function() {
		// 테이블의 tbody를 선택하고, tbody안을 비우고, 반환되는 jQuery집합객체를 $tbody에 저장한다.
		var $tbody = $('#table-boxoffice tbody').empty();
		// 입력필드에서 조회날짜를 조회한다. 조회날짜에 포함된 -를 없앤다.
		var date = $(":input[name=date]").val().replace(/-/g, '');
		if (date == '') {
			alert("조회날짜를 입력하세요");
			return;
		}
		
		$.ajax({
			type: 'get',
			url: 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
			data: {key: "f5eef3421c602c6cb7ea224104795888", targetDt: date},
			dataType: 'json',
			success: function(result) {
				var boxOfficeList = result.boxOfficeResult.dailyBoxOfficeList;
				$.each(boxOfficeList, function(index, boxOffice) {
					var row = "<tr>";
					row += '<td class="text-center">'+boxOffice.rank+'</td>';
					row += '<td>'+boxOffice.movieNm+'</td>';
					row += '<td>'+boxOffice.openDt+'</td>';
					row += '<td class="text-end pe-3">'+parseInt(boxOffice.audiCnt).toLocaleString()+' 명</td>';
					row += '<td class="text-end pe-3">'+parseInt(boxOffice.audiAcc).toLocaleString()+' 명</td>';
					row += '<td class="text-end pe-3">'+boxOffice.salesShare+'%</td>';
					row += '<td class="text-end pe-3"><button class="btn btn-outline-primary btn-sm" data-movie-code="'+boxOffice.movieCd+'">상세정보</button></td>';
					row += '</tr>';
					
					$tbody.append(row);
				})
			},
			error: function() {
				alert("오류가 발생하였습니다.");
			}
		});
	});
	
	// 모달객체 생성
	var boxOfficeModal = new bootstrap.Modal(document.getElementById('modal-boxoffice'), {
		keyboard: false
	});

	// 상세정보 버튼을 클릭했을 때 실행될 이벤트 핸들러 함수를 등록한다.
	$("#table-boxoffice tbody").on('click', '.btn', function() {
		var movieCode = $(this).attr("data-movie-code");
		
		$.getJSON("https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json", 
			{key: "f5eef3421c602c6cb7ea224104795888", movieCd: movieCode}, 
			function(result) {
				var movie = result.movieInfoResult.movieInfo;
				$("#movie-title").text(movie.movieNm);
				$("#movie-name-en").text(movie.movieNmEn);
				$("#movie-open-data").text(movie.openDt);
				$("#movie-show-time").text(movie.showTm);
				$("#movie-genre").text(movie.genres.map(item => item.genreNm).join(', '));
				$("#movie-watch-grade").text(movie.audits.map(item => item.watchGradeNm).join(', '));
				$("#movie-directors").text(movie.directors.map(item => item.peopleNm).join(', '));
				$("#movie-actors").text(movie.actors.map(item => item.peopleNm).filter((item, index) => index < 5).join(', '));
				$("#movie-companys").text(movie.companys.map(item => item.companyNm + "("+item.companyPartNm+")").join(', '))
				
				// 모달창을 표시한다.
				boxOfficeModal.show();		
		});
		
	})
</script>
</body>
</html>