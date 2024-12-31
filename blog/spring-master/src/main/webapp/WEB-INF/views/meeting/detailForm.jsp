
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" scope="application" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Meeting Detail</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
</head>
<body>
<div class="container">
    <button type="button" onclick="location.href='/mainForm.do'">뒤로</button>
    <button id="btn-like" type="button">
        Like<span id="currentLike">좋아요:</span>
    </button>
    <br><br>
    <div>
        글 번호:<span id ="regId" >${detail.regId}</span>
        작성자: <span><i>Anknown</i></span>
    </div>

    <br>
    <hr>
    <div class="form-group">
        <h3>[title]${detail.title}</h3>
    </div>
    <hr>
    <div class="form-group">
        <h3>[content]:${detail.content}</h3>
    </div>
    <br>
    <hr>
    <div>
        <div class="form-group">
            <h3>모집기간</h3>
            <span>${detail.strPeriod}~${detail.endPeriod}</span>
        </div>
    </div>

</div>

<script src="${contextPath}/resources/js/utils/meetingHandler.js"></script>


</script>
</body>
</html>
