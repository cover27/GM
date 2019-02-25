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
		    <div class="content-view">
		    	<div class="form-block" style="margin-top:10px;">
		    		
		    		<table class="table">
		    			<colgroup>
                   			<col width="120px">
                   			<col width="*">
                   			<col width="120px">
                   			<col width="*">
                		</colgroup>
                		<tbody>
                			<tr>
                				<th scope="row">제목</th>
                				<td title="제목">제목</td>
                				<th scope="row">상태</th>
                				<td >상태값</td>
                			</tr>
                			<tr>
                				<th scope="row">지시자</th>
                				<td colspan="3">이름(직급명)</td>
                			</tr>
                			<tr>
                				<th scope="row">업무기한</th>
                				<td colspan="3">기한</td>
                			</tr>
                			<tr>
                				<th scope="row">등록일</th>
                				<td>날짜</td>
                				<th scope="row">수정일</th>
                				<td></td>
                			</tr>
                			<tr>
                				<th scope="row">담당자</th>
                				<td colspan="3">이름</td>
                			</tr>
                			<tr>
                				<th scope="row">내용</th>
                				<td colspan="3">내용</td>
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
		    		</table>
		    		<div class="inform-wrap rejectClass">
		    			<div class="statement">
		    				<h4>처리 내역</h4>
		    				<span>상태값</span>
		    			</div>
		    			<div class="form-block">
		    				<table class="table">
		    					<tbody>
		    						<tr>
		    							<th scope="row">담당자</th>
		    							<td>담당자명(직급명)</td>
		    							<th scope="row">최종수정일</th>
		    							<td></td>
		    						</tr>
		    						<tr>
		    							<th scope="row">내용</th>
		    							<td colspan="3"></td>
		    						</tr>
		    						<tr>
		    							<th scope="row">첨부파일</th>
		    							<td colspan="3"></td>
		    						</tr>
		    					</tbody>
		    				</table>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    
		    <div >
                <button type="button" class="btn btn-color7 br" onclick="">반려</button>
                <button type="button" class="btn btn-color7 br" onclick="">처리</button>
                <button type="button" class="btn btn-color7 br" onclick="window.history.back();">목록</button>
		    </div>
		    
		</div>
		    
	</article>
</section>