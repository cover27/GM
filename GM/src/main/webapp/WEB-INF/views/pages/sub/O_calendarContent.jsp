<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
tr, th, td {
	border: 1px solid;
}
</style>

<section>
	<article>
		<div class="content_header">
			<h2>일정 목록 보기의 화면</h2>
		</div>

		<div class="content_body">
			<!-- form은 기간 - 내용 검색까지 -->
			<form>
				<div class="daterang" style="float: left">
					<span>기간</span> <input type="date" title="날짜" name="startDate"
						class="startDate" id="now_date">
					<script>
						document.getElementById('now_date').valueAsDate = new Date();
					</script>
					<span>~</span> <input type="date" title="날짜" name="endDate"
						class="endDate">

					<div class="table-search" style="float: right; margin-right: 50px;">
						<select title="검색조건" name="searchFields">
							<option value="title">제목</option>
							<option value="contents">내용</option>
						</select>

						<div class="input-search" style="float: right">
							<input type="text" title="inputbox" name="keyword"
								placeholder="키워드를 입력하세요."> <input type="button"
								value="검색">
						</div>
					</div>
				</div>
			</form>

			<!-- 월간,주간,일간, 목록보기 툴바 -->
			<div class="fc-right" style="float: right">
				<div class="fc-button-group">
					<button type="button" class="fc-corner-left">월간</button>
					<button type="button" class="fc-corner">주간</button>
					<button type="button" class="fc-corner">일간</button>
					<button type="button" class="fc-corner-right">목록보기</button>
				</div>
			</div>

			<!-- 목록보기의 list -->
			<div class="fc-list">
				<div class="content-list">
					<table style="border: 1px solid;">
						<thead>
							<tr>
								<th scope="col" style="width: 25%;">시간</th>
								<th scope="col" style="width: 10%;">범주</th>
								<th scope="col" style="width: 50%;">제목</th>
								<th scope="col" style="width: 15%;">참여자</th>
							</tr>
						</thead>
						<tbody>
							<c:if test = "${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td>${dto.num}</td>
										<td></td>
										<td></td>
										<td>명</td>
									</tr>
								</c:forEach>
							</c:if>
							

							<!-- 게시글이 없으면 -->
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="6" align="center">게시글이 없습니다. 글을 작성해주세요!!</td>
								</tr>
							</c:if>
						</tbody>

					</table>

					<table>
						<tr>
							<th align="center">
								<!-- 게시글이 있으면 -->
								<script>console.log('${cnt}');</script>
								<c:if test="${cnt > 0}">
									<script>console.log('${cnt}');</script>
									<!-- 처음[◀◀] / 이전블록[◀]  -->
									<script>console.log('${startPage}');</script>
									<script>console.log('${pageBlock}');</script>

									<c:if test="${startPage > pageBlock}">
										<a href="O_calendar">[◀◀]</a>
										<a href="O_calendar?pageNum=${endPage - pageBlock}">[◀]</a>
									</c:if>

									<!-- 중간에 들어갈 페이지 -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i==currentPage}">
											<span><b>[${i}]</b></span>
										</c:if>
										<c:if test="${i!=currentPage}">
											<a href="O_calendar?pageNum=${i}">[${i}]</a>
										</c:if>
									</c:forEach>

									<!-- 다음[▶] / 마지막[▶▶]  -->
									<c:if test="${pageCount > endPage}">
										<a href="O_calendar?pageNum=${startPage + pageBlock}">[▶]</a>
										<a href="O_calendar?pageNum=${pageCount}">[▶▶]</a>
									</c:if>
								</c:if>
							</th>
						</tr>
					</table>
				</div>
			</div>





		</div>

	</article>
</section>