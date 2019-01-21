<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="search_wrap">
	<div class="form_group">
		<table>
			<colgroup>
				<col style="width: 7%;">
				<col style="width: 33%;">
				<col style="width: 7%;">
				<col style="width: 33%;">
			</colgroup>
			<tbody>
				<tr>
					<th><label for="searchUserName">기안자</label></th>
					<td><input name="searchUserName" type="text" title="기안자"
						class="w40p"></td>
					<th><label for="searchFormName">양식명</label></th>
					<td><input name="searchFormName" type="text" title="양식명"
						class="w50p"></td>
				</tr>
				<tr>
					<th><select>
							<option>문서제목</option>
							<option>문서내용</option>
					</select></th>
					<td><input type="text" class="w80p" title="문서제목"
						name="searchApprTitle"></td>
					<th><label> 배정일 </label></th>
					<td><input type="text" title="시작일" name="searchStartDate"
						class="input_datepicker w100" placeholder="시작일">
						<button type="button" class="btn_cal">
							<i class="icon_cal"></i>
						</button> <span>~</span> <input type="text" title="종료일"
						name="searchEndDate" class="input_datepicker w100"
						placeholder="종료일">
						<button type="button" class="btn_cal">
							<i class="icon_cal"></i>
						</button></td>
				</tr>
				<tr>
					<th><label for="searchApprDocNo">문서번호</label></th>
					<td><input id="searchApprDocNo" type="text" title="문서번호"
						name="searchApprDocNo" class="w40p"></td>
				</tr>
			</tbody>
		</table>
		<div class="search_btn">
			<button type="button" id="searchApListButton" class="btn_search">
				<i class="fa fa-search fa-fw"></i> 검색
			</button>
		</div>
	</div>
</div>