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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/ScrollTrigger.min.js"></script>
    <script>
        $(document).ready(function (){
            //페이지 로드시 공지사항 리스트를 가져오는 함수
            function getEvents(){
                $.ajax({
                    url:"/event-json",
                    type:"GET",
                    dataType:"json"
                }).done(function (data){
                    $.each(data, function (index,value){
                        $("#viewCnt_"+value.eventId).text(value.viewCnt);
                    })
                }).fail(function (error){
                    console.log(error);
                })
            }

            window.addEventListener("pageshow",function (event){
                if(event.persisted || (window.performance && window.performance.navigation.type ===2)){
                    getEvents();
                }
            })
        })
    </script>
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

<div class="sub event_list">
    <section class="visual_section">
        <div class="sub_visual"></div>
    </section>




    <div class="sub_content event_list">
        <div class="eventTit"><h2>이벤트</h2></div>
        <ul>
            <li class="list_head">
                <div class="subjectBox">
                    <h6>title</h6>
                </div>
                <div class="dateBox">
                    <h6>작성일</h6>
                </div>
                <div class="countBox">
                    <h6>조회수</h6>
                </div>

            </li>


            <c:forEach var="item" items="${eventList}">
            <!-- 반복이 되어야하는 li 시작 -->
            <li id = "list_body" class="list_body">
                <a class="eventId" href="/event/${item.eventId}" data-event-id="${item.eventId}">
                    <div class="subjectBox">
                        <p>${item.title}</p>
                    </div>
                    <div class="dateBox">
                        <p>${item.createDate}</p>
                    </div>
                    <div class="countBox">
                        <p id="viewCnt_${item.eventId}">${item.viewCnt}</p>
                    </div>
                </a>
            </li>
            <!-- 반복이 되어야하는 li 끝 -->
            </c:forEach>
        </ul>
    </div>
</div>

<div class="footer">
    <h6>Copyright Portfolio</h6>
    <h6>상업적인 용도로 사용되는 페이지가 아닌 포트폴리오용 페이지입니다.</h6>
</div>
<script src="${contextPath}/resources/js/sub.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>
<script src="${contextPath}/resources/js/utils/eventHandler.js"></script>

</body>
</html>