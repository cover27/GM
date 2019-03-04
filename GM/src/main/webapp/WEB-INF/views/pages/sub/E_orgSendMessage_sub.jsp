<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import="com.spring.gm.vo.MemberVO" %>  
</script>
<section>
	<article>
		<div class="content_header">
			<h2>쪽지 작성</h2>
		</div>
		<div class="content">
			<form action="<c:url value='/pages/S_sendMessagePro'/>" method="post" name="searchform">
				<table class="message_table">
					<colgroup>
						<col width="200px" />
						<col width="*" />
					</colgroup>
					<tr>
						<th>보내는 사람</th>
						<td style="text-align: left !important; padding-left: 5px !important;">
							<%= ((MemberVO)request.getSession().getAttribute("loginInfo")).getId() %>
						</td>				
					</tr>
					<tr>
						<th>받는 사람</th>
						<td>
							<table class="inner_tbl">
								<tr>
									<td>
										
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