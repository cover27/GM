<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	<article>
		<div class="content_header">
			<h2>내가 한 업무요청 조회</h2>
		</div>
		<div class="content">
			<div id="result" style="border: none;">
				<table style="border-top: 1px #c0c0c0 solid">
               		<c:forEach var="dto" items="${dtos}">
                		<tbody>
                			<tr>
                				<th>제목</th>
                				<td colspan="3" style="text-align: left; padding-left: 20px;">${dto.subject}</td>
                				<th>상태</th>
                				<td>${dto.state}</td>
                				<th>지시자</th>
                				<td>${dto.name}(${dto.r_name})</td>
                			</tr>
                			<tr>
                				<th>업무기한</th>
                				<td>${dto.begin}~${dto.end}</td>
                				<th>등록일</th>
                				<td>${dto.reg_date}</td>
                				<th>수정일</th>
                				<td>${dto.reg_date2}</td>
                				<th>담당자</th>
                				<td>${dto.b_name}</td>
                			</tr>
                			<tr>
                				<th>내용</th>
                				<td colspan="7" style="height: 230px;text-align: left; padding-left: 20px;vertical-align: top;">${dto.content}</td>
                			</tr>
                			<!-- <tr>
                				<th>첨부파일</th>
                				<td colspan="7"></td>
                			</tr>
                			<tr>
                				<th>관련업무</th>
                				<td colspan="3"></td>
                				<th>관련결재</th>
                				<td colspan="3"></td>
                			</tr> -->
                		</tbody>
               		</c:forEach>
	    		</table>
	    		<c:forEach var="dto2" items="${dtos2}">
    				<h3 class="mt50 mb10">처리 내역 : <span>${dto2.state}</span></h3>
    				<table style="border-top: 1px #c0c0c0 solid">
    					<tbody>
    						<tr>
    							<th>담당자</th>
    							<td>${dto2.b_name}</td>
    							<th>최종수정일</th>
    							<td>${dto2.reg_date}</td>
    							<th></th>
    							<td></td>
    						</tr>
    						<tr>
    							<th>내용</th>
    							<td colspan="5" style="height: 230px;text-align: left; padding-left: 20px;vertical-align: top;">${dto2.content}</td>
    						</tr>
    					</tbody>
    				</table>
	    		</c:forEach>
			</div>
		    <div class="btnset">
                <button type="button" onclick="window.location='<c:url value='/pages/W_updateTaskView?todonum=${todonum}&id=${id}'/>'">수정</button>
                <button type="button" onclick="window.location='<c:url value='/pages/W_updateTaskDeletePro?todonum=${todonum}&id=${id}'/>'">삭제</button>
                <button type="button" onclick="window.location='<c:url value='/pages/W_listPureOrderView'/>'">목록</button>
		    </div>
		</div>
		    
	</article>
</section>