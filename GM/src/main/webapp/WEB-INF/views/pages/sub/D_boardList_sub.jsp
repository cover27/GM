<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

// 체크박스 전체선택
function allCheck(){
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=checkRow]").prop("checked", true);
      }else{
        $("input[name=checkRow]").prop("checked", false);
      }
}

//삭제할거 정보이전
function delBoard(){
	var god = confirm("삭제하시겠습니까?");
	if(god){
		window.location ="<c:url value='/admin/D_boardDelPro'/>"
		document.getElementById('boardDel').submit();
	}
}


function page_go(i, num) {
	alert("게시판번호 : "+num);
	$.ajax({
		type : "POST",
		data : {
			"pageNum" : i,
			"num" : num,
		},
		url : "${pageContext.request.contextPath}/pages/D_boardListPage",
		success : function(result) {
			alert("성공");
			$(".table_body").html(result);
		},
		error : function() {
			alert("게시판 로딩이 실패하였습니다.");
		}
	});
}

</script>
<section>
    <article>
        <div class="content_header">
            <h2>게시글 목록</h2>
        </div>
        <div class="content">
        	<form action="<c:url value='/admin/D_boardDelPro'/>" method="post" id="boardDel" onsubmit="return delBoard();">
	            <input type="hidden" name="pageNum" value="${pageNum}">
	            <input type="hidden" name="num" value="${num}">
	            <div class="table_head">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="100px" />
							<col width="*" />
							<col width="200px" />
							<col width="300px" />
							<col width="100px" />
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="allCheck()" /></th>
								<th>글번호</th>
								<th>글제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="100px" />
							<col width="*" />
							<col width="200px" />
							<col width="300px" />
							<col width="100px" />
						</colgroup>
						<tbody>
							<c:if test="${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
									<c:if test="${dto.del == 0}">
										<tr>
											<td><input type="checkbox" name="checkRow" value="${dto.boardnum}" /></td>
											<td>
												${dto.ref}
											</td>
											<td style="text-align: left; padding-left: 20px;">
												<c:if test="${dto.ref_level >= 1}">
													<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
													<i class="fa fa-reply fa-rotate-180"></i>
												</c:if>
												<c:if test="${dto.ref_level > 0}"></c:if>
												<c:if test="${dto.readcnt > 10}"></c:if>
												<a href="<c:url value='/pages/D_boardContent?boardnum=${dto.boardnum}&num=${num}&ref_level=${dto.ref_level}&pageNum=${pageNum}&number=${number+1}'/>">
													${dto.subject}
												</a>
												[${dto.re_num}]
											</td>
											<td>${dto.writer}</td>
											<td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}" /></td>
											<td>${dto.readcnt}</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<!-- 게시글이 없으면 -->
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="6" align="center">게시글이 없습니다. 글을 작성해주세요.!!</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<!-- 페이지 컨트롤 -->
		            <div class="paging">
						<c:if test="${cnt > 0}">
						    <c:if test="${startPage > pageBlock}">
						        <a href="<c:url value='/pages/D_boardList'/>">[◀◀]</a>
						        <a href="<c:url value='/pages/D_boardList?pageNum=${startPage - pageBlock}&num=${num}'/>">[◀]</a>
						    </c:if>
						
						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
						        <c:if test="${i == currentPage}">
						            <span><b>[${i}]</b></span>
						        </c:if>
						        <c:if test="${i != currentPage}">
						            <%-- <a href="#" onclick="page_go('${i}', '${num}')">[${i}]</a> --%>
						            <a href="<c:url value='/pages/D_boardList?pageNum=${i}&num=${num}'/>">[${i}]</a>
						        </c:if>
						    </c:forEach>
						
						    <c:if test="${pageCount > endPage}">
						        <a href="<c:url value='/pages/D_boardList?pageNum=${startPage + pageBlock}&num=${num}'/>">[▶]</a>
						        <a href="<c:url value='/pages/D_boardList?pageNum=${pageCount}&num=${num}'/>">[▶▶]</a>
						    </c:if>
						</c:if>
		            </div>	
				</div>
	            <div class="btnset fright mt10">
	            	<ul>
	            		<li><input type="button" value="글쓰기" onclick="window.location='<c:url value="/pages/D_writeForm?num=${num}&pageNum=${pageNum}" />'" style="background:#d3292c !important;"></li>
	            		<li><input type="submit" value="삭제"></li>
	            	</ul>
	            </div>
	        </form>
        </div>
    </article>
</section>
