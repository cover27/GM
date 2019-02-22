<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import="com.spring.gm.vo.MemberVO" %>  
<script type="text/javascript">
function searchId() {
	var id = $('.searchId').val();
	var url = "J_searchId_sub?id=" + id;
	window.open(url, "J_searchId", "menubar=no, width=700, height=560");
}

function back(id, name) {
	opener.document.searchform.id.value = id;
	opener.document.searchform.name.value = name;
	self.close();
}ss
</script>
<section>
	<article>
		<div class="content_header">
			<h2>게시글 작성</h2>
		</div>
	<form action="<c:url value='/pages/S_sendMessagePro'/>" method="post" name="searchform">
	<table align="center">
		<tr>
			<th> 보네는 사람 </th>
			<td>
				<%=((MemberVO)request.getSession().getAttribute("loginInfo")).getId() %>
			</td>				
		</tr>
		
		<tr>
				<th> 받는 사람 </th>
				<td>
					<span><input type="text" class="searchId" id="id" name="id" value="${name}"></span>
					<span><button onclick="searchId()" class="find_btn"><i class="fa fa-search fa-fw"></i></button></span>
					<span class="bold5px ml50">이름 : </span>
					<span><input type="text" class="searchName" name="name" readonly placeholder="아이디를 조회하세요." style="background: #f3f3f3;"></span>
				<td>
		</tr>

		<tr>
			<th> 제목 </th>
			<td>
				<input class="input" type="text" name="subject" maxlength="50" style="width:270px" placeholder="제목을 입력하세요!!" required> 
			</td>
		</tr>
			
		<tr>
			<th> 내용 </th>
			<td>
				<textarea class="input" rows="10" cols="40" name="content" style="width:270px" placeholder="글내용을 입력하세요!!" word-break:break-all></textarea>
			</td>
		</tr>
			
		<tr>
			<th colspan="2">
				<input class="inputButton" type="submit" value="작성">
				<input class="inputButton" type="reset" value="취소">
			</th>
		</tr>
	</table>	
	</form>		
	</article>
</section>