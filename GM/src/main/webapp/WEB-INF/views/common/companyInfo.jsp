<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		opener.document.inputform.c_address.value = document.companyform.c_address.value + ' ' + document.companyform.c_address2.value;
		opener.document.inputform.c_number.value = document.companyform.c_number.value;
		alert('회사 정보가 입력되었습니다.');
		self.close();
	}
	
	function searchAddress(){
		new daum.Postcode({
	        oncomplete: function(data) {
	           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	               extraRoadAddr += data.bname;
	           }
	           // 건물명이 있고, 공동주택일 경우 추가한다.
	           if(data.buildingName !== '' && data.apartment === 'Y'){
	              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	           }
	           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	           if(extraRoadAddr !== ''){
	               extraRoadAddr = ' (' + extraRoadAddr + ')';
	           }
	           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	           if(fullRoadAddr !== ''){
	               fullRoadAddr += extraRoadAddr;
	           }

	           // 우편번호와 주소 정보를 해당 필드에 넣는다.
	           console.log(data.zonecode);
	           console.log(fullRoadAddr);
	           
	           $("[name=c_address]").val(fullRoadAddr);
	           
	           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	       }
	    }).open();
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
				<th>상세주소</th>
				<td><input type="text" name="c_address2"></td>
				<td><input type="button" value="주소검색" onclick="searchAddress();"></td>
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