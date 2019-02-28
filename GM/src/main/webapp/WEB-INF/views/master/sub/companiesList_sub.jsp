<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	function sendMessage(){
		
		if(!document.messageform.select.value){
			alert('한명이상 선택해야 합니다.');
			return false;
		}
		var select = document.messageform.select.value;
		var url="K_sendingMessage?id="+select;
		window.open(url, "K_sendingMessage", "menubar=no, width=1000, height=800");
	}
</script>
<section>
	<article>
		<div class="content_header">
			<h2>사업장 목록</h2>
		</div>
		<div class="content">
			<div>
				<form action="companiesList" method="post">
					<div class="search-wrap">
						<div class="form-group">
							<span style="font-weight: bold; margin-left: 5px;">사업장 명 : </span>
							<span><input type="text" name="search" value="${search }"></span>
							<span><input type="submit" value="검색"></span>
						</div>
					</div>
				</form>
			</div>
			<div class="fleft w39p">
				<h3>검색</h3>
				<div class="table_head">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="150px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th>등록번호</th>
								<th>사업장명</th>
								<th>주소</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="150px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td onclick="load('adminList?company=${dto.company}')">${dto.c_number }</td>
									<td onclick="load('adminList?company=${dto.company}')" style="cursor: pointer;">
										${dto.c_name }
									</td>
									<td onclick="load('adminList?company=${dto.company}')">${dto.c_address }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="result" class="fright w60p" style="border: 0; position: relative; top: -10px;">
				
			</div>
		</div>
	</article>
</section>