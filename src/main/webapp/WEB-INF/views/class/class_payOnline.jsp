<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프 클래스 결제하기</title>
<script src="/js/jquery.js"></script>
<script src="/js/class.js"></script>
<link rel="stylesheet" type="text/css" href="/css/class_cart.css" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" />

</head>
<body>
	<%--<div id="header_body" style="width: 100%;"></div> --%>

	<%-- header와 footer를 제외한 전체 --%>
	<div id="wrap">
		<form name="payonlineform" method="post" action="/insertClassPay_ok"
			enctype="multipart/form-data">
			<input type="hidden" name="ono" value="${item.ono}">
			<%-- 윗부분 --%>
			<div class="cart_wrap">
				<div class="cart">결제하기</div>
				<div class="cart_process">
					<strong>결제하기</strong>&emsp;>&emsp;결제완료
				</div>
			</div>

			<%-- 아래 왼쪽 주문 정보 박스 --%>
			<div id="order_wrap">
				<div class="orderwrap01">주문 상품</div>
				<div class="orderwrap02">
					<div class="orderwrap02-01">
						<div class="serviceInfo">상품 정보</div>
						<div class="serviceCharge">판매 금액</div>
						<div class="serviceTeacher">강사명</div>
						<div class="servicePeriod">수강 기간</div>
					</div>
					<div class="orderwrap02-02">
						<div class="serviceImage">
							<img src="/upload/class${item.oimage}" class="serviceImageValue" />
						</div>
						<div class="serviceDetail">
							<div class="serviceTitleValue">${item.otitle}</div>
							<div class="serviceDescValue">${item.odesc}</div>
							<div class="serviceLevelValue">추천 레벨 :
								${item.olevel}</div>
						</div>
						<div class="serviceChargeValue">
							<c:if test="${item.oprice != '0'}">
								<fmt:formatNumber value="${item.oprice}" pattern="#,###" />
							</c:if>
							원
						</div>
						<div class="serviceTeacherValue">${item.tname} 프로</div>
						<div class="servicePeriodValue">${item.otime}일</div>
					</div>
				</div>

				<div class="customerInfo">
					<div class="customerInfo01">주문 고객 아이디를 입력해주세요 :</div>
					<input name="username" id="username" class="customerInfo02" />
				</div>
				<div class="orderwrap03">
					<div class="orderwrap03-01">주문 상품 금액</div>
					<div class="orderwrap03-02">
						<c:if test="${item.oprice != '0'}">
							<fmt:formatNumber value="${item.oprice}" pattern="#,###" />
						</c:if>
						원
					</div>
					<div class="orderwrap03-03">-</div>
					<div class="orderwrap03-04">총 할인 금액</div>
					<div class="orderwrap03-05">0원</div>
					<div class="orderwrap03-06">=</div>
					<div class="orderwrap03-07">총 주문 금액</div>
					<div class="orderwrap03-08">
						<c:if test="${item.oprice != '0'}">
							<fmt:formatNumber value="${item.oprice}" pattern="#,###" />
						</c:if>
						원
					</div>
				</div>
			</div>

			<%-- 아래 오른쪽 bill 박스 --%>
			<div id="bill_wrap">
				<div id="bill_mini">
					<div class="order_info">결제정보</div>
					<div class="service_sum">
						<div class="service_hanguel">총 서비스 금액</div>
						<div class="service_money">
							<c:if test="${item.oprice != '0'}">
								<fmt:formatNumber value="${item.oprice}" pattern="#,###" />
							</c:if>
							원
						</div>
					</div>
					<div class="discount">
						<div class="discount_hanguel">－총 할인금액</div>
						<div class="discount_money">0원</div>
					</div>
					<div class="line"></div>
					<div class="totalPay">
						<div class="total_hanguel">총 결제금액</div>
						<div class="total_money">
							<c:if test="${item.oprice != '0'}">
								<fmt:formatNumber value="${item.oprice}" pattern="#,###" />
							</c:if>
							원
						</div>
					</div>
					<div class="guide_box">
						<div class="guide01">이용안내</div>
						<div class="guide02">실 결제금액은 주문결제에서 프로모션/쿠폰 적용에 따라 달라질 수
							있습니다.</div>
						<div class="guide03">서비스 제공이 완료된 이후에 전문가에게 결제 대금이 전달됩니다.</div>
					</div>
					<!-- <input type="submit" value="결제하기" class="btn01"> -->
					
					<button class="btn01" type="button" onclick="location='class_pay_ok';">결제하기</button>

				</div>

			</div>
		</form>
	</div>

</body>
<div style="margin: 300px 0px 0px 0px;"></div>

<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>