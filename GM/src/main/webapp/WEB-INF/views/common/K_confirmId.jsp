<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<style>
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		document.confirmform.id.focus();
	});

	function setId(id){
		document.inputform.id.value=id;
		document.inputform.hiddenId.value="1";
		$("#confirmId").fadeOut(300);
		$("input[name='id']").prop("readonly",true);	// 선택된 id를 다시 변경하지 못하도록 하기
		$("input[name='id']").css("background-color","#eee");	// id 입력창 색깗 변경
		$("input[name='id']").css("font-weight","bold");	// id 글씨 굵게
		document.inputform.pwd.focus();
	}
	
	function closeThis(){
		$("#confirmId").fadeOut(300);
	}
	
	function confirmIdChk(){
		if(!document.confirmform.id.value){
			alert("아이디를 입력하세요");
			document.confirmform.id.focus();
			return false;
		}
		var getId = document.confirmform.id.value;
		console.log(getId);
		
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/confirmId",
			data : {
				"id" : getId
			},
			success : function(result) {
				// alert("성공");
				$("#confirmId").html(result);
			},
			error : function() {
				alert("아이디 조회가 실패하였습니다.");
				console.log(getId);
			}
		});
	}
</script>

<div class="confim_id_wrap">
	<form action="#" method="post" name="confirmform">
		<div class="signup_box">
			<h2>중복확인</h2>
			<c:if test="${checkCnt == 0 }">
				<div class="input_area">
					<ul>
						<li>
							<b>${id}</b>는 사용 할 수 없습니다.
						</li>
						<li>
							<span>다른 아이디</span>
							<input type="text" name="id" maxlength="20">
						</li>
					</ul>
				</div>
				<div class="input_area">
					<div class="signup_btn">
						<input type="button" value = "확인" onclick="confirmIdChk()">
						<input type="reset" value="취소" onclick="closeThis();" style="width: 100%;">
					</div>
				</div>
			</c:if>
			<c:if test="${checkCnt != 0 }">
				<div class="input_area">
					<ul>
						<li>
							<b>${id}</b>는 사용 할 수 있습니다.
						</li>
					</ul>
				</div>
				<div class="input_area" style="margin-top: 150px;">
					<div class="signup_btn">
						<input type="button" value = "확인" onclick="setId('${id}');" style="width: 100%;">
					</div>
				</div>
			</c:if>
		</div>
	</form>
</div>