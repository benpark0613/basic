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
    
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    // 자바스크립트의 연산자.

    // 산술 연산자
    var x = 10;
    var y = 4;
    
    console.log("x + y", x + y);
    console.log("x - y", x - y);
    console.log("x*y", x*y);
    console.log("x/y", x/y);        // 정수/정수 연산결과 값이 실수가 될 수도 있다.
    console.log("x%y", x%y);

    // 비교 연산자
    var a = 5;
    var b = 5;
    var c = '5';
    var d = '8';

    /*
        ==  값만 비교           타입이 다르더라도 변환 후 값이 일치하면 true
        === 값과 타입 모두 비교  타입도 같고, 값도 같을 때만 ture (and)
        !=  값만 타입 모두 비교  타입도 다르고, 값도 다를 때만 true (and)
        !== 값과 타입 모두 비교  타입이 다르거나, 값이 다르면 true (or)
    */
    console.log("a == b", a == b);      // true, a와 b의 값이 같거나, 서로 다른 타입인 경우 타입변환 후 값이 같으면 true
    console.log("a === c", a === c);    // false, a와 c의 값도 같고, 타입도 같으면 true
    
    console.log("a != b", a != b);      // false, 5!=5      값도 같고, 타입도 같아서 서로 다르지 않다.
    console.log("a != c", a != c);      // false, 5!='5'    타입은 다르지만, 변환 후 값이 같다.
    console.log("a != d", a != d);      // true,  5!='8'    타입도 다르고, 변환 후 값도 다르다.

    console.log("a !== b", a !== b);    // false, 5!==5     다른게 하나도 없다.
    console.log("a !== c", a !== c);    // true,  5!=='5'   타입이 다르다.
    console.log("a !== d", a !== d);    // true,  5!=='8'   타입도 다르고, 값도 다르다.

    // 논리 연산자
    // && || !
    //
    //  자바스크립트에서 false로 여기는 값
    //      false, undefined, null, 0, '', NaN
    //  자바스크립트에서 true로 여기는 값
    //      위에서 정의한 6개의 값을 제외한 모든 값
    //
    // 자바의 경우 : 피연산자가 반드시 boolean 타입의 값이거나, 연산결과가 boolean 타입이어야 한다.
    //              논리연산의 연산결과는 항상 true, false 값 중의 하나다.
    //              distance > 30000 || year >= 3   연산결과 : true/false 중 하나
    // 자바스크립트의 경우 : 피연산자가 boolean 타입의 값일 필요는 없다.
    //                      논리연산의 연산결과가 boolean 타입이 아닐 수 있다.
    //                      distance > 30000 || year >= 3   연산결과 : true/false 중 하나
    // 자바스크립트 논리연산자의 특징을 활용한 수행문이 있다.
    /*
        function searchProductsByMinPrice(minPrice) {
            변수 = 매개변수 || 매개변수의 값이 null 이거나 undefined일 때 변수에 대입할 디폴트값
            var price = minPrice || 1000;
            // price변수의 값은 매개변수 minPrice값이 undefined일 때 1000이다.
            // price변수의 값은 매개변수 minPrice값이 undefined가 아닐 때 minPrice값이 된다.
            console.log(price);
        }

        searchProductsByMinPrice();         minPrice는 undefined    출력결과: 1000
        searchProductsByMinPrice(0);        minPrice는 0            출력결과: 1000
        searchProductsByMinPrice(5000);     minPrice는 5000         출력결과: 5000
        searchProductsByMinPrice(25000);    minPrice는 25000        출력결과: 25000
        searchProductsByMinPrice(50000);    minPrice는 50000        출력결과: 50000
    */
   
    // 논리연산자를 활용한 유상수리여부를 판단하는 코드, 논리연산자를 사용하는 가장 일반적인 예다.
   var distance = 3000, year = 1;
   var isPaymentRepair = distance >= 50000 || year >= 3;
   console.log("유상수리 여부", isPaymentRepair);

    // 자바스크립트의 논리연산자의 고유한 특징을 응용한 예
    // maxUploadFileSize값이 undefined일 때 size는 1024*1024*10다.
    // maxUploadFileSize값이 undefined가 아닐 때 size는 maxUploadFileSize의 값이다.
    var maxUploadFileSize;
    var size = maxUploadFileSize || 1024*1024*10;
    console.log(size);      // 출력결과 : 1024*1024*10

    maxUploadFileSize = 1024*1024*5;
    var size = maxUploadFileSize || 1024*1024*10;
    console.log(size);      // 출력결과 : 1024*1024*5
    
</script>
</body>
</html>