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

function write(){
	opener.document.inputform.depart.value=company;
	self.close();
}

function getInfo(id, name, pageNum, number){
	$("#info_result").css("display", "block");
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/pages/E_memberContents",
		data : {
			"id" : id,
			"name" : name,
			"pageNum" : pageNum,
			"number" : number
		},
		success : function(result) {
			// alert("성공");
			$("#info_result").html(result);
		},
		error : function() {
			alert("게시판 등록이 실패하였습니다.");
		}
	});
}
</script>
<section>
	<article>
		<div class="content_header">
			<h2>부서 구성원 목록</h2>
		</div>
		<div class="content">
			<form action="<c:url value='/pages/E_addmembersDepartPro'/>" method="post">
				<h3 class="mb10">전체<span class="ml10 cnt">${memcnt}</span></h3>
				<div class="table_head">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="250px" />
							<col width="100px" />
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="250px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="allcheck();" /></th>
								<th>이름 (ID)</th>
								<th>성별</th>
								<th>국적</th>
								<th>소속부서명</th>
								<th>휴대전화번호</th>
								<th>쪽지쓰기</th>
								<th>등록일</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body" style="height: 620px;">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="250px" />
							<col width="100px" />
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="250px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<c:forEach var='demem_dtos' items='${demem_dtos}'>
								<tr>
									<td>
										<c:if test="${sessionScope.loginInfo.id != demem_dtos.id}">
											<input type="checkbox" name="checkRow" value="${demem_dtos.id}"/>
										</c:if>
										<c:if test="${sessionScope.loginInfo.id == demem_dtos.id}">
											*
										</c:if>
									</td>
									<td>
										<a href="#" onclick="getInfo('${demem_dtos.id}', '${demem_dtos.name}', '${pageNum}', '${number}')">${demem_dtos.name} (${demem_dtos.id})</a>
									</td>
									<td>
										<c:if test="${demem_dtos.gender == 1}">
											남자
										</c:if>
										<c:if test="${demem_dtos.gender == 2}">
											여자
										</c:if>
									</td>
									<td>
										${demem_dtos.nation}
									</td>
									<td>
										<c:forEach var='com_dtos' items='${c_dtos}'>
											<c:if test="${demem_dtos.depart == com_dtos.groupId}">
												${com_dtos.g_name}
											</c:if>
										</c:forEach>
									</td>
									<td>
										${demem_dtos.tel}
									</td>
									<td>
										<input type="button" value="쪽지쓰기" onclick="window.location='<c:url value="/pages/S_orgSendMessageForm?id=${demem_dtos.id}"/>'" style="background:#555;">
									</td>
									<%-- "window.location='<c:url value="/pages/D_writeForm?num=${num}&pageNum=${pageNum}" />'" --%>
									<td>
										<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${demem_dtos.enterday}"/>
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
					        <a href="<c:url value='/pages/E_departMemberList'/>"><i class="fas fa-angle-double-left"></i></a>
					        <a href="<c:url value='/pages/E_departMemberList?num=${num}&pageNum=${startPage - pageBlock}'/>"><i class="fas fa-angle-left"></i></a>
					    </c:if>
					
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        <c:if test="${i == currentPage}">
					            <span class="thisPage"><b>${i}</b></span>
					        </c:if>
					        <c:if test="${i != currentPage}">
					            <a href="<c:url value='/pages/E_departMemberList?num=${num}&pageNum=${i}'/>">${i}</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${pageCount > endPage}">
					        <a href="<c:url value='/pages/E_departMemberList?num=${num}&pageNum=${startPage + pageBlock}'/>"><i class="fas fa-angle-right"></i></a>
					        <a href="<c:url value='/pages/E_departMemberList?num=${num}&pageNum=${pageCount}'/>"><i class="fas fa-angle-double-right"></i></a>
					    </c:if>
					</c:if>
	            </div>
				<div class="btnset fright">
					<input class="inputButton" type="submit" value="자주 연락하는 사람 추가">
				</div>
				<div id="info_result"></div>
			</form>
		</div>
	</article>
</section>