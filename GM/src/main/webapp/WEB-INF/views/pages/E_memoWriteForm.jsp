<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section>
	<article>
		<div class="content_header">
			<h2>모든 메모</h2>
		</div>

		<form action="/E_memoWritePro" method="post" name="writeform" onsubmit="return writeCheck();">
			
			<!-- BoardServiceImpl의 writeForm 6번에서 넘긴 값을 hidden으로 받음 
			<input type="hidden" name="num" value="${num}">
			<input type="hidden" name="ref" value="${ref}">
			<input type="hidden" name="ref_step" value="${ref_step}">
			<input type="hidden" name="ref_level" value="${ref_level}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			-->	
			<table align="center">
				<tr>
					<th>작성자</th>
					<td>
						<input class="input" type="text" name="writer" maxlength="20" autofocus required placeholder="작성자를 입력하세요">
					</td>
				</tr>
				<!-- 
				<tr>
					<th>비밀번호</th>
					<td>
						<input class="input" type="password" name="pwd" maxlength="10" placeholder="비밀번호를 입력하세요" required>
					</td>
				</tr>
				 -->
				<tr>
					<th> 메모 제목 </th>
					<td>
						<input class="input" type="text" name="subject" maxlength="50" style="width:270px" placeholder="글제목을 입력하세요" required>
					</td>
				</tr>
				
				<tr>
					<th style="word-break:break-all"> 메모내용 </th>
					<td>
						<textarea class="input" rows="10" cols="40" name="content" style="width:270px" placeholder="글내용을 입력하세요"></textarea>
					</td>
				</tr>
				
				<tr>
					<th colspan="2">
						<input class="inputButton" type="submit" value="작성">
						<input class="inputButton" type="reset" value="취소">
						<input class="inputButton" type="button" value="목록" onclick="window.location='E_memoList?pageNum=${pageNum}'">
					</th>
				</tr>
			</table>
		
		</form>


	</article>
</section>