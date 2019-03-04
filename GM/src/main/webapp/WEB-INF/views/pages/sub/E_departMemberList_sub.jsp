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
</script>
<section>
	<article>
		<div class="content_header">
			<h2>전체 구성원 목록</h2>
		</div>
		
		<div style="overflow-y: scroll; height:400px;">	<!-- 스크롤바 -->
			<table style="width:1500px; align=center; border:2px;">
        	<form action="<c:url value='/pages/E_addmembersDepartPro'/>" method="post">
				<tr>
					<th colspan="6" align="left" style="height:25px">
						전체&nbsp;&nbsp;  / ${memcnt} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</th>
				</tr>
				<tr>
					<td scope="col"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="allcheck();" /></td>
					<td style="width:5%">이름</td>
					<td style="width:2%">성별</td>
					<td style="width:10%">국적</td>
					<td style="width:10%">소속부서명</td>
					<td style="width:15%">휴대전화번호</td>
					<td style="width:15%">쪽지쓰기</td>
					<td style="width:20%">등록일</td>
				</tr>
				
				
				<!-- 구성원이 있으면 -->
				<c:forEach var='demem_dtos' items='${demem_dtos}'>
					<tr>
						<td>
							<input type="checkbox" name="checkRow" value="${demem_dtos.id}" />
						</td>
						
						<td style="width:5%">
							<a href='<c:url value="/pages/E_memberContents?id=${demem_dtos.id}&name=${demem_dtos.name}&pageNum=${pageNum}&number=${number}"/>'>${demem_dtos.name}</a>
						</td>
						
						<td style="width:2%">
							<c:if test="${demem_dtos.gender == 1}">
								남자
							</c:if>
							
							<c:if test="${demem_dtos.gender == 2}">
								여자
							</c:if>
						</td>
						
						<td style="width:10%">
							${demem_dtos.nation}
						</td>
						
						<td style="width:10%">
							<c:forEach var='com_dtos' items='${c_dtos}'>
								<c:if test="${demem_dtos.depart == com_dtos.groupId}">
									${com_dtos.g_name}
								</c:if>
							</c:forEach>
						</td>
						
						<td style="width:15%">
							${demem_dtos.tel}
						</td>
						
						<td style="width:15%">
							<input type="button" value="쪽지쓰기" onclick="window.location='<c:url value="/pages/S_orgSendMessage?number=${number}&pageNum=${pageNum}&id=${demem_dtos.id}"/>'">
						</td>
						<%-- "window.location='<c:url value="/pages/D_writeForm?num=${num}&pageNum=${pageNum}" />'" --%>
						<td style="width:20%">
							<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${demem_dtos.enterday}"/>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td> 여기에 페이징 (/pages/E_departMemberList)</td>
				</tr>
				<tr>
	                <td colspan="2">
	                    <input class="inputButton" type="submit" value="자주 연락하는 사람 추가">
	                </td>
		        </tr>
		    </form>
			</table>
		</div>	
				
	</article>
</section>