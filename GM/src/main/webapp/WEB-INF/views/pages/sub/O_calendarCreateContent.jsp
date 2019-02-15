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
			<form action="">
				<div class="content-write">
					<div class="form-block">
						<table>
							<tbody>
								<tr>
									<th scope="row"><span>*</span>기간</th>
									<td>
										<div>
											<input type="datetime-local" name="startMonth" value="조회" id="now_date">
											<script>
												document.getElementById('now_date').value = new Date().toISOString().slice(0,  16);
											</script>
												<span>~</span>
											<input type="datetime-local" name="endMonth" value="조회" id="now_date2">
											<script>
												document.getElementById('now_date2').value = new Date().toISOString().slice(0,  16);
											</script>
											<span>
												<label><input type="radio" name="radiosel">회사 일정</label>
												<label><input type="radio" name="radiosel">부서일정</label>
												<label><input type="radio" name="radiosel" checked>비공개</label>
											</span>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>*</span>제목</th>
									<td>
										<div class="block-form">
											<select>
												<option>출장</option>
												<option>휴가</option>
											</select>
											<input type="text" name="title" title="제목" placeholder="제목">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">장소</th>
									<td>
										<input type="text" name="place" title="장소"	placeholder="장소">
									</td>
								</tr>
								<tr>
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
								</tr>
								<tr style="height:400px;">
									<th scope="row" style="word-break:break-all;">내용</th>
									<td>
										<textarea name="content" placeholder="내용" style="width:100%; height:390px;"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						
						<!-- 파일 업로드 -->
						<div class="fileup">
							<h3><span>파일 업로드</span></h3>
							<input type="file" name="fileLoad" value="">
						</div>
					</div>
				</div>
				
				<!-- 일정등록 저장 footer -->
				<div class="content-footer" style="float:right;">
					<input type="button" value="저장">
					<input type="button" value="취소" onclick="window.history.back();">
				</div>
			</form>
		</div>
		
		
	</article>
</section>