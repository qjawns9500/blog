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
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/sub.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/ScrollTrigger.min.js"></script>
    <script>
        $(document).ready(function (){
            // 페이지 로드시 이벤트 리스트를 가져오는 함수 (비동기로 조회수,좋아요 수를 업데이트하기위함)
            function getMeetings(){
                $.ajax({
                    url:"/meetings-json",
                    type:"GET",
                    dataType:"json"
                }).done(function (meetings){
                    $.each(meetings, function (index,value){
                        $("#viewCnt_"+value.regId).text("조회수:" + value.viewCnt);
                        $("#likeCnt_"+ value.regId).text("좋아요:"+value.likeCnt);
                    })
                }).fail(function (error){
                    console.log(error);
                })
            }

            window.addEventListener("pageshow", function(event) {
                if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
                    getMeetings();  // 페이지를 다시 로드하여 업데이트된 조회수를 반영
                }
            });

        });
    </script>
</head>
<body>
<header class="header">
    <div class="header_inner">
        <div class="logo">
            <a href="/">logo</a>
            <input type="search" value="" placeholder="검색어를 입력해주세요">
        </div>
        <nav>
            <ul>
                <%--                <li><a href="javascript:void(0)">모임</a></li>--%>
                <%--                <li><a href="javascript:void(0)">커뮤니티</a></li>--%>
                <li><a href="/guide">이용가이드</a></li>
                <li><a href="/notice">공지사항</a></li>
                <li><a href="/event">이벤트</a></li>
                <li><a href="/rank">급상승</a></li>
            </ul>
            <ol>
                <li><a href="/login">로그인</a></li>
                <li><a href="/login/join">회원가입</a></li>
            </ol>
        </nav>
        <!-- <div class="toggleBox"></div> -->
    </div>
</header>
<div class="main">
    <div class="content">
        <section class="section01">
            <div class="main_visual"></div>
        </section>

        <section class="section02">
            <div class="sec02_title">
                <h2>모집중</h2>
            </div>
            <div class="sec02_cont">
                <div class="sec02_left_cont">
                    <div class="flex-wrap">
                        <c:forEach var="item" items="${relatedPosts}">
                            <div class="flex-item" >
                                <a class="regId" href="/meeting/${item.regId}" data-meeting-id="${item.regId}">
                                    <div class="imgBox">

                                        <!--이미지파일 크기맞춰주려고 스타일추가 -->
                                        <figure><img style="height: 320px" src="https://www.madtimes.org/news/photo/201904/1668_2667_160.jpg" alt=""></figure>
                                    </div>
                                    <div class="contentBox">
                                        <h3 class="subject">${item.title}</h3>

                                        <!-- 글 상세보기를 위한 게시글 Id -->
                                        <intput type="hidden" value="${item.regId}" class="item_regId"></intput>
                                        <h6 class="tag">
                                            <c:forEach var="hashtag" items="${hashtags}" varStatus="index">
                                                <c:if test="${item.regId eq hashtag.regId}">
                                                    <a href="/relate/${hashtag.tagtypeId}">${hashtag.tagContent}</a>

                                                </c:if>

                                            </c:forEach>
                                        </h6>
                                        <h5 class="dateText">${item.strPeriod} ~ ${item.endPeriod} </h5>
                                        <span id="likeCnt_${item.regId}">좋아요:${item.likeCnt}</span>
                                        <span>카테고리ID:${item.categoryId}</span>
                                        <span id="viewCnt_${item.regId}">조회수:${item.viewCnt}</span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>

                </div>

            </div>
        </section>
    </div>
</div>
<div class="footer">
    <h6>Copyright Portfolio</h6>
    <h6>상업적인 용도로 사용되는 페이지가 아닌 포트폴리오용 페이지입니다.</h6>
</div>
<script src="${contextPath}/resources/js/main.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>
<script src="${contextPath}/resources/js/utils/meetingHandler.js"></script>


</body>
</html>