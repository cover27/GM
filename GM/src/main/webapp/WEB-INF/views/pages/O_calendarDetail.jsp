<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<link rel="stylesheet" href="${path}css/O_style.css" />
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>

<style>
body {
	background: #fff
}
</style>

<section>
	<article>
		<div class="content">
			<div class="create">
			<form action="<c:url value='/pages/O_calendarModify'/>" method="post">
				<input type="hidden" name="num" value="${vo.num}" /> 
					<c:if test="${num != 0}">
					<table>
						<colgroup>
							<col width="300px;" />
							<col width="*" />
						</colgroup>
						<tr>
							<!-- 기간은 그냥 수기로 수정 해줘야함.. DB에서 불러와서 변경하지 못했음. -->
							<th scope="row"><span>*</span>기간</th>
							<td>
								<div>
									<input type="text" name="begin" id="now_date" value="${vo.getBegin()}" required>
									<%-- <input type="datetime-local" name="begin" id="now_date" value="${vo.getBegin()}" required> --%>
										<span>~</span>
									<input type="text" name="end" id="now_date2" value="${vo.getEnd()}" min="${vo.getBegin()}" required>
									<%-- <input type="datetime-local" name="end" id="now_date2" value="${vo.getEnd()}" min="${vo.getBegin()}" required> --%>
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
									<input type="text" name="subject" title="제목" value="${vo.getSubject()}" required style="width:407px;">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">장소</th>
							<td>
								<input type="text" name="location" title="장소" value="${vo.getLocation()}" style="width: 100%;">
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
								<%-- <textarea name="content" style="width:100%; height:190px;">${vo.getContent()}</textarea> --%>
								<!-- text-editor를 쓰기 위함으로 class name은 ckeditor로 쓰여야 한다. -->
								<textarea class="ckeditor" id="formEditorData" title="formEditorData" name="content">${vo.getContent()}</textarea>
									<!-- text-editor를 쓰기 위함으로 위의 textarea의 class name이 아래 쓰인다. -->
									<script>
										CKEDITOR.replace('formEditorData');
									</script>
									<!-- <textarea name="content" placeholder="내용" style="width:100%; height:390px;"></textarea> -->
							</td>
						</tr>
							
					</table>
					<div class="w100p" style="background: #fff; height: 70px;">
						<!-- 일정등록 저장 footer -->
						<div style="margin: 20px 20px 0 0;" class="btnset fright">
							<input type="submit" value="수정">
							<input type="button" value="삭제" onclick="window.location='<c:url value="/pages/O_calendarDelete?num=${vo.num}"/>'">
							<input type="button" value="닫기" onclick="self.close();">
						</div>
					</div>
					</c:if>
				</form>
			</div>
		</div>
	</article>
</section>