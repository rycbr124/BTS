<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/main/main.css">
<link rel="stylesheet" href="${contextPath}/resources/css/layout/layout.css">
<link rel="stylesheet" href="${contextPath}/resources/css/main/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/main/login.css">
<!--  <link rel="stylesheet" href="${contextPath}/resources/css/main/loginPopup.css">-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${contextPath}/resources/js/main/logo.js"></script>
<script src="${contextPath}/resources/js/main/main.js"></script>
<link rel="canonical" href="http://www.alessioatzeni.com/wp-content/tutorials/jquery/login-box-modal-dialog-window/index.html" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
@font-face {
	src: url("/bts/resources/fonts/Binggrae/Binggrae-Bold.woff");
	font-family: "Binggrae";
}

div.main_section_accompany {
	margin-left: 250px;
	margin-right: 250px;
}

div.main_section_reservation {
	margin-left: 250px;
	margin-right: 250px;
}

img.detail {
	display: inline-block;
	width: 300px;
	height: 200px;
	margin: 50px 20px 30px 50px;
}

h3.title {
	font-family: "Binggrae";
	margin-bottom: 100px;
}
</style>
<meta charset="UTF-8">
<title>Best Travel Seoul</title>

<c:if test='${not empty message }'>
	<script>
		window.onload = function() {
			result();
		}
		function result() {
			alert("아이디나 비밀번호가 틀립니다.");
		}
	</script>
</c:if>

</head>
<body>
	<div id="header">
		<a href="${contextPath}/main/main" class="header_logo"> <img src="${contextPath}/resources/image/logo/흰색/logo_white_all.png" alt="BTS">
		</a>
		<div class="header_control_container">
			<ul id="menu" class="menu">
				<li class="menu_recommend"><a href="${contextPath}/recommend_main">추천</a></li>
				<li class="menu_reservation"><a href="#">예약</a></li>
				<li class="menu_accompany"><a href="${contextPath }/accompany/accMain">동행</a></li>
				<li class="menu_community"><a href="${contextPath}/community/plan_list">커뮤니티</a></li>
				<li class="menu_planner"><a href="${contextPath}/planner/planner">플래너</a></li>
				
			</ul>
			<div class="member_menu" style="top:30px;">
				<c:choose>

					<c:when test="${isLogOn== true and not empty memberInfo }">
						<img src="${contextPath}/resources/image/icon/user.png">
						<p style="display:inline-block; color:#fff;">어서오세요  ${member_id} 님</p>
						<div class="memberArea" style="position:relative; left:25px;">
						<c:set var="member" value="${member_id}"/>
						<c:choose>
						<c:when test="${member_id != 'admin'}">
						<a href="${contextPath }/my/profile" class="mypage" style=" position:absolute; display:block;font-size:10px; padding-right:5px;border-right:1px solid #fff; line-height:10px;"><span>마이페이지</span></a>
						<a href="${contextPath }/signup/logout" class="logout" style="position:absolute; left:60px; font-size:10px; line-height:10px;"><span>로그아웃</span></a>
						</c:when>
						<c:when test="${member_id == 'admin'}">
						<a href="${contextPath}/admin/main" class="mypage" style=" position:absolute; display:block;font-size:10px;padding-right:5px;border-right:1px solid #fff; line-height:10px;"><span>관리자 페이지</span></a>
						<a href="${contextPath }/signup/logout" class="logout" style="position:absolute; left:75px; font-size:10px; line-height:10px;"><span>로그아웃</span></a>
						</c:when>
						</c:choose>
						
						</div>
					</c:when>
					<c:otherwise>
						<!--  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#popUpWindow">Log IN</button>-->
						<a href="#exampleModal" class="signup" data-toggle="modal"><span>LOGIN</span></a>
						<a href="${contextPath}/signup/signup" class="signup"><span>SIGN UP</span></a>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- member_menu -->
		</div>

	</div>


	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<h3 class="modal-title">BTS Login</h3>
				</div>
				<!-- body -->
				<div class="modal-body">
					<form role="form" method="post" action="${contextPath}/signup/login">
						<div class="form-group">
							<label class="member_id"> <span>ID</span> <input type="text" class="form-control" id="member_id" name="member_id" placeholder="ID" /></label> <br> <label class="password"> <span>Password</span> 
							<input type="password" class="form-control" id="password" name="password" placeholder="Password" /></label> <br> 
							<br><input type="submit" value="LOGIN" class="submit button" type="button" id="loginbutton">
						</div>
					</form>
				</div>
				<!-- footer -->
				<div class="modal-footer">

					<p id="findId_Pw">
						<a class="forgotpw" href="${contextPath }/find/findPwMain" style="color: white">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp; <a class="forgotid" href="${contextPath }/find/findIdMain" style="color: white">아이디 찾기</a>
					</p>
				</div>

				<div id="kakao_id_login" style="text-align: center">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=6a0602e55acf9e0f00406d7fb1f93b3d&redirect_uri=http://localhost:8088/bts/signup/kakaoLogin&response_type=code"> <img width="223" src="${contextPath}/resources/image/main/kakao_login.png" /></a> <a href="${contextPath}/signup/naverLogin"> <img width="223" src="${contextPath}/resources/image/main/naver_login.PNG" /></a>
				</div>
			</div>
		</div>
	</div>


	<main class="main">
	<div id="carousel-example-generic" class="carousel slide active" data-ride="carousel" data-pause="false">
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="${contextPath}/resources/image/main/main_night.jpg" alt="first-image">
				<div class="container">
					<div class="carousel-caption animatedFadeInUp fadeInUp">
						<h1>일상이 여행이됩니다</h1>
					</div>
				</div>
			</div>

			<div class="item">
				<img src="${contextPath}/resources/image/main/main_road.jpg" alt="second-image">
				<div class="container">
					<div class="carousel-caption animatedFadeInUp fadeInUp">
						<h1>서울의 명소를 한눈에!</h1>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="${contextPath}/resources/image/main/main_third2.jpg" alt="third-image">
				<div class="container">
					<div class="carousel-caption animatedFadeInUp fadeInUp">
						<h1>
							BTS와 함께하는 <br /> 재미난
							<p style="color: pink; display: inline-block;">서울여행</p>
							에<br /> 여러분을 초대합니다.
						</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- careusel-inner -->
	</div>
	<!-- carousel -->
	<div class="main_section_search" id="main_section main_section_search">
		<p class="search_title">원하는 여행지를 빠르게 찾아보세요!</p>
		<div class="search_container">
			<li class="search">
				<div class="search_quick" id="search_quick">
					<p>여행지</p>
					<input type="text" id="search_text" placeholder="원하시는 여행지를 입력하세요."> <select class="select_list" id="select_list">
						<option value="통합검색">통합검색</option>
						<option value="추천">추천</option>
						<option value="예약">예약</option>
						<option value="동행">동행</option>
						<option value="커뮤니티">커뮤니티</option>
						<option value="플래너">틀래너</option>
					</select>
				</div>
			</li>
			<li class="select">
				<div class="city_selct" id="city_select">
					<p>다른 도시 보기</p>
					<p class="box_tab">
						<a href="#" id="tab" value="을지로">#을지로</a> 
						<a href="#" id="tab" value="종로구">#종로구</a> 
						<a href="#" id="tab" value="강남구">#강남구</a> 
						<a href="#" id="tab" value="홍대">#홍대</a> 
						<a href="#" id="tab" value="서초구">#서초구</a>
					</p>
				</div>
			</li>
			<div class="hot-place-tab" id="hot-palce-tab">
				<span class="hotplace_title">지금 핫한 곳!</span>
				<p class="box_tab">
					<a href="#" id="tab">#을지로</a>
					<a href="#" id="tab">#종로구</a>
					<a href="#" id="tab">#강남구</a>
					<a href="#" id="tab">#홍대</a>
					<a href="#" id="tab">#서초구</a>
				</p>
				<button type="button" class="btn search_city" id="search_city">검색하기</button>
			</div>
		</div>
	</div>

	<!-- Scroll down_1 Reservation -->
	<div class="main_section_reservation" id="main_section main_section_reservation" style="position: relative;">
		<div class="caption">
			<h1 style="font-weight: bold;">RECOMMEND</h1>
		</div>
		<p>BTS는 완벽한 여행이 되도록 최선을 다합니다.</p>
		<p style="color: gray; text-decoration: underline;">새로운 곳에서 새로운 사람과 새로운 경험</p>
		<div>
			<h3 class="title">BTS와 함께 성공적인 여행을 경험하세요!</h3>
		</div>
		<hr style="border: solid 1px gray;">
		<h3 style="font-weight: bold">지금 가장 인기있는 숙소 TOP5</h3>
		<div style="width:100%; margin-left: 100px;">
			<div class="best_recommend" style="width:100%; height:auto;">
			</div>
		</div>
		<h3 style="font-weight: bold">새로운 여행지 TOP5</h3>
		<div style="margin-left: 100px; margin-bottom: 200px">
			<div class="best_place">
			
			</div>
		</div>
			<button type="button" class="btn btn-secondary" style="float: right; margin-right: 200px; margin-top: 50px;">more</button>
	</div>

	<!-- Scroll down_2 Accompany -->
	<div class="main_section_accompany" id="main_section main_section_accompany">
		<div class="caption">
			<h1 style="font-weight: bold; margin-top: 150px;">ACCOMPANY</h1>
		</div>
		<p>BTS는 완벽한 여행이 되도록 최선을 다합니다.</p>
		<p style="color: gray; text-decoration: underline;">새로운 곳에서 새로운 사람과 새로운 경험</p>
		<div>
			<h3 class="title">BTS와 함께 성공적인 여행을 경험하세요!</h3>
		</div>
		<hr style="border: solid 1px gray;">
		<h3 style="font-weight: bold">가장 최근에 등록된 글</h3>
		<div style="margin-left: 100px; margin-bottom: 200px">
			<div class="lately-accompany">
				
			</div>
			<button type="button" class="btn btn-secondary" style="float: right; margin-right: 200px; margin-top: 50px;">more</button>
		</div>
	</div>

	<!-- footer -->
	<div class="footer_inner">
		<!--  <a href="#" id="go_top" class="go_top"><span lang="en">TOP</span></a>-->
		<div class="footer_top">
			<div class="footer_cs">
				<p class="footer_cs_title">Best Travel Seoul</p>
				<div class="footer_cs_content">
					<p class="footer_cs_tel">
						<a href="#">010-9781-1729</a>
					</p>
					<ul class="footer_cs_time">
						<li>이용시간 평일 09:00~18:00</li>
						<li>점심시간 12:00~13:00</li>
					</ul>
				</div>
				<!-- .footer_cs_content -->
			</div>
			<!-- .footer_cs -->
		</div>
		<!-- .footer_top -->

		<ul class="footer_menu">
			<li class="footer_menu_notice"><a href="#">공지사항</a></li>
			<li class="footer_menu_event"><a href="#">이벤트</a></li>
			<li class="footer_menu_faq"><a href="#">FAQ</a></li>
			<li class="footer_menu_terms"><a href="#">이용약관</a></li>
			<li class="footer_menu_privacy"><a href="#">개인정보처리방침</a></li>
		</ul>

		<!--  <p class="footer_logo"><a href="#"><img src="test04/BTS_logo_black_all.png" alt="BTS" /></a></p>-->

		<div class="footer_info">
			<ul>
				<li>Best Travel Seoul</li>
				<li class="name"><span>대표이사</span>이주희</li>
				<li><span>주소</span>서울특별시 서초구 서초동</li>
				<li class="sub_name"><span>직원</span>안밀령 이재홍 안은영 원종평</li>
			</ul>
			<div lang="en" class="copyright">
				<span>COPYRIGHT 2019 BTS Corp. ALL RIGHTS RESERVED.</span>
			</div>
		</div>
		<!-- .footer_info -->
	</div>
	<!-- .footer_inner --> </main>
</body>
</html>