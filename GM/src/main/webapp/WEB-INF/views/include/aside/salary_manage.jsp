<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">

<aside>
	<!-- 사용 안하는 사이드바
    <div class="sidebar"></div>
     -->
    <div class="nav">
        <div class="nav_title">
            <h2>급여관리</h2>
            <div class="category">
                <ul>
                	<li>
                		<span>급상여관리</span>
                		<ul>
                			<li><a href="J_SalaryDefaultSetting">급여 기본정보 관리</a></li>
                			<li><a href="J_BasicAllowanceManagement">기본수당 외 수당 관리</a></li>
                			<li><a href="J_TimeAttendanceSalaryBonusAnnual">근태/급여/상여/연차마감 관리</a></li>
                			<li><a href="J_SalaryCalculation">급여 계산</a></li>
                			<li><a href="J_PayrollInquiry">급여 조회</a></li>
                			<li><a href="J_BonusCalculation">상여 계산</a></li>
                			<li><a href="J_BonusInquiry">상여 조회</a></li>
                			<li><a href="J_Payroll">급여 대장</a></li>
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