<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="true" import="java.util.*" %>

<style>
table, tr, th, td{
	border:1px solid;
}
</style>


<section>
	<article>
		<div class="content_header">
			<h2>월간보기</h2>
		</div>
		
		<!-- 월간보기 내용 -->
		<div class="content_body" style="margin-top:10px;">
			<div class="fc-toolbar">
				<!-- 이전다음 -->
				<div class="fc-left" style="float:left">
					<div class="fc-button-group">
						<input type="button" id="prev" value="이전" onclick="prevmonth();">
						<input type="button" id="next" value="다음"  onclick="nextmonth();">
						<input type="button" value="오늘">
					</div>
				</div>
				
				<!-- 해당 날짜 -->
				<div class="fc-center">
					<h2><div id="Ymd"></div></h2>
				</div>
				
				
				<!-- 월간,주간,일간, 목록보기 툴바 -->
				<div class="fc-right" style="float: right">
					<div class="fc-button-group">
						<button type="button" class="fc-corner-left">월간</button>
						<button type="button" class="fc-corner">주간</button>
						<button type="button" class="fc-corner">일간</button>
						<button type="button" class="fc-corner-right">목록보기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 달력출력 -->
		<div class="fc-list" style="margin-top:40px;">
			<div class="content-list">
				
			</div>
		</div>
	</article>
</section>