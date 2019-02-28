<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ page import="com.spring.gm.vo.MemberVO" %>  
<%@ page import="com.spring.gm.vo.BoardsVO" %>
<!-- text-editor를 쓰기 위한 script 파일 설정으로 아래 textarea가 있어야 한다. -->
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<style>
	#cke_1_contents {
		height: 450px !important;
	}
</style>
<section>
	<article>
		<div class="content_header">
			<h2>게시글 작성</h2>
		</div>
		<div class="content">
			<form action="<c:url value='/master/K_noticeWritePro'/>" method="post" name="K_noticeWriteForm">
				<div class="write_head">
					<ul>
						<li>
							<span><b><input type="text" name="subject" maxlength="50" style="width:100%;height: 48px;" placeholder="제목을 입력하세요!!" required autofocus></b></span>
						</li>
						<li style="margin: 20px 0;font-size: 18px;">
							<span>작성자 : </span>
							<span><b>${sessionScope.loginInfo.name}</b></span>
						</li>
					</ul>
				</div>
				<div class="border_t1" style="border-top:none !important;">
					<div id="editorDiv">
						<div id="content1" style="width:100%; height:550px;">
							<!-- text-editor를 쓰기 위함으로 class name은 ckeditor로 쓰여야 한다. -->
							<textarea class="ckeditor" id="formEditorData" title="formEditorData" name="formEditorData"></textarea>
							<!-- text-editor를 쓰기 위함으로 위의 textarea의 class name이 아래 쓰인다. -->
							<script>CKEDITOR.replace('formEditorData')</script>
							<!-- <input type="text" id="content" name="content"> --> 
						</div>
					</div>
				</div>
				<div style="margin-bottom:60px;padding-top: 20px;" class="btnset fright">
					<input type="submit" value="작성">
					<input type="reset" value="취소">
					<input type="button" value="목록" onclick="window.location=<c:url value='/pages/K_noticeBoard?'/>">
				</div>
			</form>	
		</div>
	</article>
</section>