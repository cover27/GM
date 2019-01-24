<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout_main.css">
<link rel="stylesheet" href="${path}css/aside_main.css">
<link rel="stylesheet" href="${path}css/content_main.css">
<%@ page import="com.spring.gm.vo.MemberVO" %>

<aside>
	<h1></h1>
	<div class="user_info">
		<ul>
			<li><a href="#"> <img src="${path}images/profile_default.png">
			</a></li>
			<li><a href="#"><%=((MemberVO)request.getSession().getAttribute("loginInfo")).getName() %></a></li>
		</ul>
	</div>
	<div class="admin">
		<i class="icon user-admin"></i> <a href="setting_admin">회사 관리자</a>
	</div>
	<div class="schedule">
		<div class="main_calendar">
			<div>
				<div class="main_calendar_header">
					<a href="#" class="main_calendar_prev"> <span>&lt;</span>
					</a> <a href="#" class="main_calendar_next"> <span>&gt;</span>
					</a>
					<div class="main_calendar_title">
						<span class="main_calendar_month"> 1 </span> <span
							class="main_calendar_year"> 2019 </span>
					</div>
				</div>
				<table class="main_calendar_cal">
					<thead>
						<tr>
							<th><span title="Sunday">Su</span></th>
							<th><span title="Monday">Mo</span></th>
							<th><span title="Tuesday">Tu</span></th>
							<th><span title="Wednesday">We</span></th>
							<th><span title="Thursday">Th</span></th>
							<th><span title="Friday">Fr</span></th>
							<th><span title="Saturday">Sa</span></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><a href="#">1</a></td>
							<td><a href="#">2</a></td>
							<td><a href="#">3</a></td>
							<td><a href="#">4</a></td>
							<td><a href="#">5</a></td>
						</tr>
						<tr>
							<td><a href="#">6</a></td>
							<td><a href="#">7</a></td>
							<td><a href="#">8</a></td>
							<td><a href="#">9</a></td>
							<td><a href="#">10</a></td>
							<td><a href="#">11</a></td>
							<td><a href="#">12</a></td>
						</tr>
						<tr>
							<td><a href="#">13</a></td>
							<td><a href="#">14</a></td>
							<td><a href="#">15</a></td>
							<td><a class="cal_today" href="#">16</a></td>
							<td><a href="#">17</a></td>
							<td><a href="#">18</a></td>
							<td><a href="#">19</a></td>
						</tr>
						<tr>
							<td><a href="#">20</a></td>
							<td><a href="#">21</a></td>
							<td><a href="#">22</a></td>
							<td><a href="#">23</a></td>
							<td><a href="#">24</a></td>
							<td><a href="#">25</a></td>
							<td><a href="#">26</a></td>
						</tr>
						<tr>
							<td><a href="#">27</a></td>
							<td><a href="#">28</a></td>
							<td><a href="#">29</a></td>
							<td><a href="#">30</a></td>
							<td><a href="#">31</a></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="calendar_today">오늘의 일정을 등록해 보세요.</div>
	</div>
	<div class="favorite_member">
		<h2>
			<a href="#">자주 연락하는 사람들</a>
		</h2>
		<div class="favorite_member_tabs">
			<ul>
				<li class="active"><a href="#">조직도</a></li>
				<li><a href="#">주소록</a></li>
			</ul>
		</div>
		<div class="favorite_member_list">
			<ul>
				<li><span>자주 연락하는 동료를 등록해보세요.</span></li>
				<li><span>자주 연락하는 동료를 등록해보세요.</span></li>
				<li><span>자주 연락하는 동료를 등록해보세요.</span></li>
			</ul>
		</div>
	</div>
</aside>