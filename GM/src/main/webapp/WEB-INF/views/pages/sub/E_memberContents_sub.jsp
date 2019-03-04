<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
	<article>
		<div class="content_header">
			<h2>회원 상세 페이지</h2>
		</div>
		<div class="content">
			<div class="write_head">
				<ul>
					<li>아이디</li>
					<li>이름</li>
					<li>휴대폰번호</li>
					<li>이메일</li>
					<li>부서명</li>
					
				</ul>
				<ul>
					<li>
						<span><b>${cont_dto.id}</b></span>
					</li>
					<li>
						<span>${cont_dto.name}</span>
						<span style="margin:0 10px;color: #c0c0c0;"></span>
					</li>
					
					<li>
						<span>${cont_dto.tel}</span>
					</li>
					
					<li>
						<span>${cont_dto.email_in}</span>
					</li>
					
					<li>
					<c:forEach var='com_dtos' items='${c_dtos}'>
						<c:if test="${cont_dto.depart == com_dtos.groupId}">
								<span>${com_dtos.g_name}</span>
						</c:if>
					</c:forEach>
					</li>
				</ul>
			</div>
			<div style="margin-bottom:60px;padding-top: 20px;" class="btnset fright">
				<input type="button" class="inputButton" value="자주 연락하는 사람 추가" onclick="window.location='<c:url value="/pages/E_addMemberPro?id=${cont_dto.id}"/>'">
				<input type="button" class="inputButton" value="목록 보기" onclick="window.location='<c:url value="/pages/D_boardList"/>'">
			</div>
		</div>
	</article>
</section>