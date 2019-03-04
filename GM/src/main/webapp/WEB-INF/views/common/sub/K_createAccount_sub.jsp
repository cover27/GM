<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/signup.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
//id 중복확인체크함수
function confirmId(){
	//id값 미입력시
	if(!document.inputform.id.value){
		alert('아이디를 입력하세요');
		document.inputform.id.focus();
		return false;
	}
	
	$("#confirmId").fadeIn(1500);
	
	var getId = document.inputform.id.value;
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
           
           $("[name=address]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>

<div class="signup_wrap">
    <form action="registAccount" method="post" name="inputform" onsubmit="return inputCheck();">
        <input type="hidden" name="hiddenId" value="0">
        <input type="hidden" name="depart">
        <input type="hidden" name="newOld" value="0">
        <div class="signup_center">
            <div class="signup_box">
                <h2>회원가입<span>-계정정보-</span></h2>
                <div class="input_area">
                    <ul>
                        <li>
                            <span>*아이디</span>
                            <input type="text" class="haveBtn" name="id" placeholder="아이디를 입력하세요." autofocus>
                            <input type="button" name="dupChk" value="중복확인" onclick="confirmId();">
                        <li>
                            <span>*비밀번호</span>
                            <input type="password" name="pwd" placeholder="비밀번호를 입력하세요.">
                        </li>
                        <li>
                        	<span>*비밀번호 확인</span>
                        	<input type="password" name="repwd" placeholder="비밀번호를 확인하세요.">
                        </li>
                        <li>
                            <span>*이름</span>
                            <input type="text" name="name" placeholder="이름을 입력하세요.">
                        </li>
                        <li>
                            <span>*회사</span>
                            <input type="text" class="haveBtn" name="depart_name" placeholder="회사조회를 클릭하세요." style="background: #eee;position: relative; top: 0; left: 1px;" readonly>
                            <input type="button" value="회사조회" onclick="findCompany();">
                        </li>
                        <li>
                            <span class="two_line_header">*이메일</span>
                        </li>
                        <li class="two_line">
                        	<span class="two_line_body">
	                        	<input type="text" name="email1" class="email_03">
	                        	<span class="email_04">@</span>
	                            <input type="text" name="email2" class="email_05">
	                            <select name="email3" onchange="selectEmailChk();" class="email_06">
	                            	<option value="0">선택하세요</option>
	                            	<option value="1">직접입력</option>
	                            	<option value="naver.com">네이버</option>
	                            	<option value="gmail.com">구글</option>
	                            	<option value="daum.net">다음</option>
	                            </select>
                        	</span>
                        </li>
                    </ul>
                    <div id="confirmId">
                    </div>
                </div>
            </div>
            <div class="signup_box">
            	<h2>회원가입<span>-개인정보-</span></h2>
            	<div class="input_area">
            		<ul>
                        <li class="jumin">
                           <span>*주민등록번호</span>
                           <span class="input_wrap">
	                           <input type="text" name="jumin1" maxlength="6" onkeyup='nextJumin();' placeholder="000000">
	                           <b>-</b>
	                           <input type="password" name="jumin2" maxlength="7" placeholder="0000000">
                           </span>
                        </li>
                        <li>
                        	<span>*성별</span>
                        	<span class="input_wrap">
	                            <label><input type="radio" name="gender" value=1><b>남성</b></label>
	                            <label><input type="radio" name="gender" value=2><b>여성</b></label>
                        	</span>
                        </li>
                        <li>
                        	<span>*내외국인 여부</span>
                            <span class="input_wrap">
	                            <label><input type="radio" name="frgn" value=1><b>내국인</b></label>
	                            <label><input type="radio" name="frgn" value=2><b>외국인</b></label>
                            </span>
                        </li>
                        <li>
                        	<span>*기혼여부</span>
                            <span class="input_wrap">
	                            <label><input type="radio" name="marry" value=1><b>기혼</b></label>
	                            <label><input type="radio" name="marry" value=2><b>미혼</b></label>
                            </span>
                        </li>
                        <li class="hp">
                            <span>*휴대폰번호</span>
                            <span class="input_wrap">
	                            <input type="text" name="hp1" maxlength="3" onkeyup="nextHp1();" placeholder="000">
	                            <b>-</b>
	                            <input type="text" name="hp2" maxlength="4" onkeyup="nextHp2();" placeholder="0000">
	                            <b>-</b> 
	                            <input type="text" name="hp3" maxlength="4" onkeyup="nextHp3();" placeholder="0000">
                            </span>
                        </li>
                        <li>
                            <span>*주소</span>
                            <input type="text" name="address" placeholder="주소를 입력하세요.">
                        </li>
                        <li>
                            <span>상세주소</span>
                            <input type="text" class="haveBtn" name="address2" placeholder="상세주소를 입력하세요.">
                            <input type="button" value="주소검색" onclick="searchAddress();">
                        </li>
            		</ul>
            	</div>
            </div>
            <div class="signup_box">
                <h2>회원가입<span>-추가정보-</span></h2>
                <div class="input_area">
                    <ul>
                        <li>
                            <span>영문이름</span>
                            <input type="text" name="eng_name" placeholder="Please Enter Your Name">
                        </li>
                        <li>
	                        <span>국적</span>
	                        <input type="text" name="nation" placeholder="국적을 입력하세요">
                        </li>
                        <li id="wedding">
                            <span>결혼기념일</span>
                            <input type="date" name="wdday" style="position: relative; left: 1px;">
                        </li>
                        <li class="hp">
                            <span>자택번호</span>
                            <span class="input_wrap">
	                            <input type="text" name="hm1" maxlength="4" onkeyup="nextHm1();" placeholder="000">
	                            <b>-</b>
	                            <input type="text" name="hm2" maxlength="4" onkeyup="nextHm2();" placeholder="0000">
	                            <b>-</b> 
	                            <input type="text" name="hm3" maxlength="4" onkeyup="nextHm3();" placeholder="0000">
                            </span>
                        </li>
                        <li>
                            <span>영문주소</span>
                            <input type="text" name="eng_address" placeholder="Please Enter Your Address">
                        </li>
                    </ul>
                </div>
                <div class="input_area">
                	<div class="signup_btn">
	                    <input type="submit" value="회원가입">
	                    <input type="reset" value="재작성">
	                    <input type="button" value="가입취소" onclick="window.location='login'">
	                </div>
                </div>
            </div>
        </div>
    </form>
</div>
