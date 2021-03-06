<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.spring.gm.vo.MemberVO" %>  
<script>
	function modify(boardnum, pageNum, num, number, replenum, content) {
		var selector = '.cmt_list';
		$(selector).on('click', function(){
		    $(selector).removeClass('cmt_list');
		    $(this).addClass('cmt_list');
		});
		
		// alert("컴온");
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/pages/D_repleUpdate",
			data : {
				"boardnum" : boardnum,
				"pageNum" : pageNum,
				"num" : num,
				"number" : number,
				"replenum" : replenum,
				"content" : content
			},
			success : function(result) {
				// alert("성공");
				$(".cmt_list").html(result);
			},
			error : function() {
				alert("게시판 변경이 실패하였습니다.");
			}
		});
	}
</script>
<section>
	<article>
		<div class="content_header">
			<h2>게시글 상세 페이지</h2>
		</div>
		<div class="content">
			<div class="write_head">
				<ul>
					<li>
						<span><b>${dto.subject}</b></span>
					</li>
					<li>
						<span>
						<c:forEach var="b_dtos" items="${b_dtos}">
							<c:if test="${b_dtos.num == dto.num}">
								<c:if test="${b_dtos.anon == 0}">
									${dto.writer}
								</c:if>
								<c:if test="${b_dtos.anon == 1}">
									*********
								</c:if>								
							</c:if>
						</c:forEach>
						</span>
						<span style="margin:0 10px;color: #c0c0c0;">|</span>
						<span><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.getReg_date()}" /></span>
					</li>
				</ul>
			</div>
			<div class="write_body">
				${dto.content}
			</div>
			<div class="comment mt20">
				<form action="<c:url value='/pages/D_repleInsertPro'/>" method="post" name="D_repleInsert">
					<input type="hidden" name="boardnum" value="${boardnum}">
					<input type="hidden" name="writer" value="${sessionScope.loginInfo.name}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="num" value="${num}">
					<input type="hidden" name="number" value="${number}">
					<ul>
						<li>${sessionScope.loginInfo.name}</li>
						<li>
							<input type="text" class="w90p" name="content" placeholder="댓글 내용을 입력하세요!!">
							<span class="btnset">
								<input type="submit" value="작성">
								<!-- <input type="reset" value="취소"> -->
							</span>
						</li>
					</ul>
					<c:forEach var="r_dtos" items="${r_dtos}">
						<c:if test="${r_dtos.del == 0}">
							<ul id="result" class="cmt_list" style="margin-top: 20px;border-top: 1px solid #e5e5e5">
								<li>
									<span>
										<c:forEach var="b_dtos" items="${b_dtos}">
											<c:if test="${b_dtos.num == dto.num && dto.boardnum == r_dtos.boardnum}">
												<c:if test="${b_dtos.anon == 0}">
													${r_dtos.writer}
												</c:if>
												<c:if test="${b_dtos.anon == 1}">
													*********
												</c:if>
											</c:if>
										</c:forEach>
									</span>
									<span style="margin:0 10px;color: #c0c0c0;">|</span>
									<span><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${r_dtos.reg_date}" /></span>
									<c:if test="${sessionScope.loginInfo.name == r_dtos.writer}">
										<span class="ml30">
											<input type="button" style="background: #555;" value="수정" onclick="modify('${r_dtos.boardnum}', '${pageNum}', '${num}', '${number}', '${r_dtos.replenum}', '${r_dtos.content}');">
										</span>
										<span>
											<input type="button" style="background: #d3292c;" value="삭제" onclick="window.location='<c:url value="/pages/D_repleDeletePro?boardnum=${r_dtos.boardnum}&pageNum=${pageNum}&num=${num}&number=${number}&replenum=${r_dtos.replenum}"/>'">
										</span>
									</c:if>
								</li>
								<li>
									${r_dtos.content}
								</li>
							</ul>
						</c:if>
					</c:forEach>
				</form>
			</div>
			<div style="margin-bottom:60px;padding-top: 20px;" class="btnset fright">
				<c:if test="${sessionScope.loginInfo.name == dto.writer}">
					<input type="button" class="inputButton" value="글 수정" onclick="window.location='<c:url value="/pages/D_boardUpdate?boardnum=${dto.boardnum}&pageNum=${pageNum}&num=${num}"/>'">
				</c:if>
				<c:if test="${sessionScope.loginInfo.sys_rank == 1 || sessionScope.loginInfo.name == dto.writer}">
					<input type="button" class="inputButton" value="글 삭제" onclick="window.location='<c:url value="/pages/D_boardDeletePro?boardnum=${dto.boardnum}&pageNum=${pageNum}&num=${num}&ref_level=${dto.ref_level}"/>'">
				</c:if>
				<input type="button" class="inputButton" value="답글 쓰기" onclick="window.location='<c:url value="/pages/D_writeForm?boardnum=${dto.boardnum}&num=${num}&ref=${dto.ref}&ref_step=${dto.ref_step}&ref_level=${dto.ref_level}&pageNum=${pageNum}"/>'">
				<input type="button" class="inputButton" value="목록 보기" onclick="window.location='<c:url value="/pages/D_boardList?pageNum=${pageNum}&boardnum=${dto.boardnum}&num=${num}"/>'">
			</div>
		</div>
	</article>
</section>