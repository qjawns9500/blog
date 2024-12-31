<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

</section>
<!--// Container -->
<%--<%@ include file="../modal/alertModal.jsp"%>--%>
<%--<%@ include file="../modal/confirmModal.jsp"%>--%>
<script>
$(function(){
	// 브라우저 검사 (IE 버전 10 이하 일 경우)
    var oldIE;
    if ($('html').is('.lt-ie7, .lt-ie8, .lt-ie9')) {
        oldIE = true;
    }

    var ua = window.navigator.userAgent;
    if(ua.indexOf('MSIE ') > 0){
    	oldIE = true;
    }

    if (oldIE) {
        alertMsg = "익스플로러 11이상의 환경에\n 최적화된 프로그램입니다.\n";
        alertMsg += "안정적인 시스템 사용과 보안강화를 위하여\n";
        alertMsg += "인터넷 익스플로러를 업그레이드 해주세요.\n";

        alertModal("브라우저 버전 경고", "익스플로러 버전 업그레이드 권고", alertMsg, null);
    }
    
    
  	//로딩바 해제
	$("#loading").hide();	
    
  	
});

function goPrivacyList(){
	location.href='<%=request.getContextPath()%>/privacyList.do';
}

function goUrl(){
	var divice;
	var select = $("#selUrl option:selected").text();
	var url;
	
	if(select == "의정플러스+"){
		
		var filter = "win16|win32|win64|mac|macintel";
		if ( navigator.platform ) {
			//mobile 
			if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
				//임시 url
				url = "https://osn.smc.seoul.kr/front/user/main.do";
			//pc
			} else {
				url =  "https://osn.smc.seoul.kr/front/user/main.do";
			}
		}
	}else if(select == "서울시의회"){
		
		var filter = "win16|win32|win64|mac|macintel";
		if ( navigator.platform ) {
			//mobile 
			if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
				//임시 url
				url = "https://www.smc.seoul.kr/main/index.do";
			//pc
			} else {
				url =  "https://www.smc.seoul.kr/main/index.do";
			}
		}
	}else if(select == "서울시의회전문도서관") {
		var filter = "win16|win32|win64|mac|macintel";
		if ( navigator.platform ) {
			//mobile
			if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
				//임시 url
				url = "https://library.smc.seoul.kr/#/";
			//pc
			} else {
				url =  "https://library.smc.seoul.kr/#/";
			}
		}
	}else if(select == "홈페이지 바로가기"){
		alert("이동할 사이트를 선택하세요.");
		return;
	} else{
		url = $("#selUrl").val();
		
	}
		window.open(url);
}

</script>
<!-- footer -->
<footer>
<input type="hidden" id="link">
	<div class="btn-bar-wrap">
		<div class="btn-bar">
			<!-- <button type="button" class="btn btn-outline-white" onclick="goPolicyList()">개인정보취급방침</button>
			<div class="family-site">
				<select name="" title="" id="selUrl">
					<option value="" selected="selected">전체</option>
					<option value="https://www.nosa.or.kr/portal/">노사발전재단</option>
					<option value="">장년워크넷</option>
					<option value="https://www.moel.go.kr/index.do">고용노동부</option>
				</select>
				<button type="button" class="btn btn-outline-white" onclick="goUrl()">이동</button>
			</div> -->
			<button type="button" class="btn" onclick="goPrivacyList()">개인정보 취급방침</button>
				<div class="family-site">
					<select name="" title="" id="selUrl">
						<option value="" selected="selected">홈페이지 바로가기</option>
						<option value="">의정플러스+</option>
						<option value="">서울시의회</option>
						<option value="">서울시의회전문도서관</option>
					</select>
					<button type="button" class="btn" onclick="goUrl()">Go</button>
				</div>
		</div>
	</div>
	<div class="wrapper">
		<div class="footer-info">
			<p><img src="<%=request.getContextPath()%>/resources/images/logo/footer-logo.png" alt=""/></p>
			<address>
				<em>본관 (04519) 서울특별시 중구 세종대로 125(태평로1가 60-1)</em>
				<em>별관 (04515) 서울특별시 중구 덕수궁길 15 (서소문동 37) 서울특별시의회 의원회관</em>
				<em>대표전화 : 02-120 또는 02-2180-8000~5</em>
				<cite>Copyright(c) Seoul Metropolitan Council All rights reserved.</cite> 
			</address>
		</div>
	</div>
</footer>


<!--// footer -->
</body>
</html>

<script type="text/javascript">
$(document).ready(function() {
	$(".dim").hide();
});
</script>

<!--로딩바 jsp -->
<%--<%@ include file="loader.jsp" %>--%>
<!-- 로딩 jsp  -->