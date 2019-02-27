<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
table, tr, th, td{
	border:1px solid;
}
.btn-color7.br{
	border:1px solid #aaa;
}
</style>

<section>
	<article>
		<div class="content_header">
			<h2>수신 업무 요청 조회</h2>
		</div>
		
		
		<div class="content-wrap">
	    	<form action="<c:url value='/pages/W_readSubTodoSuccessPro'/>" name="appform" method="post">
	    	<input type="hidden" name="donum" value="${donum}">
	    	<input type="hidden" name="todonum" value="${todonum}">
	    	<input type="hidden" name="appcan" value="0">
		    <div class="content-view">
		    	<div class="form-block" style="margin-top:10px;">
		    		
		    		<table class="table">
		    			<colgroup>
                   			<col width="120px">
                   			<col width="*">
                   			<col width="120px">
                   			<col width="*">
                		</colgroup>
                		<c:forEach var="dto" items="${dtos}">
	                		<tbody>
	                			<tr>
	                				<th scope="row">제목</th>
	                				<td title="제목">${dto.subject}</td>
	                				<th scope="row">상태</th>
	                				<td >${dto.state}</td>
	                			</tr>
	                			<tr>
	                				<th scope="row">지시자</th>
	                				<td colspan="3">${dto.name}(${dto.r_name})</td>
	                			</tr>
	                			<tr>
	                				<th scope="row">업무기한</th>
	                				<td colspan="3">${dto.begin}~${dto.end}</td>
	                			</tr>
	                			<tr>
	                				<th scope="row">등록일</th>
	                				<td>${dto.reg_date}</td>
	                				<th scope="row">수정일</th>
	                				<td>${dto.reg_date2}</td>
	                			</tr>
	                			<tr>
	                				<th scope="row">담당자</th>
	                				<td colspan="3">${dto.b_name}</td>
	                			</tr>
	                			<tr>
	                				<th scope="row">내용</th>
	                				<td colspan="3">${dto.content}</td>
	                			</tr>
	                			<tr>
	                				<th scope="row">첨부파일</th>
	                				<td colspan="3"></td>
	                			</tr>
	                			<tr>
	                				<th scope="row">관련업무</th>
	                				<td colspan="3"></td>
	                			</tr>
	                			<tr>
	                				<th scope="row">관련결재</th>
	                				<td colspan="3"></td>
	                			</tr>
	                		</tbody>
	                	</c:forEach>
		    		</table>
		    		
		    		<br>
		    		<br>
		    		
		    		<div class="inform-wrap rejectClass">
			    		<c:forEach var="dto2" items="${dtos2}">
			    			<div class="statement">
			    				<h4 style="float:left;">처리 내역111111</h4>
			    				<span style="float:right;">${dto2.state}</span>
			    			</div>
			    			<div class="form-block">
			    				<table class="table">
			    					<tbody>
			    						<tr>
			    							<th scope="row">담당자</th>
			    							<td>${dto2.b_name}</td>
			    							<th scope="row">최종수정일</th>
			    							<td>${dto2.reg_date}</td>
			    						</tr>
			    						<tr>
			    							<th scope="row">내용</th>
			    							<td colspan="3">
			    								<textarea name="content" id="content" style="width: 98%; height: 200px; margin:10px;">${dto2.content}</textarea>
			    							</td>
			    						</tr>
			    						<tr>
			    							<th scope="row">첨부파일</th>
			    							<td colspan="3"></td>
			    						</tr>
			    					</tbody>
			    				</table>
			    			</div>
		    			</c:forEach>
		    		</div>
		    	</div>
		    </div>
		    
		    <div >
                <button type="button" class="btn btn-color7 br" onclick="document.appform.appcan.value=1; document.appform.submit();">업무 반려</button>
                <button type="submit" class="btn btn-color7 br">업무 처리</button>
                <button type="button" class="btn btn-color7 br" onclick="window.location='<c:url value='/pages/W_listTodoView'/>'">목록</button>
		    </div>
		    
		   </form>
		    
		</div>
		    
	</article>
</section>