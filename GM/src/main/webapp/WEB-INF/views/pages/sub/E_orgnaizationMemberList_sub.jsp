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
		<form action="<c:url value='/pages/E_addmembersPro'/>" method="post" id="boardDel" onsubmit="return delBoard();">
		<div style="overflow-y: scroll; height:400px;">	<!-- 스크롤바 -->
			<table style="width:1500px; align=center; border:2px;">
				<tr>
					<th colspan="6" align="left" style="height:25px">
						전체&nbsp;&nbsp;  / ${cnt} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</th>
				</tr>
				<tr>
					<td scope="col"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="allcheck();" /></td>
					<td style="width:5%">이름</td>
					<td style="width:2%">성별</td>
					<td style="width:10%">국적</td>
					<td style="width:10%">소속부서명</td>
					<td style="width:15%">휴대전화번호</td>
					<td style="width:15%">외부이메일</td>
					<td style="width:20%">등록일</td>
				</tr>
				
				
				<!-- 구성원이 있으면 -->
				<c:forEach var='dto' items='${mem_dtos}'>
					<tr>
						<td>
							<input type="checkbox" name="checkRow" value="${dto.id}"/>
						</td>
						<td style="width:5%">
							<a href='<c:url value="/pages/E_memberContents?id=${dto.id}&name=${dto.name}&pageNum=${pageNum}&number=${number}"/>'>${dto.name}</a>
						</td>
						
						<td style="width:2%">
							<c:if test="${dto.gender == 1}">
								남자
							</c:if>
							
							<c:if test="${dto.gender == 2}">
								여자
							</c:if>
						</td>
						
						<td style="width:10%">
							${dto.nation}
						</td>
						
						<td style="width:10%">
							<c:forEach var='com_dtos' items='${c_dtos}'>
								<c:if test="${dto.depart == com_dtos.groupId}">
									${com_dtos.g_name}
								</c:if>
							</c:forEach>
						</td>
						
						<td style="width:15%">
							${dto.tel}
						</td>
						
						<td style="width:15%">
							${dto.email_in}
						</td>
						
						<td style="width:20%">
							<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.enterday}"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>	
				<!-- 페이지 컨트롤 -->
			<table style="width:1000px" align="center">
				<tr>
					<td align="center">
						<!-- 멤버가 있으면 -->
						<c:if test="${cnt > 0}">
							<!-- 처음[◀◀] / 이전블록[◀]  -->
							<c:if test="${startPage > pageBlock}">
								<a href="<c:url value='/pages/E_organizationList'/>">[◀◀]</a>
								<a href="<c:url value='/pages/E_organizationList?pageNum=${endPage - pageBlock}'/>">[◀]</a>
							</c:if>
							
							<!-- 블록 내의 페이지 번호 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="<c:url value='/pages/E_organizationList?pageNum=${i}'/>">[${i}]</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음블록 [▶]  /  마지막 [▶▶]  -->
							<c:if test="${pageCount > endPage}">
								<a href="<c:url value='/pages/E_organizationList?pageNum=${startPage + pageBlock}'/>">[▶]</a>
								<a href="<c:url value='/pages/E_organizationList?pageNum=${pageCount}'/>">[▶▶]</a>
							</c:if>
						</c:if>
					</td>
				</tr>
				
				<tr>
	                <td colspan="2">
	                    <input class="inputButton" type="submit" value="개인 그룹에 추가">
	                </td>
		        </tr>
			</table>
	</article>
</section>