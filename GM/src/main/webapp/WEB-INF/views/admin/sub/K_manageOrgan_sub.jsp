<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	
	function updateDepart(){
		if(!document.departform.check.value){
			alert('부서를 선택해주세요.');
			document.departform.check.focus();
			return false;
		}
		
		var url="K_updateDepart?depart="+ document.departform.check.value;
		window.open(url, "confirm", "menubar=no, width=300, height=200");
	}
	
	function load(url) {
		//요청 : url 즉 news1.jsp, news2.jsp, news3.jsp
		//sendRequest(callback, url, method, params){}
		sendRequest(loadNews_callback, url, "post"); //url로 이동 -> 콜백함수로 리턴
	}
	/*
	 콜백함수
	 -서버로부터 응답이 오면 동작할 함수(시스템이 자동으로 호출한다.)
	 -콜백함수명은 sendRequest(콜백함수명)과 일치해야 한다.
	 -loadNews_callback : 콜백함수, result = 출력위치
	 */
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
			<h2>사용자 조직도 관리</h2>
		</div>
		<br>
		<div class="fleft w30p">
			<h3>부서 목록</h3>
			<hr>
			<form action="K_createDepart" method="post" name="departform">
				<table border="1">
					<tr>
						<td onclick="load('K_openOrgan?depart=0')" style="cursor: pointer;">${companyName }</td>
					</tr>
					<c:forEach var="depart" items="${groupsList }">
						<tr>
							<td onclick="load('K_openOrgan?depart=${depart.groupId}')" style="cursor: pointer;">
								<input type="radio" name="check" value="${depart.groupId}"> &nbsp;&nbsp;${depart.g_name }
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td>
							<input type="text" name="departName" placeholder="부서이름을 입력하세요.">
							<input type="submit" value="부서 추가">
							<input type="button" value="부서 수정" onclick="updateDepart();">
							<input type="button" value="부서 삭제" onclick="window.location='';">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div id="result" class="fright w70p">
			
		</div>
		
	</article>
</section>