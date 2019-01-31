<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
/* 
function board_go(num){
	var url = "/pages/D_boardList?num="+num;
	alert(url);
	sendRequest(board_go_callback, url, "post"); // url로 이동 -> 콜백함수로 리턴
}

function board_go_callback(){
	var result = document.getElementById("result");
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			// result.innerHTML = "정상종료";
			result.innerHTML = httpRequest.responseText;
		} else {
			result.innerHTML = "에러 발생";
		}
	} else {
		result.innerHTML = "상태 : " + httpRequest.readyState;
	}
}
 */
 
 function board_go(num) {
	alert(num);
	$.ajax({
		type:"POST",
		data:"num="+num,
		url:"${pageContext.request.contextPath}/pages/D_boardListSetting",
		success:function(result){
			alert("성공");
			$("#result").html(result);
		},
		error:function(){
			alert("실패");
		}
	 });
 }
 
</script>
<section>
    <article>
        <div class="content_header">
            <h2>게시판 관리</h2>
        </div>
        <div class="content">
        	<div class="w30p fleft boards_left_wrap">
        		<div class="boards_trees">
        			<ul>
        				<c:forEach var="b_dtos" items="${b_dtos}">
        					<li>
        						<a href="#" onclick="board_go('${b_dtos.num}')">${b_dtos.b_name}</a>
        						<%-- <a href="<c:url value='/pages/D_boardList?num=${b_dtos.num}'/>" class="board_go">${b_dtos.b_name}</a> --%>
        					</li>
        				</c:forEach>
        			</ul>
        		</div>
        		<div class="paging">
					<c:if test="${cnt > 0}">
					    <c:if test="${startPage > pageBlock}">
					        <a href="<c:url value='/pages/D_boardsList'/>">[◀◀]</a>
					        <a href="<c:url value='/pages/D_boardsList?pageNum=${startPage - pageBlock}'/>">[◀]</a>
					    </c:if>
					
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        <c:if test="${i == currentPage}">
					            <span><b>[${i}]</b></span>
					        </c:if>
					
					        <c:if test="${i != currentPage}">
					            <a href="<c:url value='/pages/D_boardsList?pageNum=${i}'/>">[${i}]</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${pageCount > endPage}">
					        <a href="<c:url value='/pages/D_boardsList?pageNum=${startPage + pageBlock}'/>">[▶]</a>
					        <a href="<c:url value='/pages/D_boardsList?pageNum=${pageCount}'/>">[▶▶]</a>
					    </c:if>
					</c:if>
	            </div>
        	</div>
        	<div class="w70p fleft boards_right_wrap">
        		<div id="result">
					<!-- 결과 출력 위치 -->
				</div>
        	</div>
        	<div class="buttons">
            	<input class="inputButton" type="button" value="목록보기" onclick="window.location=<c:url value='/pages/boardsList?pageNum=${pageNum}'/>">
            </div>
        </div>
    </article>
</section>