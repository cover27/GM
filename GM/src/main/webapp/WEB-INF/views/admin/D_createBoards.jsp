<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
</head>
<body>
	<div class="content_result">
		<form action="<c:url value='/admin/D_CreateBoards_pro'/>" method="post" name="D_CreateBoards">
			<table>
				<!-- 
				<tr>
					<th> 그룹 번호</th>
					<td>
						<input class="input" type="text" name="groupId" maxlength="50" style="width:270px" placeholder="그룹번호를 입력하세요">
					</td>
				</tr>
		 		-->
				<tr>
					<th> 게시판명</th>
					<td>
						<input class="input" type="text" name="b_name" maxlength="50" style="width:270px" placeholder="게시판명을 입력해주세요">
					</td>
				</tr>		
		
				<tr>
					<th> 익명여부</th>
					<td>
						<input type="radio" name="anon" value="0"> 실명
						<input type="radio" name="anon" value="1"> 익명
					</td>
				</tr>
		
				<tr>
					<th colspan="2">
						<input type="submit" value="생성">
						<input  type="button" value="생성취소" onclick="location.reload()">				
					</th>
				</tr>		
			</table>
		</form>
	</div>
</body>
</html>