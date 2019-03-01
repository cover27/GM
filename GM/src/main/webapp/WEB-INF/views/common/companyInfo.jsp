<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<script type="text/javascript">
	function enterCompanyInfo(){
		if(!document.companyform.c_name.value){
			alert('회사명을 입력하세요');
			return false;
		} else if(!document.companyform.c_address.value){
			alert('주소를 입력하세요.');
			return false;
		} else if(!document.companyform.c_number.value){
			alert('사업자번호를 입력하세요.');
			return false;
		}
		opener.document.inputform.c_name.value = document.companyform.c_name.value;
		opener.document.inputform.company_name.value = document.companyform.c_name.value;
		opener.document.inputform.c_address.value = document.companyform.c_address.value;
		opener.document.inputform.c_number.value = document.companyform.c_number.value;
		alert('회사 정보가 입력되었습니다.');
		self.close();
	}
</script>
<div>
	<form action="#" name="companyform">
		<table>
			<tr>
				<th>회사명</th>
				<td><input type="text" name="c_name"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="c_address"></td>
			</tr>
			<tr>
				<th>사업자 등록번호</th>
				<td><input type="text" name="c_number"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="입력" onclick="enterCompanyInfo();">
					<input type="button" value="닫기" onclick="self.close();">
				</td>
			</tr>
		</table>
	</form>
</div>