<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
table, tr, th, td{
	border:1px solid;
}
th{
	width:120px;
}
</style>

<section>
	<article>
		<div class="content_header">
			<h2>일정 등록</h2>
		</div>
		
		<!-- 일정등록 내용 -->
		<div class="content_body" style="margin-top:10px;">
			<form action="<c:url value='/pages/O_calendarPro'/>" method="post">
			
				<input type="hidden" name="num" value="${num}">
				<input type="hidden" name="del" value="0">
				<input type="hidden" name="equipnum" value="0">
				<input type="hidden" name="teamSchedule" value="0">
				<input type="hidden" name="groupId" value="0">
				<input type="hidden" name="id"	value="${id}">
			
				<div class="content-write">
					<div class="form-block">
						<table>
							<tbody>
								<tr>
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
											<select name="scheduleKind">
												<option value="출장">출장</option>
												<option value="휴가">휴가</option>
											</select>
											<input type="text" name="subject" title="제목" placeholder="제목" required>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">장소</th>
									<td>
										<input type="text" name="location" title="장소"	placeholder="장소">
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
								<tr style="height:400px;">
									<th scope="row" style="word-break:break-all;">내용</th>
									<td>
										<textarea name="content" placeholder="내용" style="width:100%; height:390px;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						
						<!-- 
						<div class="fileup">
							<h3><span>파일 업로드</span></h3>
							<input type="file" name="fileLoad" value="">
						</div> -->
					</div>
				</div>
				
				<!-- 일정등록 저장 footer -->
				<div class="content-footer" style="float:right; margin-top:10px;">
					<input type="submit" value="저장">
					<input type="button" value="취소" onclick="window.history.back();">
				</div>
			</form>
		</div>
		
		
	</article>
</section>