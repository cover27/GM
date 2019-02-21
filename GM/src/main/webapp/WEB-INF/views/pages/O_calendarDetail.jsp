<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>

<style>
table, tr, th, td{
	border:1px solid;
}

</style>

<section>
	<article>
		<div class="content_header">
			<h2><center>일정 보기</center></h2>
		</div>
		
		<!-- 일정보기 내용 -->
		<div class="content_body">
			<form action="<c:url value='/pages/O_calendarModify'/>" method="post">
			<input type="hidden" name="num" value="${vo.num}" /> 
			<c:if test="${num != 0}">
				<div class="content-write">
					<div class="form-block">
						<table style="width:100%">
							<tbody>
							
								<tr>
											<!-- 기간은 그냥 수기로 수정 해줘야함.. DB에서 불러와서 변경하지 못했음. -->
											<!-- 단점 : datetime-local로 써서 시간이 맞지 않게 나옴... -->
									<th scope="row"><span>*</span>기간</th>
									<td>
										<div>
											<input type="datetime-local" name="begin" id="now_date" required>
											<script>
												document.getElementById('now_date').value = new Date().toISOString().slice(0,  16);
											</script>
												<span>~</span>
											<input type="datetime-local" name="end" id="now_date2" required>
											<script>
												document.getElementById('now_date2').value = new Date().toISOString().slice(0,  16);
											</script>
											<!-- <span>
												<label><input type="radio" name="radiosel">회사 일정</label>
												<label><input type="radio" name="radiosel">부서일정</label>
												<label><input type="radio" name="radiosel" checked>비공개</label>
											</span> -->
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>*</span>제목</th>
									<td>
										<div class="block-form">
											<input type="text" value="저장된 일정 :${vo.getScheduleKind()}" readonly>
											<select name="scheduleKind">
												<option value="출장">출장</option>
												<option value="휴가">휴가</option>
											</select>
											<input type="text" name="subject" title="제목" value="${vo.getSubject()}" required>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">장소</th>
									<td>
										<input type="text" name="location" title="장소" value="${vo.getLocation()}">
									</td>
								</tr>
								<!-- <tr>
									<th scope="row">회의실</th>
									<td>
										<input type="button" name="btnConferneceRoom" value="회의실 예약">
									</td>
								</tr>
								<tr>
									<th scope="row">공용설비</th>
									<td>
										<input type="button" name="divFacility" value="공용설비 예약">
									</td>
								</tr>
								<tr>
									<th scope="row">참여자</th>
									<td>
										<input type="text" name="selectUser" placeholder="사용자">
										<input type="button" name="searchUser" value="검색">
									</td>
								</tr> -->
								<tr style="height:200px;">
									<th scope="row" style="word-break:break-all;">내용</th>
									<td>
										<textarea name="content" style="width:100%; height:190px;">${vo.getContent()}</textarea>
									</td>
								</tr>
								
							</tbody>
						</table>
						
					</div>
				</div>
				
				<!-- 일정등록 저장 footer -->
				<div class="content-footer" style="float:right; margin-top:10px;">
					<input type="submit" value="수정">
					<input type="button" value="삭제" onclick="window.location='<c:url value="/pages/O_calendarDelete?num=${vo.num}"/>'">
					<input type="button" value="닫기" onclick="self.close();">
				</div>
				</c:if>
			</form>
		</div>
		
		
	</article>
</section>