<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<style>
	.cke_top, #cke_1_bottom {
		display: none;
	}
	
	#cke_1_contents {
		height: 600px !important;
	}
	
	.cke_chrome {
		border: none;
		border-bottom: 1px #c0c0c0 solid;
	}
</style>
<section>
    <article>
        <div class="content_header">
            <h2>공지사항 상세</h2>
        </div>
        <div class="content">
	        <div id="result">
		        <table>
		        	<tr>
		        		<th>제목</th>
		        		<td colspan="3" style="text-align: left; padding-left: 30px;">${vo.subject }</td>
		        	</tr>
		        	<tr>
		        		<th>조회수</th>
		        		<td>${vo.readcnt }</td>
		        		<th>작성일</th>
		        		<td>${vo.reg_date }</td>
		        	</tr>
		        </table>
		        <div class="border_t1" style="border-top:none !important;">
					<div id="editorDiv">
						<div id="content1">
							<!-- text-editor를 쓰기 위함으로 class name은 ckeditor로 쓰여야 한다. -->
							<textarea class="ckeditor" id="formEditorData" title="formEditorData" name="formEditorData" readonly>${vo.content }</textarea>
							<!-- text-editor를 쓰기 위함으로 위의 textarea의 class name이 아래 쓰인다. -->
							<script>CKEDITOR.replace('formEditorData')</script>
							<!-- <input type="text" id="content" name="content"> --> 
						</div>
					</div>
				</div>
				<div class="btnset mt20">
					<c:if test="${sys_rank == 9 }">
						<input type="button" value="수정" onclick="window.location='<c:url value="/master/K_updateNotice?num=${vo.boardnum }"/>'">
						<input type="button" value="삭제" onclick="window.location='<c:url value="/master/K_deleteNotice?num=${vo.boardnum }"/>'">
					</c:if>
					<input type="button" value="목록으로" onclick="window.history.back();">
				</div>
	        </div>
        </div>
    </article>
</section>
