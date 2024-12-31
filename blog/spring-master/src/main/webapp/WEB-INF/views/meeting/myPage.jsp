<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" scope="application" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>마이페이지</title>
</head>

<div class ="likes_list_box">
    <h3>[내가 좋아요한 게시글 리스트]</h3>
    <hr>
    <c:forEach var="item" items="${likesList}">
        <div>[게시글 제목] ${item.title}</div>
        <div>[게시글 내용] ${item.content}</div>

        <hr>
    </c:forEach>
</div>

</body>
</html>
