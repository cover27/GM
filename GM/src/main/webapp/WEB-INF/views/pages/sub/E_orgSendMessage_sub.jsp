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
}
</script>
<section>
	<article>
		<div class="content_header">
			<h2>쪽지 작성</h2>
		</div>
		<div class="content">
			<form action="<c:url value='/pages/S_orgSendMessagePro'/>" method="post" name="searchform">
				<table class="message_table">
					<colgroup>
						<col width="200px" />
						<col width="*" />
					</colgroup>
					<tr>
						<th>보내는 사람</th>
						<td style="text-align: left !important; padding-left: 5px !important;">
							<%=((MemberVO)request.getSession().getAttribute("loginInfo")).getName() %>
						</td>
					</tr>
					<tr>
						<th>받는 사람</th>
						<td>
							<table class="inner_tbl">
								<tr>
									<td style="text-align: left !important;padding: 0 !important;">
										<input type="text" class="searchId" id="Id" name="id" value="${vo.getId()}" style="width: 240px !important">
										<a href="#" onclick="searchId()" class="find_btn"><i class="fa fa-search fa-fw"></i></a>
									</td>
									<td>
										<span class="bold5px">이름 :</span><input type="text" class="searchName ml10" name="name" readonly placeholder="아이디를 조회하세요." style="width:240px !important;">
									</td>
								</tr>
							</table>
						</td>
					</tr>
			
					<tr>
						<th>제목</th>
						<td>
							<input class="input" type="text" name="subject" maxlength="50" style="width:270px" placeholder="제목을 입력하세요!!" required> 
						</td>
					</tr>
						
					<tr>
						<th>내용</th>
						<td>
							<textarea class="input" rows="10" cols="40" name="content" placeholder="쪽지의 내용을 입력하세요!!" word-break:break-all></textarea>
						</td>
					</tr>
				</table>	
				<div class="btnset" style="width: 120px; margin: 0 auto;">
					<input type="submit" value="작성">
					<input type="reset" value="취소">
				</div>
			</form>	
		</div>
	</article>
</section>