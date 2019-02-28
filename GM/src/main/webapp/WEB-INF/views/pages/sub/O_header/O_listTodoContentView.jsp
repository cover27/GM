<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="search-wrap">
	<div class="form-group">
		<span class="bold5px">기간 : </span>
		<span><input id="begin" type="date" title="날짜시작" name="begin" value=""></span>
		<span>~</span>
		<span><input id="end" type="date" title="날짜끝" name="end" value="" ></span>
		<span class="ml50">
			<select name="searchColumn" title="검색타입">
				<option value="searchUser" selected="selected">요청자</option>
				<option value="searchTitle">제목</option>
				<option value="searchTContents">업무내용</option>
			</select>
		</span>
		<span><input name="searchWord" value="" type="text" title="검색어" placeholder="검색어"></span>
		<span><button id="searchMessageListButton">검색</button></span>
	</div>
</div>