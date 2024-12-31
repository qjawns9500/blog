<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">
<head>

    <title>Notice Save Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
</head>
<body>
<div class="container">
    <form>
        <div class="form-group">
            <label for="noticeTitle">공지제목</label>
            <input type="text" class="form-control" placeholder="Enter title" id="noticeTitle">
        </div>
        <div class="form-group">
            <label for="noticeContent">내용</label>
            <input type="text"class="form-control" placeholder="Enter content" id="noticeContent">
        </div>
    </form>
    <button id="noticeSave">공지 작성</button>
</div>
<script src="/resources/js/utils/noticeHandler.js"></script>
</body>
</html>



