<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<section>
	<article>
		<div class="content_header">
			<h2>일정 등록</h2>
		</div>
		
		<!-- 일정등록 내용 -->
		<div class="content">
			<div class="create">
				<form action="<c:url value='/pages/O_calendarPro'/>" method="post">
					<input type="hidden" name="num" value="${num}">
					<input type="hidden" name="del" value="0">
					<input type="hidden" name="equipnum" value="0">
					<input type="hidden" name="teamSchedule" value="0">
					<input type="hidden" name="groupId" value="0">
					<input type="hidden" name="id"	value="${id}">
					<table>
						<colgroup>
							<col width="300px;" />
							<col width="*" />
						</colgroup>
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
									<input type="text" name="subject" title="제목" placeholder="제목" required style="width: 92.7%;">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">장소</th>
							<td>
								<input type="text" name="location" title="장소"	placeholder="장소" style="width: 100%;">
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
						<tr>
							<th scope="row" style="word-break:break-all;">내용</th>
							<td>
								<!-- text-editor를 쓰기 위함으로 class name은 ckeditor로 쓰여야 한다. -->
								<textarea class="ckeditor" id="formEditorData" title="formEditorData" name="content" placeholder="글내용을 입력하세요!!"></textarea>
								<!-- text-editor를 쓰기 위함으로 위의 textarea의 class name이 아래 쓰인다. -->
								<script>CKEDITOR.replace('formEditorData')</script>
								<!-- <textarea name="content" placeholder="내용" style="width:100%; height:390px;"></textarea> -->
							</td>
						</tr>
					</table>
					<div style="margin-top: 20px;" class="btnset fright">
						<input type="submit" value="저장">
						<input type="button" value="취소" onclick="window.history.back();">
					</div>
					</div>
				</form>
			</div>
		</div>
		
		
	</article>
</section>