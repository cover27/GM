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
</script>
<section>
	<article>
		<div class="content_header">
			<h2>전체 구성원 목록</h2>
		</div>
		<div class="content">
			<form action="<c:url value='/pages/E_addmembersPro'/>" method="post" id="boardDel" onsubmit="return delBoard();">
				<h3 class="mb10">전체<span class="ml10 cnt">${cnt}</span></h3>
				<div class="table_head">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="200px" />
							<col width="100px" />
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="300px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="allcheck();" /></th>
								<th>이름</th>
								<th>성별</th>
								<th>국적</th>
								<th>소속부서명</th>
								<th>휴대전화번호</th>
								<th>외부이메일</th>
								<th>등록일</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body" style="height: 650px;">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="200px" />
							<col width="100px" />
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="300px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<c:forEach var='dto' items='${mem_dtos}'>
						<tr>
							<td>
								<c:if test="${sessionScope.loginInfo.id != dto.id}">
									<input type="checkbox" name="checkRow" value="${dto.id}"/>
								</c:if>
								
								<c:if test="${sessionScope.loginInfo.id == dto.id}">
									*
								</c:if>
							</td>
							<td>
								<a href='<c:url value="/pages/E_memberContents?id=${dto.id}&name=${dto.name}&pageNum=${pageNum}&number=${number}"/>'>${dto.name}</a>
							</td>
							
							<td>
								<c:if test="${dto.gender == 1}">
									남자
								</c:if>
								
								<c:if test="${dto.gender == 2}">
									여자
								</c:if>
							</td>
							
							<td>
								${dto.nation}
							</td>
							
							<td>
								<c:forEach var='com_dtos' items='${c_dtos}'>
									<c:if test="${dto.depart == com_dtos.groupId}">
										${com_dtos.g_name}
									</c:if>
								</c:forEach>
							</td>
							
							<td>
								${dto.tel}
							</td>
							
							<td>
								${dto.email_in}
							</td>
							
							<td>
								<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.enterday}"/>
							</td>
						</tr>
					</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 페이지 컨트롤 -->
	            <div class="paging">
					<c:if test="${cnt > 0}">
					    <c:if test="${startPage > pageBlock}">
					        <a href="<c:url value='/pages/E_orgnaizationMemberList'/>"><i class="fas fa-angle-double-left"></i></a>
					        <a href="<c:url value='/pages/E_orgnaizationMemberList?num=${num}&pageNum=${startPage - pageBlock}'/>"><i class="fas fa-angle-left"></i></a>
					    </c:if>
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        <c:if test="${i == currentPage}">
					            <span class="thisPage"><b>${i}</b></span>
					        </c:if>
					        <c:if test="${i != currentPage}">
					            <a href="<c:url value='/pages/E_orgnaizationMemberList?num=${num}&pageNum=${i}'/>">${i}</a>
					        </c:if>
					    </c:forEach>
					    <c:if test="${pageCount > endPage}">
					        <a href="<c:url value='/pages/E_orgnaizationMemberList?num=${num}&pageNum=${startPage + pageBlock}'/>"><i class="fas fa-angle-right"></i></a>
					        <a href="<c:url value='/pages/E_orgnaizationMemberList?num=${num}&pageNum=${pageCount}'/>"><i class="fas fa-angle-double-right"></i></a>
					    </c:if>
					</c:if>
	            </div>
	            <div class="btnset fright">
					<input type="submit" value="자주 연락하는 사람에 추가">
				</div>
            </form>
		</div>
	</article>
</section>