<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!-- text-editor를 쓰기 위한 script 파일 설정으로 아래 textarea가 있어야 한다. -->
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<section>
	<article>
		<div class="content_header">
			<h2>공지사항 수정</h2>
		</div>
		<div class="content">
			<form action="<c:url value='/master/K_updateNotice_pro'/>" method="post" name="K_noticeWriteForm">
				<input type="hidden" name="boardnum" value="${boardnum }">
				<div class="write_head">
					<ul>
						<li>
							<span><b><input type="text" name="subject" maxlength="50" style="width:100%;height: 48px;" 
									value="${vo.subject }" placeholder="제목을 입력하세요!!" required autofocus></b></span>
						</li>
						<li>
							<span>${sessionScope.loginInfo.name}</span>
						</li>
					</ul>
				</div>
				<div class="border_t1" style="border-top:none !important;">
					<div id="editorDiv">
						<div id="content1" style="width:100%; height:550px;">
							<!-- text-editor를 쓰기 위함으로 class name은 ckeditor로 쓰여야 한다. -->
							<textarea class="ckeditor" id="formEditorData" title="formEditorData" name="formEditorData">${vo.content }</textarea>
							<!-- text-editor를 쓰기 위함으로 위의 textarea의 class name이 아래 쓰인다. -->
							<script>CKEDITOR.replace('formEditorData')</script>
							<!-- <input type="text" id="content" name="content"> --> 
						</div>
					</div>
				</div>
				<div style="margin-bottom:60px;padding-top: 20px;" class="btnset fright">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
					<input type="button" value="이전으로" onclick="window.history.back();">
				</div>
			</form>	
		</div>
	</article>
</section>