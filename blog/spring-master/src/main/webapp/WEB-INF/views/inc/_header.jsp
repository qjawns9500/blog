<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="format-detection" content="telephone=no" />
<script language="javascript" type="text/javascript">
</script>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/ico/favicon.ico" />
<link href="<%=request.getContextPath()%>/resources/css/bak/bootstrap.css" type="text/css" rel="stylesheet" media="screen" />
<link href="<%=request.getContextPath()%>/resources/css/bak/bootstrap.min.css" type="text/css" rel="stylesheet" media="screen" />
<link href="<%=request.getContextPath()%>/resources/css/bak/total.css" type="text/css" rel="stylesheet" media="screen" />
<!-- <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> -->
<link href="<%=request.getContextPath()%>/resources/css/bak/style.css" type="text/css" rel="stylesheet" media="screen" />
<link href="<%=request.getContextPath()%>/resources/css/bak/swiper.css" type="text/css" rel="stylesheet" media="screen" />
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js" language="javascript" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/design.js" language="javascript" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/link.js" language="javascript" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/swiper.min.js" language="javascript" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js" language="javascript" type="text/javascript"></script>

<!-- Date Picker -->
<link href="<%=request.getContextPath()%>/resources/css/daterange/daterangepicker.css" type="text/css" rel="stylesheet"  media="screen" />
<script src="<%=request.getContextPath()%>/resources/js/pickers/daterange/moment.min.js" language="javascript" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/pickers/daterange/daterangepicker.min.js" language="javascript" type="text/javascript"></script>
<!--// Date Picker -->


<title>모임</title>
<%
//post 값 넘길때 캐쉬에 데이터 담고있기
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1")) 
	response.setHeader("Cache-Control", "no-cache"); 
%>
</head>
<body>

<!-- Header -->
<header>
<form id="headerSearchForm" name="headerSearchForm" autocomplete="off" style="margin: 0px;">
<input type="hidden" name="csrfName" value="${_csrf.token}"/>

	<div class="top-menu-wrap">
		<div class="top-menu">
		
			<div class="left-side">
				<h1><a href="javascript:goUrl_main();"><img src="<%=request.getContextPath()%>/resources/images/logo/header-logo.png" alt=""/></a></h1>
				<div class="search-group">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="text" class="search-form" name="headerSearchText" id="headerSearchText" placeholder="배우고 싶은 교육과정을 검색하세요." onkeydown="if(event.keyCode == 13) searchAllCourse(headerSearchText);"/>
					<button type="button" class="btn" onclick="searchAllCourse(headerSearchText);"><i class="icon-magnifier"></i></button>
				</div>
				<a href="#" class="btn-hidden btn-menu"><i class="ft-menu"></i></a>
				<a href="#" class="btn-hidden btn-search"><i class="icon-magnifier"></i></a>
				<a href="#" class="btn-hidden btn-more-vertical"><i class="ft-more-vertical"></i>
				</a>
			</div>
		</div>
		</form>
			<div class="right-side">
				<ul class="tm">
					<li class="login-after userName"><span>정대훈</span>님</li>
					<li class="login-after"><a href="javascript:golog_out();">로그아웃</a></li>
					<li class="login-after">
						<a href="javascript:goUrl_tm_1_3_2();">쪽지함
								<span style="display:block" class="new-note">N</span>
						</a></li>
					<li class="login-after"><a href="javascript:goUrl_tm_1_3();">마이페이지</a></li>
					<li class="login-before"><a href="javascript:goUrl_tm_1_2();">통합 로그인</a></li>
					<li class="login-before"><a href="javascript:goUrl_tm_1_1();">회원가입</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="wrapper">
		<div class="gnb-wrap">
			<a href="#" class="btn-m-gnb"><i class="ft-menu"></i></a>			
			<!-- GNB -->
			<nav class="gnb">
				<ul class="gnb-mm-list">
					<li class="mm m02" onclick="javascript:goUrl_2_1();"><a href="javascript:goUrl_2_1()">ㄹㄹㄹㄹ</a>
						<ul class="gnb-sm-list">
									<li></li>
									<li></li>
									<li></li>
									<li></li>
							<li><a href="javascript:goUrl_2_1_2();">ㄴㄴㄴㄴㄴㄴ</a></li>
						</ul>
					</li>
					<li class="mm m03" onclick="javascript:goUrl_3_1();"><a href="javascript:goUrl_3_1();">ㅇㅇㅇㅇㅇㅇ</a>
						<ul class="gnb-sm-list">
							<li><a href="javascript:goUrl_3_1_1();">123</a></li>
							<li><a href="javascript:goUrl_3_1_2();">34564</a></li>
							<li><a href="javascript:goUrl_3_1_3();">456456</a></li>
						</ul>
					</li>
					<li class="mm m04" onclick="javascript:goUrl_4_1();"><a href="javascript:goUrl_4_1();">234324</a>
						<ul class="gnb-sm-list">
							<li><a href="javascript:goUrl_4_1_1();">345345</a></li>
							<li><a href="javascript:goUrl_4_1_2();">345345</a></li>
						</ul>
					</li>
					<li class="mm m04" onclick="javascript:goUrl_tm_1_3();"><a href="javascript:goUrl_1_3();">123123</a>
						<ul class="gnb-sm-list">
							<li><a href="javascript:goUrl_tm_1_3_1();">개인정보수정</a></li>
							<li><a href="javascript:goUrl_tm_1_3_2();">쪽지함</a></li>
							<li><a href="javascript:goUrl_tm_1_3_4();">회원탈퇴</a></li>
						</ul>
					</li>
					<li class="mm m04" onclick="javascript:goUrl_tm_1_3_2();"><a href="javascript:goUrl_1_3_2();">마이페이지</a>
						<ul class="gnb-sm-list">
							<li><a href="javascript:goUrl_tm_1_3_2();">쪽지함</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<!--// GNB -->
			
		</div>
	</div>
	<div class="gnb-sm-bg"></div>


</header>

<script type="text/javascript">
//mobile, pc에 따라 연결 링크 다르게
$(document).ready(function(){

	var filter = "win16|win32|win64|mac|macintel";

	if ( navigator.platform ) {
		if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
			//mobile
			$("#workNetLink").attr("href", "https://m.work.go.kr/senior/main/main.do")
			
		} else {
			//pc
			$("#workNetLink").attr("href", "https://www.work.go.kr/senior/main/main.do")
		}
	}
	
});

//교육과정 전체 검색
function searchAllCourse(searchText){
	var f = document.headerSearchForm;
	
	console.log(searchText);
	f.headerSearchText.value = searchText.value.trim();
	f.method = "POST";
	f.action = "<%=request.getContextPath()%>/course/searchAllCourse.do";
	f.submit();
}

</script>

<!--// Header -->

<!-- Container -->
<%--<section class="container"></section>--%>