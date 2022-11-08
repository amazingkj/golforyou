<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/class_pay_ok.css" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" />
</head>
<body>
	<div id="wrap">
		<div id="pay_ok_wrap">
			<div id="pay_ok">결제완료</div>
			<div id="pay_ok_process">
				결제하기&emsp;>&emsp;<strong>결제완료</strong>
			</div>
		</div>
		<div id="wrapper02">
			<div class="wrapper02-01">고객님의 결제가 정상적으로 완료되었습니다.</div>
			<div class="wrapper02-02">
				<div class="order-number">주문번호</div>
				<div class="order-number2">20220001</div>
			</div>
			<div class="wrapper02-03">
				<div class="mypagebtnwrap">
				<button class="payokmypage" onclick="location.href='mypage'">마이페이지로</button>
				</div>
			</div>
			<div class="wrapper02-04">
				<div class="qna01">주문 관련 문의 사항은</div>
				<div class="qna02">고객 센터 1:1 문의를 이용해 주시기 바랍니다.</div>
			</div>
		</div>
		<div id="wrapper03">
			<div class="wrapper03-01">
				<div class="payinfotitle">결제정보</div>
				<div class="payinfobox01">
					<div class="totalPrice">총 상품금액</div>
					<div class="totalPrice02">
						<div class="totalPrice02-01">상품합계</div>
						<div class="totalPrice02-02">${item.oprice} 원</div>
					</div>
				</div>
				<div class="payinfobox02">
					<div class="discountInfo">할인내역</div>
					<div class="discountInfo02">
						<div class="discountInfo02-01">쿠폰</div>
						<div class="discountInfo02-02">0원</div>
					</div>
				</div>
				<div class="payinfobox03">
					<div class="paymentmethod">결제수단</div>
					<div class="paymentmethod02">
						<div class="paymentmethod02-01">신용카드</div>
						<div class="paymentmethod02-02">
							<div class="paymentPrice">${item.oprice} 원</div>
							<div class="cardbrand">신한카드</div>
						</div>
					</div>
				</div>
			</div>
			<div class="wrapper03-02">
				<div class="wrapper03-02-01">
					<div class="wrapper03-02-01-01">${item.oprice} 원</div>
					<div class="wrapper03-02-01-02">총 결제금액</div>
				</div>

			</div>
			<div class="wrapper03-03">
				<div class="gotomainpage">
					<button class="mainpagebtn" onclick="location.href='index'">메인페이지로</button>
				</div>
			</div>
		</div>
	</div>
</body>
<div style="margin: 13% 0% 0% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>

