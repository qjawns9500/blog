
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로컬환경에서 웹페이지 한글 깨짐현상 발생해서 추가 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="contextPath" scope="application" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>momo</title>
  <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/sub.css">>
</head>

<body>
<header class="header">
  <div class="header_inner">
    <div class="logo">
      <a href="/">logo</a>
    </div>
    <nav>
      <ul>
        <li><a href="/guide">이용가이드</a></li>
        <li><a href="/notice">공지사항</a></li>
        <li><a href="/event">이벤트</a></li>
      </ul>
      <ol>
        <li><a href="/login">로그인</a></li>
        <li><a href="/login/join">회원가입</a></li>
      </ol>
    </nav>
    <!-- <div class="toggleBox"></div> -->
  </div>
</header>

<div class="sub guide">
  <section class="visual_section">
    <div class="sub_visual"></div>
  </section>

  <div class="sub_content">
    <div class="guideFlex">
      <div class="guideFlexItem">
        <div class="imgBox">
          <figure><img src="" alt=""></figure>
        </div>
        <div class="txtBox">
          <h2>STEP 01</h2>
          <p>
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
          </p>
        </div>
      </div>
      <div class="guideFlexItem">
        <div class="imgBox">
          <figure><img src="" alt=""></figure>
        </div>
        <div class="txtBox">
          <h2>STEP 02</h2>
          <p>
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
          </p>
        </div>
      </div>
      <div class="guideFlexItem">
        <div class="imgBox">
          <figure><img src="" alt=""></figure>
        </div>
        <div class="txtBox">
          <h2>STEP 03</h2>
          <p>
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
          </p>
        </div>
      </div>
      <div class="guideFlexItem">
        <div class="imgBox">
          <figure><img src="" alt=""></figure>
        </div>
        <div class="txtBox">
          <h2>STEP 04</h2>
          <p>
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
            이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다이용가이드 예시입니다
          </p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="footer">
  <h6>Copyright Portfolio</h6>
  <h6>상업적인 용도로 사용되는 페이지가 아닌 포트폴리오용 페이지입니다.</h6>
</div>
<script src="${contextPath}/resources/js/sub.js"></script>
<script src="${contextPath}/resources/js/common.js.js"></script>

<script>
  const guideItems = document.querySelectorAll('.guide .guideFlex .guideFlexItem');

  guideItems.forEach((item, idx) => {
    ScrollTrigger.create({
      trigger: item,
      start: 'top 70%',
      end: 'bottom center',
      animation: gsap.from(item, {y:'8vw', opacity:0}),
    })
  })


</script>


</body>
</html>
