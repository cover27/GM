<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<style>
	
</style>
<script type="text/javascript">
	
	function confirmIdCheck(){
		if(!document.confirmform.id.value){
			alert(msg_id);
			document.confirmform.id.focus();
			return false;
		}
	}
	
	function setId(id){
		document.inputform.id.value=id;
		document.inputform.hiddenId.value="1";
		$("#confirmId").fadeOut(1500);
	}
</script>

<div class="confim_id_wrap">
	<h2>중복확인 페이지</h2>
	<form action="confirmId" method="post" name="confirmform" onsubmit="return confirmIdCheck();">
		<c:if test="${checkCnt == 0 }">
			<table>
				<tr>
					<th colspan="2" align="center">
						<span>${id}</span>는 사용 할 수 없습니다.
					</th>
				</tr>
				
				<tr>
					<th>아이디 : </th>
					<td>
						<input type="text" name="id" maxlength="20">
					</td>
				</tr>
				
				<tr>
					<th colspan="2" style="height:100px;">
						<input type="submit" value = "확인" style="height: 36px;">
						<input type="reset" value="취소" onclick="self.close();" style="height: 36px;">
					</th>
				</tr>
			</table>
		</c:if>
		<c:if test="${checkCnt != 0 }">
			<table>
				<tr>
					<td align="center">
						<span>${id}</span>는 사용할 수 있습니다.
					</td>
				</tr>
				<tr>
					<th style="height:100px;">
						<input type="button" value = "확인" onclick="setId('${id}');" style="height: 36px;">
					</th>
				</tr>
			</table>
		</c:if>
	</form>
</div>