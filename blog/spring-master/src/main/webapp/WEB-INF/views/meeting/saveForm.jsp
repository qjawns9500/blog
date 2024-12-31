<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">
<head>

    <title>Save Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
</head>
<body>
<div class="container">
    <form>
        <div class="form-group">
            <label for="title">모임제목</label>
            <input type="text" class="form-control" placeholder="Enter title" id="title">
        </div>
        <div class="form-group">
            <label for="content">내용입력</label>
            <input type="text"class="form-control" placeholder="Enter content" id="content">
        </div>

        <div class="form-group">
            <label for="content">해시태그</label>
            <input type="text"class="form-control" placeholder="Enter content" id="hashtag">
        </div>
    </form>
    <button id="meetingSave" class="btn btn-primary">글 작성</button>
</div>
<script src="/resources/js/utils/meetingHandler.js"></script>
</body>
</html>



