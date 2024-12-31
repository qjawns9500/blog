<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로컬환경에서 웹페이지 한글 깨짐현상 발생해서 추가 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

 <c:set var="contextPath" scope="application" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>해시태그 랭킹</title>
    <h1>해시태그 랭킹 페이지</h1>
    <table>
        <thead>
        <tr>
            <th>누적순위</th>
            <th>해시태그</th>
            <th>사용 횟수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="totalTags" items="${totalRanking}" varStatus="loop" >
            <tr>
                <td>${loop.index+1}</td>
                <td>${totalTags.tagContent}</td>
                <td>${totalTags.totalCount}</td>
            </tr>
        </c:forEach>


        </tbody>
    </table>

    <table>
        <thead>
        <tr>
            <th>주간순위</th>
            <th>해시태그</th>
            <th>사용 횟수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="weeklyTags" items="${weeklyRankList}" varStatus="loop" >
            <tr>
                <td>${loop.index+1}</td>
                <td>${weeklyTags.tagContent}</td>
                <td>${weeklyTags.totalCount}</td>
            </tr>
        </c:forEach>


        </tbody>
    </table>
</head>
<body>

</body>
<style>
    table {
        width: 50%;
        border-collapse: collapse;
        margin: 20px auto;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</html>
