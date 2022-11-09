<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolForYou</title>
<script src="/js/jquery.js"></script>
<script src="/js/class.js"></script>
<script src="https://kit.fontawesome.com/7e87ecac1e.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/class_detail.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" />

</head>
<body>



	<div id="header_body" style="width: 100%;"></div>


	<%-- header와 footer를 제외한 전체 --%>
	<div id="wrap">
		<form name="form5" method="post" action="/class_detailOnline" enctype="multipart/form-data">
			<input type="hidden" name="ono" value="${item.ono}">

			<%-- wrap에서 윗부분 --%>
			<div class="section01">

				<%-- section01의 왼쪽(이미지) --%>
				<div class="left_side">

					<%-- 
							<div class="image01">
								<img src="/upload${c.cimage}" />
							</div>--%>
					<c:choose>
						<c:when test="${!empty item.oimage}">
							<div class="image01">
								<img src="/upload/class${item.oimage}" class="thumbnail-img" />
							</div>
						</c:when>
						<c:otherwise>
							<div class="image01">
								<img src="/images/class/aaaa.jpg" class="thumbnail-img" />
							</div>
						</c:otherwise>
					</c:choose>

				</div>


				<%-- section01의 오른쪽(상세내역) --%>
				<div class="right_side">
					<div class="category">골프 클래스</div>
					<div class="class_name2">
						${item.otitle}
						<%-- request.setAttribute로 담은 이름의 컬럼명으로 데이터를 뿌림. --%>
					</div>

					<div class="tab_container">
						
						<div id="tab1" class="tab_content">
							<br>
							<div class="price">
								<span class="totalPrice">
								<fmt:formatNumber value="${item.oprice}" pattern="#,###" />
								</span> 원 
								<span class="vat">(VAT 포함가)</span><br /> <br />
							</div>
							<div class="class_detail">
								<div class="class_info">${item.otitle}</div>
								<div class="class_desc">
									<p>${item.odesc}</p>
								</div>
							</div>
							<div class="class_detail2">
								<div class="detail_group">
									<div class="detail_left">수강기간</div>
									<div class="detail_right">${item.otime} 일</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">추천 레벨</div>
									<div class="detail_right">
										<c:out value="${item.olevel}" />
									</div>
								</div>
							</div>
							<!-- <button class="btn01" type="button"
								onclick="location.href='class_cart'">장바구니</button> -->
							<button class="btn02" type="button" onclick="location='class_payOnline?ono=${item.ono}';">바로 결제</button>
						</div>

						<div id="tab2" class="tab_content">
							<br>
							<div class="price">
								<span class="totalPrice"><c:out value="${item.oprice}" />원</span>
								<span class="vat">(VAT 포함가)</span><br /> <br />
							</div>
							<div class="class_detail">
								<div class="class_info">
									라운딩 골프 레슨
									<c:out value="${item.odesc}" />
									회
								</div>
								<div class="class_desc">
									<p>
										<c:out value="${item.otime}" />
									</p>
								</div>
							</div>
							<div class="class_detail2">
								<div class="detail_group">
									<div class="detail_left">강의실 제공 포함</div>
									<div class="detail_right">✔</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">1회당 레슨 시간(분)</div>
									<div class="detail_right">
										<c:out value="${item.otime}" />
										분
									</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">레슨 횟수</div>
									<div class="detail_right">
										<c:out value="${item.olevel}" />
										회
									</div>
								</div>

							</div>
							<!-- <button class="btn01" type="button"
								onclick="location.href='class_cart'">장바구니</button> -->
							<button class="btn02" type="button"
								onclick="location.href='class_pay'">바로 결제</button>

						</div>

						<div id="tab3" class="tab_content">
							<br>
							<div class="price">
								<span class="totalPrice"><c:out value="${item.oprice}" />원</span>
								<span class="vat">(VAT 포함가)</span><br /> <br />
							</div>
							<div class="class_detail">
								<div class="class_info">
									라운딩 골프 레슨
									<c:out value="${item.odesc}" />
									회
								</div>
								<div class="class_desc">
									<p>
										<c:out value="${item.otime}" />
									</p>
								</div>
							</div>
							<div class="class_detail2">
								<div class="detail_group">
									<div class="detail_left">강의실 제공 포함</div>
									<div class="detail_right">✔</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">1회당 레슨 시간(분)</div>
									<div class="detail_right">
										<c:out value="${item.otime}" />
										분
									</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">레슨 횟수</div>
									<div class="detail_right">
										<c:out value="${item.olevel}" />
										회
									</div>
								</div>

							</div>
							<!-- <button class="btn01" type="button"
								onclick="location.href='class_cart'">장바구니</button> -->
							<button class="btn02" type="button"
								onclick="location.href='class_pay'">바로 결제</button>

						</div>
					</div>
				</div>
			</div>


			<div class="section02">
				<div class="tab_container">

					<!--탭 메뉴 영역 -->
					<div class="tabs">
						<ul>
							<li class="active"><a href="#" rel="tab4">클래스 설명</a></li>
							<li><a href="#" rel="tab5">가격 정책</a></li>
							<!-- <li><a href="#" rel="tab6">리뷰</a></li> -->
							<li><a href="#" rel="tab7">취소 및 환불 규정</a></li>
						</ul>
					</div>

					<div id="tab4" class="tab_content">
						<div class="tab4_left">
							<h4>
								<br /> <br />클래스 설명
							</h4>
							<br />
							<p>
								안녕하세요.<br /> <br />
								<strong><c:out value="${item.tname}" /> 프로</strong>입니다.<br /><br /> 
								골프는 반드시 원칙과 이론을 익혀서 골프 본질을 파악하고 배우기 시작해야 합니다.<br /><br />
								가르쳐주신 분의 주입식으로 배우면 절대 즐거운 골프가 되지 않습니다.<br /><br />
								시작할 때는 모르지만 어느정도 시일이 지나 이제 잘 쳐보야겠다 싶을 땐 이미 늦습니다.<br /><br />
								기초가 잘못되면 절대 실력향상이 안 됩니다. 물론 교정은 더더욱 어렵습니다.<br /><br />
								이미 잘못된 폼이 몸에, 근육에 기억되어있기 때문입니다.<br /><br /><br />
								이 강의는 골프를 배우기 전에 준비할 내용, 알아야 할 내용을 가르쳐 드립니다.<br /><br />
								많은 도움 되시길 바랍니다.<br /><br /><br />
								골프는 평생 하는 운동입니다.<br /><br />
								연습을 많이 한다고 잘 칠 수 있는 것이 아닙니다.<br /><br />
								골프 전문가가 되고 싶어하는 분들에게 보물같은 클래스가 될 것으로 믿습니다.<br /><br />
							</p>
						</div>
						<div class="tab4_right">
							<div class="notice">
								<div class="warning">
									<img src="/images/class/warning.png" />
								</div>
								<div class="warning2">서비스 제공이 완료된 이후에 전문가에게 결제 대금이 전달됩니다.</div>
							</div>
							<div class="class_teacher">
								<div class="teacher_name">
									<span><c:out value="${item.tname}" />&nbsp;프로</span>
								</div>
								<div class="teacher_career">
									<div class="introduce">
										<span>소개</span>
									</div>
									<div class="introduce_detail">
										<p>
											<c:out value="${item.tcareer}" />
										</p>
										<div class="phone">전화번호</div>
										<div class="phone_detail">
											<p>
												<c:out value="${item.ophone}" />
											</p>
										</div>
										<div class="address_online">추천 레벨</div>

										<div class="address_detail_online">
											<p>
												<c:out value="${item.olevel}" />
											</p>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>

					<div id="tab5" class="tab_content">
						<h4>
							<br /> <br />가격 정책
						</h4>
						<br />

						<div class="table_price_online">
							<div class="detail1">
								<div class="detail1_1"></div>
								<div class="detail_vertical">
									<div class="standard1">가격</div>
									<div class="standard2">
										<c:out value="${item.oprice}" />
										원
									</div>
								</div>
							</div>
							<div class="detail2">
								<div class="detail2_1">패키지 설명</div>
								<div class="detail_vertical">
									<div class="standard_desc">
										<p>
											${item.odesc}
										</p>
									</div>
								</div>
							</div>
							<div class="detail4">
								<div class="detail4_1">수강기간</div>
								<div class="detail_vertical">
												${item.otime}&nbsp;일			
								</div>
								</div>
							<div class="detail5">
								<div class="detail5_1">추천 레벨</div>
								<div class="detail_vertical">
											${item.olevel}
								</div>
							</div>
						</div>
					</div>

					<div id="tab6" class="tab_content">
						<h4>
							<br /> <br />클래스 리뷰
						</h4>
						<br />
						<div class="class_review">
							<div class="class_stars">
								<i class="fa-solid fa-star"
									style="color: #56F569; font-size: 3em;"></i> <i
									class="fa-solid fa-star"
									style="color: #56F569; font-size: 3em;"></i> <i
									class="fa-solid fa-star"
									style="color: #56F569; font-size: 3em;"></i> <i
									class="fa-solid fa-star"
									style="color: #56F569; font-size: 3em;"></i> <i
									class="fa-solid fa-star"
									style="color: #56F569; font-size: 3em;"></i>
							</div>
							<div class="class_points">
								<span class="points">5.0</span>&nbsp;<span class="counts">|
									5개의 평가</span>
							</div>
							<div class="hr">
								<hr />
							</div>
						</div>
					</div>

					<div id="tab7" class="tab_content">
						<h4>
							<br /> <br />취소 및 환불 규정
						</h4>
						<br />
						<p>
							가. 환불 상세<br /> - 결제 후 14일 이내에 영상 재생 이력이 없는 경우 전액 환불됩니다.<br/>
							- 그 외에는 영상 재생 여부와 상관없이 환불이 불가합니다.<br/><br/>
							나. 유의사항<br/>
							- GolForYou가 무상으로 제공하는 무료 서비스 혹은 추가 이용 기간(보너스 기간)은 환불에 영향을 미치지 않습니다.<br/>
							- 환불금액은 실제 결제금액을 기준으로 계산되며, 결제수수료·제세공과금 등을 공제할 수 있습니다.<br/>
							- GolForYou는 회원이 관계 법령 또는 이용약관 등을 위반한 경우 이용약관 및 정책에 따라 환불을 거부할 수 있습니다.<br/><br/>
							다. 기타<br/>
							- 서비스 품질 및 시스템에 관한 허위 사실을 근거로 환불을 요청한 경우, 손해배상청구 및 민사처벌의 대상이 될 수 있습니다.<br/>
							- GolForYou는 전자상거래 등에서의 소비자 보호에 관한 법률 및 기타 관계 법령을 참고하며, 또한 본 내용에 포함되지 않는 내용은 크몽 이용약관에 의거하여 기준을 판단합니다.
							<br/><br/><br/>
						</p>
					</div>

				</div>

			</div>
		</form>
	</div>



</body>
<div style="margin: 1% 0% 0% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>

