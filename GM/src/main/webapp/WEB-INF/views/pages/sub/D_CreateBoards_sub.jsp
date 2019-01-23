<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section>
	<article>
		<div class="content_header">
			<h2>게시판 생성</h2>
		</div>
	<form action="D_CreateBoards_pro" method="post" name="D_CreateBoards">
			<div class="content">
				<table>
					<tr>
						<th> 그룹 번호</th>
							<td>
								<input class="input" type="text" name="groupId" maxlength="50" style="width:270px" placeholder="그룹번호를 입력하세요">
							</td>
					</tr>
			
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
							<input class="inputButton" type="submit" value="생성">
							<input class="inputButton" type="button" value="생성취소"
									onclick="window.history.back()">				
						</th>
					</tr>		
				</table>										
			</div>
		</form>
	</article>
</section>