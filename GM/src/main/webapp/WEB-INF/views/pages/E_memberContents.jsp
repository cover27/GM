<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.info_wrap {
		width: 580px;
    	margin: 10px auto;
	}
	.info_wrap table {
		border-radius: 5px;
	}
	.info_wrap th, td {
		padding: 15px;
    	border: 1px solid #ddd;
	}
	.info_wrap th {
		background: #f5f5f5;
	}
	.info_wrap a {
		color: #fff !important;
	    background: #555 !important;
	    padding: 5px 15px !important;
	    border-radius: 3px !important;
	    border: none !important;
	    font-size: 1.1em !important;
	    font-weight: bold !important;
    }
</style>
<script>
	$(function(){
		$("#close").click(function(){
			$("#info_result").css("display", "none");
		})
	});
</script>
<div class="info_wrap">
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<span><b>${cont_dto.id}</b></span>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<span>${cont_dto.name}</span>
				<span style="margin:0 10px;color: #c0c0c0;"></span>
			</td>
		</tr>
		<tr>
			<th>휴대폰번호</th>
			<td>
				<span>${cont_dto.tel}</span>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<span>${cont_dto.email_in}</span>
			</td>
		</tr>
		<tr>
			<th>부서명</th>
			<td>
				<c:forEach var='com_dtos' items='${c_dtos}'>
					<c:if test="${cont_dto.depart == com_dtos.groupId}">
							<span>${com_dtos.g_name}</span>
					</c:if>
				</c:forEach>
			</td>
		</tr>
	</table>
	<div class="btnset mt15 fright">
		<a href="E_addMemberPro?id=${cont_dto.id}">자주 연락하는 사람 추가</a>
		<a href="#" id="close">닫기</a>
	</div>
</div>