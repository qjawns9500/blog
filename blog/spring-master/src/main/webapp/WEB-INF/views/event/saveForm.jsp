<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로컬환경에서 웹페이지 한글 깨짐현상 발생해서 추가 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="contextPath" scope="application" value="${pageContext.request.contextPath}"/>
<html lang="ko">
<head>

    <title>Event Save Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
</head>
<body>
<div class="container">
    <form>
        <div class="form-group">
            <label for="eventTitle">이벤트제목</label>
            <input type="text" class="form-control" placeholder="Enter title" id="eventTitle">
        </div>
        <div class="form-group">
            <label for="eventContent">내용</label>
            <input type="text"class="form-control" placeholder="Enter content" id="eventContent">
        </div>
    </form>
    <button id="eventSave">이벤트 작성</button>
</div>
<script src="/resources/js/utils/eventHandler.js"></script>
</body>
</html>



