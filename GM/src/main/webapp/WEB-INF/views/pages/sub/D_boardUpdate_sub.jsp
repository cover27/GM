<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<section>
	<article>
		<div class="content_header">
			<h2>게시글 수정</h2>
		</div>
		<div class="content">
			<form action="<c:url value='/pages/D_boardUpdatePro'/>" method="post" name="D_boardUpdatePro">
			<input type="hidden" name="boardnum" value="${boardnum}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="num" value="${num}">
			<div class="write_head">
					<ul>
						<li>
							<span><b><input type="text" name="subject" maxlength="50" style="width:100%;height: 48px;" placeholder="${vo.subject}" required autofocus></b></span>
						</li>
						<li>
							<span>${sessionScope.loginInfo.name}</span>
						</li>
					</ul>
				</div>
				<div class="write_body mt10" style="padding: 0;">
					<!-- text-editor를 쓰기 위함으로 class name은 ckeditor로 쓰여야 한다. -->
					<textarea class="ckeditor" id="formEditorData" title="formEditorData" name="content" placeholder="글내용을 입력하세요!!"></textarea>
					<!-- text-editor를 쓰기 위함으로 위의 textarea의 class name이 아래 쓰인다. -->
					<script>CKEDITOR.replace('formEditorData')</script>
					<!-- <input type="text" id="content" name="content" placeholder="${vo.content}"> --> 
				</div>
				<div style="margin-bottom:60px;padding-top: 20px;" class="btnset fright">
					<input class="inputButton" type="submit" value="작성">
					<input class="inputButton" type="reset" value="취소">
					<input class="inputButton" type="button" value="목록" onclick="window.location='<c:url value="/pages/D_boardList?pageNum=${pageNum}&num=${num}"/>'">
				</div>
			</form>
		</div>
	</article>
</section>