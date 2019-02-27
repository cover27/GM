/* 헤더 카테고리 선택시 강조 */
var url = window.location.href.split('gm');
if (url.indexOf('/')) {
	var url_split = url[1].split('/');
	if(url_split.length > 2){
		if(url_split.indexOf('_')){
			var category = url_split[2].split('_');
			// alert(category[0]);

			if(category[0] == "S"){
				// alert("됨");
				$(function(){
					$("#s").children().css("color", "#d3292c");
					$("#s").css("font-weight", "bold");
				});
			} else if(category[0] == "O"){
				// alert("됨");
				$(function(){
					$("#o").children().css("color", "#d3292c");
					$("#o").css("font-weight", "bold");
				});
			} else if(category[0] == "D"){
				// alert("됨");
				$(function(){
					$("#d").children().css("color", "#d3292c");
					$("#d").css("font-weight", "bold");
				});
			} else if(category[0] == "J"){
				// alert("됨");
				$(function(){
					$("#j").children().css("color", "#d3292c");
					$("#j").css("font-weight", "bold");
				});
			} else if(category[0] == "K"){
				// alert("됨");
				$(function(){
					$("#k").children().css("color", "#d3292c");
					$("#k").css("font-weight", "bold");
				});
			} else if(category[0] == "P"){
				// alert("됨");
				$(function(){
					$("#p").children().css("color", "#d3292c");
					$("#p").css("font-weight", "bold");
				});
			}	
		}
	}
}

/*헤더 카테고리 선택시 강조 끝 */

/* 회원가입 */
// 필수입력 확인
function inputCheck(){
	if(!document.inputform.id.value){
		alert('아이디를 입력하세요.');
		document.inputform.id.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.pwd.value){
		alert('비밀번호를 입력하세요.');
		document.inputform.pwd.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.repwd.value){
		alert('비밀번호를 확인하세요.');
		document.inputform.repwd.focus();
		return false; //다음으로 못넘김
	} else if(document.inputform.pwd.value != document.inputform.repwd.value){
		alert('비밀번호가 일치하지 않습니다. 다시 확인 해주세요');
		document.inputform.pwd.value = "";
		document.inputform.repwd.value = "";
		document.inputform.pwd.focus();
		return false;
	} else if(!document.inputform.name.value){
		alert('이름을 입력하세요');
		document.inputform.name.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.jumin1.value){
		alert('생년월일을 입력하세요.');
		document.inputform.jumin1.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.jumin2.value){
		alert('주민등록번호를 정확히 입력하세요.');
		document.inputform.jumin2.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.gender.value){
		alert('성별을 확인해주세요.');
		document.inputform.gender.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.wedding.value){
		alert('기혼여부를 확인해주세요.');
		document.inputform.wedding.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.frgn.value){
		alert('내외국인여부를 확인해주세요.');
		document.inputform.frgn.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.hp1.value){
		alert('휴대폰번호를 입력해주세요.');
		document.inputform.hp1.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.hp2.value){
		alert('휴대폰번호를 입력해주세요.');
		document.inputform.hp2.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.hp3.value){
		alert('휴대폰번호를 입력해주세요.');
		document.inputform.hp3.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.email1.value){
		alert('이메일을 입력하세요.');
		document.inputform.email1.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.email2.value){
		alert('이메일을 입력하세요.');
		document.inputform.email2.focus();
		return false; //다음으로 못넘김
	} else if(!document.inputform.address.value){
		alert('주소를 입력하세요.');
		document.inputform.address.focus();
		return false; //다음으로 못넘김
	} else if(document.inputform.hiddenId.value == 0){
		alert('아이디 중복확인을 눌러주세요.');
		document.inputform.dupChk.focus();
		return false;
	}
}

function findCompany(){
	var url="findCompany";
	window.open(url, "confirm", "menubar=no, width=800, height=600");
}

function nextJumin(){
	if(document.inputform.jumin1.value.length >= 6){
		document.inputform.jumin2.focus();
	}
}

function nextHp1(){ //다입력하면 다음칸으로 넘어가는함수
	if(document.inputform.hp1.value.length >= 3){
		document.inputform.hp2.focus();
	}
}

function nextHp2(){ //다입력하면 다음칸으로 넘어가는함수
	if(document.inputform.hp2.value.length >= 4){
		document.inputform.hp3.focus();
	}
}

function nextHp3(){ //다입력하면 다음칸으로 넘어가는함수
	if(document.inputform.hp3.value.length >= 4){
		document.inputform.address.focus();
	}
}

function nextHm1(){ //다입력하면 다음칸으로 넘어가는함수
	if(document.inputform.hm1.value.length >= 4){
		document.inputform.hm2.focus();
	}
}

function nextHm2(){ //다입력하면 다음칸으로 넘어가는함수
	if(document.inputform.hm2.value.length >= 4){
		document.inputform.hm3.focus();
	}
}

function nextHm3(){ //다입력하면 다음칸으로 넘어가는함수
	if(document.inputform.hm3.value.length >= 4){
		document.inputform.email1.focus();
	}
}

function selectEmailChk(){ //이메일 선택하면 자동으로 생성
	if(document.inputform.email3.value == "1"){
		document.inputform.email2.value = "";
		document.inputform.email2.focus();
	} else{
		document.inputform.email2.value = document.inputform.email3.value;
	}
}

$(function(){
	$('#marry').keyup(function(){
		var marry = $('#marry').val();
		if(marry == '1'){
			$('#wedding').css("visibility", "visible");
		} else{
			$('#wedding').css("visibility", "hidden");
		}
	});
});
/* 회원가입 끝 */

/* aside 게시판 */
var url = window.location.href.split('gm');
if(url.indexOf('/')){
	var url_split = url[1].split('/');
	if(url_split.length > 2){
		if(url_split.indexOf('?')){
			var category = url_split[2].split('?');
			//alert(category[0]);

			if(url[1] == "/admin/D_boardsSetting"){
				// alert("됨");
				$(function(){
					$("#D_boardsSetting").children().css("color", "#d3292c");
					$("#D_boardsSetting").css("font-weight", "bold");
				});
			} else if(url[1] == "/pages/D_allBoardList"){
				// alert("됨");
				$(function(){
					$("#D_allBoardList").children().css("color", "#d3292c");
					$("#D_allBoardList").css("font-weight", "bold");
				});
			} else if(url[1] == "/admin/D_allBoardAdmin"){
				// alert("됨");
				$(function(){
					$("#D_allBoardAdmin").children().css("color", "#d3292c");
					$("#D_allBoardAdmin").css("font-weight", "bold");
				});
			}
		}
	}
}
/* aside 게시판 끝 */

/* aside 인사 */
//alert(window.location.href);
var url = window.location.href.split('gm');
if(url.indexOf('/')){
	var url_split = url[1].split('/');
	if(url_split.length > 2){
		if(url_split.indexOf('?')){
			var category = url_split[2].split('?');

			if(category[0] == "K_member_manage"){
				// alert("됨");
				$(function(){
					$("#K_member_manage").children().css("color", "#d3292c");
					$("#K_member_manage").css("font-weight", "bold");
				});
			} else if(category[0] == "K_resistMemberInfo") {
				$(function(){
					$("#K_resistMemberInfo").children().css("color", "#d3292c");
					$("#K_resistMemberInfo").css("font-weight", "bold");
				});
			} else if(category[0] == "K_personal") {
				$(function(){
					$("#K_personal").children().css("color", "#d3292c");
					$("#K_personal").css("font-weight", "bold");
				});
			} else if(category[0] == "K_restoMember") {
				$(function(){
					$("#K_restoMember").children().css("color", "#d3292c");
					$("#K_restoMember").css("font-weight", "bold");
				});
			} else if(category[0] == "K_manageOrgan") {
				$(function(){
					$("#K_manageOrgan").children().css("color", "#d3292c");
					$("#K_manageOrgan").css("font-weight", "bold");
				});
			} else if(category[0] == "K_manageRank") {
				$(function(){
					$("#K_manageRank").children().css("color", "#d3292c");
					$("#K_manageRank").css("font-weight", "bold");
				});
			} else if(category[0] == "K_ourManager") {
				$(function(){
					$("#K_ourManager").children().css("color", "#d3292c");
					$("#K_ourManager").css("font-weight", "bold");
				});
			}
		}
	}
}
/* aside 인사 끝 */

/* aside 급여관리 */
//alert(window.location.href);
var url = window.location.href.split('gm');
if(url.indexOf('/')){
	var url_split = url[1].split('/');
	if(url_split.length > 2){
		if(url_split.indexOf('?')){
			var category = url_split[2].split('?');

			if(category[0] == "J_SalaryDefaultSetting"){
				// alert("됨");
				$(function(){
					$("#J_SalaryDefaultSetting").children().css("color", "#d3292c");
					$("#J_SalaryDefaultSetting").css("font-weight", "bold");
				});
			} else if(category[0] == "J_PayrollRegistration") {
				$(function(){
					$("#J_PayrollRegistration").children().css("color", "#d3292c");
					$("#J_PayrollRegistration").css("font-weight", "bold");
				});
			} else if(category[0] == "J_BasicAllowanceManagement") {
				$(function(){
					$("#J_BasicAllowanceManagement").children().css("color", "#d3292c");
					$("#J_BasicAllowanceManagement").css("font-weight", "bold");
				});
			} else if(category[0] == "J_SalaryCalculation") {
				$(function(){
					$("#J_SalaryCalculation").children().css("color", "#d3292c");
					$("#J_SalaryCalculation").css("font-weight", "bold");
				});
			} else if(category[0] == "J_PayrollInquiry") {
				$(function(){
					$("#J_PayrollInquiry").children().css("color", "#d3292c");
					$("#J_PayrollInquiry").css("font-weight", "bold");
				});
			} else if(category[0] == "J_BonusCalculation") {
				$(function(){
					$("#J_BonusCalculation").children().css("color", "#d3292c");
					$("#J_BonusCalculation").css("font-weight", "bold");
				});
			} else if(category[0] == "J_BonusInquiry") {
				$(function(){
					$("#J_BonusInquiry").children().css("color", "#d3292c");
					$("#J_BonusInquiry").css("font-weight", "bold");
				});
			} else if(category[0] == "J_Payroll") {
				$(function(){
					$("#J_Payroll").children().css("color", "#d3292c");
					$("#J_Payroll").css("font-weight", "bold");
				});
			}
		}
	}
}
/* aside 급여관리 끝 */

/* aside 전자결재 */
//alert(window.location.href);
var url = window.location.href.split('gm');
if(url.indexOf('/')){
	var url_split = url[1].split('/');
	if(url_split.length > 2){
		if(url_split.indexOf('?')){
			var category = url_split[2].split('?');

			if(category[0] == "P_createApprDocFormView"){
				// alert("됨");
				$(function(){
					$("#P_createApprDocFormView").children().css("color", "#d3292c");
					$("#P_createApprDocFormView").css("font-weight", "bold");
				});
			} else if(category[0] == "P_listApprMyRequestView") {
				$(function(){
					$("#P_listApprMyRequestView").children().css("color", "#d3292c");
					$("#P_listApprMyRequestView").css("font-weight", "bold");
				});
			} else if(category[0] == "P_listApprTempView") {
				$(function(){
					$("#P_listApprTempView").children().css("color", "#d3292c");
					$("#P_listApprTempView").css("font-weight", "bold");
				});
			} else if(category[0] == "P_listApprTodoView") {
				$(function(){
					$("#P_listApprTodoView").children().css("color", "#d3292c");
					$("#P_listApprTodoView").css("font-weight", "bold");
				});
			} else if(category[0] == "P_listApprCompleteView") {
				$(function(){
					$("#P_listApprCompleteView").children().css("color", "#d3292c");
					$("#P_listApprCompleteView").css("font-weight", "bold");
				});
			} else if(category[0] == "P_readApprAllListView") {
				$(function(){
					$("#P_readApprAllListView").children().css("color", "#d3292c");
					$("#P_readApprAllListView").css("font-weight", "bold");
				});
			} else if(category[0] == "P_listApprRejectView") {
				$(function(){
					$("#P_listApprRejectView").children().css("color", "#d3292c");
					$("#P_listApprRejectView").css("font-weight", "bold");
				});
			} else if(category[0] == "P_listApprReferenceView") {
				$(function(){
					$("#P_listApprReferenceView").children().css("color", "#d3292c");
					$("#P_listApprReferenceView").css("font-weight", "bold");
				});
			} else if(category[0] == "P_listApprDocAllAdminView") {
				$(function(){
					$("#P_listApprDocAllAdminView").children().css("color", "#d3292c");
					$("#P_listApprDocAllAdminView").css("font-weight", "bold");
				});
			} else if(category[0] == "P_managePayment") {
				$(function(){
					$("#P_managePayment").children().css("color", "#d3292c");
					$("#P_managePayment").css("font-weight", "bold");
				});
			}
		}
	}
}
/* aside 전자결재 끝 */

/* aside 일정 */
//alert(window.location.href);
var url = window.location.href.split('gm');
if(url.indexOf('/')){
	var url_split = url[1].split('/');
	if(url_split.length > 2){
		if(url_split.indexOf('?')){
			var category = url_split[2].split('?');

			if(category[0] == "O_calendar"){
				// alert("됨");
				$(function(){
					$("#O_calendar").children().css("color", "#d3292c");
					$("#O_calendar").css("font-weight", "bold");
				});
			} else if(category[0] == "O_calendarCreateView") {
				$(function(){
					$("#O_calendarCreateView").children().css("color", "#d3292c");
					$("#O_calendarCreateView").css("font-weight", "bold");
				});
			}
		}
	}
}
/* aside 일정 끝 */

/* aside 근태관리 */
//alert(window.location.href);
var url = window.location.href.split('gm');
if(url.indexOf('/')){
	var url_split = url[1].split('/');
	if(url_split.length > 2){
		if(url_split.indexOf('?')){
			var category = url_split[2].split('?');

			if(category[0] == "J_D_attendanceRegistration"){
				// alert("됨");
				$(function(){
					$("#J_D_attendanceRegistration").children().css("color", "#d3292c");
					$("#J_D_attendanceRegistration").css("font-weight", "bold");
				});
			} else if(category[0] == "J_A_management") {
				$(function(){
					$("#J_A_management").children().css("color", "#d3292c");
					$("#J_A_management").css("font-weight", "bold");
				});
			} else if(category[0] == "J_Lookup") {
				$(function(){
					$("#J_Lookup").children().css("color", "#d3292c");
					$("#J_Lookup").css("font-weight", "bold");
				});
			} else if(category[0] == "J_M_attendanceStatus") {
				$(function(){
					$("#J_M_attendanceStatus").children().css("color", "#d3292c");
					$("#J_M_attendanceStatus").css("font-weight", "bold");
				});
			} else if(category[0] == "J_CalculationHoliday") {
				$(function(){
					$("#J_CalculationHoliday").children().css("color", "#d3292c");
					$("#J_CalculationHoliday").css("font-weight", "bold");
				});
			} else if(category[0] == "J_ApplyHoliday") {
				$(function(){
					$("#J_ApplyHoliday").children().css("color", "#d3292c");
					$("#J_ApplyHoliday").css("font-weight", "bold");
				});
			} else if(category[0] == "J_UseHoliday") {
				$(function(){
					$("#J_UseHoliday").children().css("color", "#d3292c");
					$("#J_UseHoliday").css("font-weight", "bold");
				});
			}
		}
	}
}
/* aside 근태관리 끝 */