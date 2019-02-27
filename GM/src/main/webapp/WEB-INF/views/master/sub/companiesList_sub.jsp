<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/setting.jsp"%> --%>
<script type="text/javascript">

	function load(url) {
		//요청 : url 즉 news1.jsp, news2.jsp, news3.jsp
		//sendRequest(callback, url, method, params){}
		sendRequest(loadNews_callback, url, "post"); //url로 이동 -> 콜백함수로 리턴
	}
	
	function loadNews_callback() {
		var result = document.getElementById("result");
		if (httpRequest.readyState == 4) { // 4 : completed : 전체 데이터가 취득 완료된 상태
			if (httpRequest.status == 200) { // 200 : 정상종료
				//result.innerHTML = "정상종료";
				result.innerHTML = httpRequest.responseText;
			} else {
				result.innerHTML = "에러발생";
			}
		} else {
			result.innerHTML = "상태 :" + httpRequest.readyStatus;
		}
	}
</script>
<section>
	<article>
		<div class="content_header">
			<h2>사업장 목록</h2>
		</div>
		<br><hr><br>		
		<div>
			<form action="companiesList" method="post">
				<h3>검색</h3><br>
				사업장 명&nbsp;:&nbsp;<input type="text" name="search" value="${search }">
				<input type="submit" value="검색">
			</form>
		</div>
		<div class="fleft w50p">
			<table>
				<tr>
					<th>등록번호</th>
					<th>사업장명</th>
					<th>주소</th>
				</tr>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.c_number }</td>
						<td onclick="load('adminList?company=${dto.company}')" style="cursor: pointer;">
							${dto.c_name }
						</td>
						<td>${dto.c_address }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="result" class="fright w50p">
			
		</div>
	</article>
</section>