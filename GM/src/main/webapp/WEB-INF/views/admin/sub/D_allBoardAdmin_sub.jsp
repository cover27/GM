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
function delBoardAdmin(){
	var god = confirm("선택한것들을 삭제하시겠습니까?");
	if(god){
		document.boardSelect.action="<c:url value='/admin/D_boardAdminDeletePro'/>"
		document.boardSelect.submit();
	}
}
// 이동시킬것 정보이전
function board_move(){
	var move = confirm("선택한것들을 이동시키겠습니까?");
	if(move){
		document.boardSelect.action="<c:url value='/admin/D_boardMovePro'/>";
		document.boardSelect.submit();
	}
}
</script>

<section>
	<article>
		<div class="content_header">
			<h2>게시글 전체 목록</h2>
		</div>		
<form method="post" name= "boardSelect" id="boardSelect">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<table border = 1>
		<tr>
			<th colspan="7" align="center" style="height:25px">
				전체 글목록
			</th>
		</tr>
		
		<tr>
			<th scope="col"><input type="checkbox" name="checkAll" id="th_checkAll" onclick="allcheck();"/></th>
			<th style="width:15%"> 게시판명 </th>
			<th> 이동 대상 게시판 </th>
			<th style="width:25%"> 글제목 </th>
			<th style="width:10%"> 작성자 </th>
			<th style="width:15%"> 작성일 </th>
			<th style="width:5%"> 조회수 </th>	
		</tr>	
		
		<!-- 게시글이 있으면 -->
		<c:if test="${cnt > 0}">
			<!-- items="${dtos} : ArrayList<BoardVO> : 게시글 목록   
			     var="dto" : 작은바구니 : 게시글 1건
			     ==> 게시글목록에 5건이 있다면 5회(ArrayList에서 꺼내서 dto에 담은 다음 출력)
			 -->
		
			<c:forEach var="dto" items="${ad_dtos}">
				<c:if test="${dto.del == 0}">
					<tr>				
						<td>
							<input type="checkbox" name="checkRow" value="${dto.boardnum}"/>
						</td>
						
						<td>
							<c:forEach var="dtos" items="${b_dtos}">
								<c:if test="${dto.num == dtos.num}">
									${dtos.b_name}
								</c:if>
							</c:forEach>
						</td>
					
						<td>
								<select name="num">
										<option value=""> 선택하세요 </option>
								<c:forEach var="dtos" items="${b_dtos}">
									<c:if test="${dto.num != dtos.num}">
   										<option value="${dtos.num}"> ${dtos.b_name}</option>
   										<script>console.log("-num:::::"+${dtos.num});</script>   										
   									</c:if>
   								</c:forEach>
							</select>
						</td>
						
						<td>
							<c:if test="${dto.ref_level > 1}">
								<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
							</c:if>		
														
							<c:if test="${dto.ref_level > 0}"></c:if>
												
							<c:if test="${dto.readcnt > 10}"></c:if>
					
							<a href="<c:url value='/pages/D_boardContent?boardnum=${dto.boardnum}&num=${dto.num}&ref_level=${dto.ref_level}&pageNum=${pageNum}&number=${number+1}'/>"> ${dto.subject}</a>
							[${dto.re_num}]
						</td>
					
						<td>
							${dto.writer}
						</td>
					
						<td>
							<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.reg_date}" />
						</td>
					
						<td>
							${dto.readcnt}
						</td>
					</tr>
				</c:if>
				<input type="hidden" name="nums" value="${dto.num}">
			</c:forEach>
		</c:if>
		
		
		<!-- 게시글이 없으면 -->
		<c:if test="${cnt == 0}">
			<tr>
				<td colspan="6" align="center">
					게시글이 없습니다. 글을 작성해주세요.!!
				</td>
			</tr>
		</c:if>
	</table>
	
	<!-- 페이지 컨트롤 -->	
<c:if test="${dto.del == 0}">
	<table>
		<tr>
			<th align="center">
				<!-- 게시글이 있으면 -->
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀] / 이전블록[◀]  -->
					<c:if test="${startPage > pageBlock}">					
						<a href="<c:url value='/admin/D_allBoardAdmin'/>">[◀◀ ]</a>						
						<a href="<c:url value='/admin/D_allBoardAdmin?pageNum=${startPage - pageBlock}'/>">[◀ ]</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i != currentPage}">
							<a href="<c:url value='/admin/D_allBoardAdmin?pageNum=${i}'/>">[${i}]</a>
						</c:if>
					</c:forEach>					
					
					<!-- 다음 블록[▶] / 끝[▶▶]> -->
					<c:if test="${pageCount > endPage}">					
						<a href="<c:url value='/admin/D_allBoardAdmin?pageNum=${startPage + pageBlock}'/>">[▶ ]</a>						
						<a href="<c:url value='/admin/D_allBoardAdmin?pageNum=${pageCount}'/>">[▶▶ ] </a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
	</c:if>
	<table>
		<tr>
			<th colspan="4">
				<input type="button" value="삭제" onclick="delBoardAdmin()">
				<input type="button" value="게시판 이동" onclick="board_move()">
			</th>
		</tr>
	</table>
</form>
	</article>
</section>