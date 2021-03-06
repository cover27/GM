<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="/gm/resources/" />
<c:set var="root" value="/gm/" />
<c:set var="title" value="3팀 그룹웨어" />

<link rel="stylesheet" href="${path}css/common.css" />
<link rel="stylesheet" href="${path}css/header.css" />
<link rel="stylesheet" href="${path}css/footer.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script src="${path}js/jquery-3.3.1.min.js"></script>
<script src="${path}js/common.js"></script>

<!-- 현재날짜 생성 - today -->
<jsp:useBean id="nowDate" class="java.util.Date"/>
<fmt:formatDate value="${nowDate}" pattern="yyyy.MM.dd" var="today"/>