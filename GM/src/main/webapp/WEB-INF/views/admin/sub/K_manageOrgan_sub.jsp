<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	
	function updateLeader(){
		if(!document.departform.check.value){
			alert('부서를 선택해주세요.');
			document.departform.check.focus();
			return false;
		}
		
		var url="K_updateDepartLeader?depart="+ document.departform.check.value;
		window.open(url, "confirm", "menubar=no, width=600, height=300");
	}
	
	function updateDepart(){
		if(!document.departform.check.value){
			alert('부서를 선택해주세요.');
			document.departform.check.focus();
			return false;
		}
		
		var url="K_updateDepart?depart="+ document.departform.check.value;
		window.open(url, "confirm", "menubar=no, width=500, height=300");
	}
	
	function deleteDepart(){
		if(!document.departform.check.value){
			alert('부서를 선택해주세요.');
			document.departform.check.focus();
			return false;
		}
		
		window.location ="K_deleteDepartName?depart="+ document.departform.check.value;
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
		<div class="content">
			<div class="fleft w28p">
				<h3>부서 목록</h3>
				<form action="K_createDepart" method="post" name="departform">
					<div class="table_head">
						<table>
							<thead>
								<tr>
									<th onclick="load('K_openOrgan?depart=0')">${companyName }</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table_body">
						<table>
							<tbody>
								<c:forEach var="depart" items="${groupsList }">
									<tr>
										<td onclick="load('K_openOrgan?depart=${depart.groupId}')" style="height: 48px; text-align: left; padding: 0 170px;">
											<input type="radio" name="check" value="${depart.groupId}" id="${depart.groupId}" style="position: relative; top: 3px;">
											<label for="${depart.groupId}"><span style="margin-left: 5px;">${depart.g_name }</span></label>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="organ_btnset">
							<ul>
								<li>
									<input type="text" name="departName" placeholder="부서이름을 입력하세요.">
									<input type="submit" value="부서 추가">
								</li>
								<li>
									<input type="button" value="부서 수정" onclick="updateDepart();">
									<input type="button" value="부서 삭제" onclick="deleteDepart();">
									<input type="button" value="부서장 지정" onclick="updateLeader();">
								</li>
							</ul>
						</div>
					</div>
				</form>
			</div>
			<div id="result" class="fright w70p" style="border-top: 0; border-bottom: 0; margin: 0;">
				<h3>사용자 정보</h3>
				<div class="table_head">
					<table class="result_table">
						<colgroup>
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th>이름</th>
								<th>부서명</th>
								<th>직급명</th>
								<th>전화번호</th>
								<th>이메일</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body">
					<table>
						<tbody>
							<tr>
								<td colspan="5">부서정보를 확인하려면 좌측의 부서번호를 클릭해 주세요.</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</article>
</section>