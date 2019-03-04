<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section>
	<article>
		<div class="content_header">
			<h2>부서 목록</h2>
		</div>
			<table style="width:1500px; align=center; border:2px;">
				<tr>
					<td style="width:10%">그룹 번호</td>
					<td style="width:10%">사업장 번호</td>
					<td style="width:10%">그룹 이름</td>
					<td style="width:10%">그룹등급</td>
				</tr>		
			<c:forEach var="dtos" items="com_dtos">
				<tr>
					<td style="width:25%">${c_dtos.groupId}</td>
					<td style="width:25%">${c_dtos.company}</td>
					<td style="width:25%">${c_dtos.g_name}</td>
					<td style="width:25%">${c_dtos.group_rank}</td>
				</tr>
			</c:forEach>
		</table>
	</article>
</section>