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
function deletegarbage(){
	var deletePro = confirm("선택하신것을 삭제하시겠습니까?");
	if(deletePro){
		document.garbage.action="<c:url value='/pages/S_delGarbagePro'/>"
		document.garbage.submit();
	}
}

//복원할거 정보이전
function restoregarbage(){
	var restoregarbage = confirm("선택하신것을 복원하시겠습니까?");
	if(restoregarbage){
		document.garbage.action="<c:url value='/pages/S_garbageRestorePro'/>"
		document.garbage.submit();
	}
}

</script>
<section>
    <article>
        <div class="content_header">
            <h2>쪽지 전송 목록</h2>
        </div>
        <div class="content">
        	<form method="post" id="garbage" name="garbage">
	            <input type="hidden" name="pageNum" value="${pageNum}">
	            <input type="hidden" name="num" value="${num}">
	            <div class="table_head">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="100px" />
							<col width="870px" />
							<col width="200px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="allCheck()" /></th>
								<th>읽음</th>
								<th>쪽지 제목</th>
								<th>수신자</th>
								<th>작성일</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="100px" />
							<col width="870px" />
							<col width="200px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<c:if test="${cnt > 0}">
								<c:forEach var="dto" items="${g_dtos}">
									<c:if test="${dto.del == 0}">
										<c:if test="${dto.readCnt == 0}">
											<tr class="boldChild">
												<td><input type="checkbox" name="checkRow" value="${dto.num}" /></td>
												<td>
													<c:if test="${dto.readCnt == 0}">
														안읽음
													</c:if>
													<c:if test="${dto.readCnt != 0}">
														읽음
													</c:if>																	
												</td><!-- 읽음 안읽음 여부만 -->
												<td style="text-align: left; padding-left: 20px;">
													<a href="<c:url value='/pages/S_contentMessage?num=${dto.num}&message_num=${dto.message_num}&pageNum=${pageNum}&number=${number}'/>">
														${dto.subject}
													</a>
												</td>
												<td>${dto.receiver}</td>
												<td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.receiveDate}" /></td>
											</tr>
										</c:if>
										<c:if test="${dto.readCnt != 0}">
											<tr>
												<td><input type="checkbox" name="checkRow" value="${dto.num}" /></td>
												<td>
													<c:if test="${dto.readCnt == 0}">
														안읽음
													</c:if>
													<c:if test="${dto.readCnt != 0}">
														읽음
													</c:if>																	
												</td><!-- 읽음 안읽음 여부만 -->
												<td style="text-align: left; padding-left: 20px;">
													<a href="<c:url value='/pages/S_contentMessage?num=${dto.num}&message_num=${dto.message_num}&pageNum=${pageNum}&number=${number}'/>">
														${dto.subject}
													</a>
												</td>
												<td>${dto.receiver}</td>
												<td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.receiveDate}" /></td>
											</tr>
										</c:if>	
									</c:if>
								</c:forEach>
							</c:if>
							<!-- 게시글이 없으면 -->
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="6" align="center">휴지통에 쪽지가 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<!-- 페이지 컨트롤 -->
		            <div class="paging">
						<c:if test="${cnt > 0}">
						    <c:if test="${startPage > pageBlock}">
						        <a href="<c:url value='/pages/S_sendMessageList'/>"><i class="fas fa-angle-double-left"></i></a>
						        <a href="<c:url value='/pages/S_sendMessageList?num=${num}&pageNum=${startPage - pageBlock}'/>"><i class="fas fa-angle-left"></i></a>
						    </c:if>
						
						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
						        <c:if test="${i == currentPage}">
						            <span class="thisPage"><b>${i}</b></span>
						        </c:if>
						        <c:if test="${i != currentPage}">
						            <a href="<c:url value='/pages/S_sendMessageList?num=${num}&pageNum=${i}'/>">${i}</a>
						        </c:if>
						    </c:forEach>
						
						    <c:if test="${pageCount > endPage}">
						        <a href="<c:url value='/pages/S_sendMessageList?num=${num}&pageNum=${startPage + pageBlock}'/>"><i class="fas fa-angle-right"></i></a>
						        <a href="<c:url value='/pages/S_sendMessageList?num=${num}&pageNum=${pageCount}'/>"><i class="fas fa-angle-double-right"></i></a>
						    </c:if>
						</c:if>
		            </div>	
				</div>
	            <div class="btnset fright mt10">
	            	<ul>
	            		<li><input type="submit" value="복원" onclick="restoregarbage()"></li>
	            		<li><input type="submit" value="삭제" onclick="deletegarbage()"></li>
	            	</ul>
	            </div>
	        </form>
        </div>
    </article>
</section>
