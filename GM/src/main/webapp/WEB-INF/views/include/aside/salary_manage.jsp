<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/J_style.css" />

<script type="text/javascript">
	// alert(window.location.href);
	var url = window.location.href.split('gm');
	// alert(url[1]);
	
	if(url[1] == "/admin/J_SalaryDefaultSetting"){
		// alert("됨");
		$(function(){
			$("#J_SalaryDefaultSetting").children().css("color", "#d3292c");
			$("#J_SalaryDefaultSetting").css("font-weight", "bold");
		});
	} else if(url[1] == "/admin/J_PayrollRegistration") {
		$(function(){
			$("#J_PayrollRegistration").children().css("color", "#d3292c");
			$("#J_PayrollRegistration").css("font-weight", "bold");
		});
	} else if(url[1] == "/admin/J_BasicAllowanceManagement") {
		$(function(){
			$("#J_BasicAllowanceManagement").children().css("color", "#d3292c");
			$("#J_BasicAllowanceManagement").css("font-weight", "bold");
		});
	} else if(url[1] == "/admin/J_SalaryCalculation") {
		$(function(){
			$("#J_SalaryCalculation").children().css("color", "#d3292c");
			$("#J_SalaryCalculation").css("font-weight", "bold");
		});
	} else if(url[1] == "/admin/J_PayrollInquiry") {
		$(function(){
			$("#J_PayrollInquiry").children().css("color", "#d3292c");
			$("#J_PayrollInquiry").css("font-weight", "bold");
		});
	} else if(url[1] == "/admin/J_BonusCalculation") {
		$(function(){
			$("#J_BonusCalculation").children().css("color", "#d3292c");
			$("#J_BonusCalculation").css("font-weight", "bold");
		});
	} else if(url[1] == "/admin/J_BonusInquiry") {
		$(function(){
			$("#J_BonusInquiry").children().css("color", "#d3292c");
			$("#J_BonusInquiry").css("font-weight", "bold");
		});
	} else if(url[1] == "/admin/J_Payroll") {
		$(function(){
			$("#J_Payroll").children().css("color", "#d3292c");
			$("#J_Payroll").css("font-weight", "bold");
		});
	} else {
		alert("카테고리 로딩 오류");
	}
	
</script>

<aside>
    <div class="nav">
        <div class="nav_title">
            <h2>급여관리</h2>
            <div class="category">
                <ul>
                	<li>
                		<span>급상여관리</span>
                		<ul>
                			<li id="J_SalaryDefaultSetting"><a href="<c:url value='/admin/J_SalaryDefaultSetting' />">급여 기본정보 관리</a></li>
                			<li id="J_PayrollRegistration"><a href="<c:url value='/admin/J_PayrollRegistration' />">급여등록</a></li>
                			<li id="J_BasicAllowanceManagement"><a href="<c:url value='/admin/J_BasicAllowanceManagement' />">기본수당 외 수당 관리</a></li>
                			<li id="J_SalaryCalculation"><a href="<c:url value='/admin/J_SalaryCalculation' />">급여 계산</a></li>
                			<li id="J_PayrollInquiry"><a href="<c:url value='/admin/J_PayrollInquiry' />">급여 조회</a></li>
                			<li id="J_BonusCalculation"><a href="<c:url value='/admin/J_BonusCalculation' />">상여 계산</a></li>
                			<li id="J_BonusInquiry"><a href="<c:url value='/admin/J_BonusInquiry' />">상여 조회</a></li>
                			<li id="J_Payroll"><a href="<c:url value='/admin/J_Payroll' />">급여 대장</a></li>
                		</ul>
                	</li>
                	<li>
                		<span><a href="o09.jsp">급여 기초정보 설정/조회</a></span>
                	</li>
                </ul>
            </div>
        </div>
    </div>
    
</aside>