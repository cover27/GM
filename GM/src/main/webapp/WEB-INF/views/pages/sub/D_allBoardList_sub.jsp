<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">

// 체크박스 전체선택
function allcheck(){
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
		window.location ="<c:url value='/admin/D_allBoardDeletePro'/>"
		document.getElementById('boardDel').submit();
	}
}
</script>

<section>
	<article>
		<div class="content_header">
			<h2>모든 게시물</h2>
		</div>
		<div class="content">
			<form action="<c:url value='/admin/D_allBoardDeletePro'/>" method="post" id="boardDel" onsubmit="return delBoard();">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<div class="table_head">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="200px" />
							<col width="*" />
							<col width="200px" />
							<col width="300px" />
							<col width="100px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="allcheck();" /></th>
								<th>게시판명</th>
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
							<col width="200px" />
							<col width="*" />
							<col width="200px" />
							<col width="300px" />
							<col width="100px" />
						</colgroup>
						<!-- 게시글이 있으면 -->
						<c:if test="${cnt > 0}">
							<c:forEach var="dto" items="${dtos}">
								<c:if test="${dto.del == 0}">
									<tr>
										<td><input type="checkbox" name="checkRow" value="${dto.boardnum}" /></td>
										<td>
											<c:forEach var="dtos" items="${b_dtos}">
												<c:if test="${dto.num == dtos.num}">
													${dtos.b_name}
												</c:if>
											</c:forEach>
										</td>
										<td style="text-align: left; padding-left: 20px;">
											<c:if test="${dto.ref_level >= 1}">
												<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
												<i class="fa fa-reply fa-rotate-180 ml20"></i>
											</c:if>
											<c:if test="${dto.ref_level > 0}"></c:if>
											<c:if test="${dto.readcnt > 10}"></c:if>
											<a href="<c:url value='/pages/D_boardContent?boardnum=${dto.boardnum}&num=${dto.num}&ref_level=${dto.ref_level}&pageNum=${pageNum}&number=${number+1}'/>">
												${dto.subject}
											</a>
											<c:if test="${dto.re_num != 0}">
												<span class="replycnt">${dto.re_num}</span>
											</c:if>
										</td>
										<td>${dto.writer}</td>
										<td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}" /></td>
										<td>${dto.readcnt}</td>
									</tr>
								</c:if>
								<input type="hidden" name="nums" value="${dto.num}">
							</c:forEach>
						</c:if>
						<!-- 게시글이 없으면 -->
						<c:if test="${cnt == 0}">
							<tr>
								<td colspan="7" align="center">게시글이 없습니다. 글을 작성해주세요.!!</td>
							</tr>
						</c:if>
					</table>
					<!-- 페이지 컨트롤 -->
		            <div class="paging">
						<c:if test="${cnt > 0}">
						    <c:if test="${startPage > pageBlock}">
						        <a href="<c:url value='/pages/D_allBoardList'/>">[◀◀]</a>
						        <a href="<c:url value='/pages/D_allBoardList?num=${num}&pageNum=${startPage - pageBlock}'/>">[◀]</a>
						    </c:if>
						
						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
						        <c:if test="${i == currentPage}">
						            <span class="thisPage"><b>${i}</b></span>
						        </c:if>
						        <c:if test="${i != currentPage}">
						            <a href="<c:url value='/pages/D_allBoardList?num=${num}&pageNum=${i}'/>">${i}</a>
						        </c:if>
						    </c:forEach>
						
						    <c:if test="${pageCount > endPage}">
						        <a href="<c:url value='/pages/D_allBoardList?num=${num}&pageNum=${startPage + pageBlock}'/>">[▶]</a>
						        <a href="<c:url value='/pages/D_allBoardList?num=${num}&pageNum=${pageCount}'/>">[▶▶]</a>
						    </c:if>
						</c:if>
		            </div>
				</div>
				<div class="btnset fright mt10">
					<input type="submit" value="삭제">
				</div>
			</form>
		</div>
	</article>
</section>