<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
function searchId() {
	var id = $('.searchId').val();
	var url = "J_searchId_sub?id=" + id;
	window.open(url, "J_searchId", "menubar=no, width=700, height=560");
}

function back(id, name) {
	opener.document.searchform.id.value = id;
	opener.document.searchform.name.value = name;
	self.close();
}

//연차/휴가일수 조회
function VacationViews() {
	var year = $("#year").val();
	var id = $("#id").val();
	var idLength = $('#id').val().length;
	var yearLength = $('#year').val().length;
	if (idLength == 0) {
		alert("아이디를 입력해주십시오.");
	}else if(yearLength == 0){
		alert("날짜를 입력해주십시오.");
	}else {
		$.ajax({
			url : '${pageContext.request.contextPath}/pages/VacationViews',
			type : 'POST',
			data : {
				'year' : year,
				'id' : id
			}, //전송할 데이터
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
	}
};
function VacationViews2() {
	var year = $("#year2").val();
	var yearLength = $('#year2').val().length;
	if(yearLength == 0){
		alert("날짜를 입력해주십시오.");
	}else {
		$.ajax({
			url : '${pageContext.request.contextPath}/pages/VacationViews2',
			type : 'POST',
			data : {
				'year' : year
			}, //전송할 데이터
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
	}
};
function search() {
	$("#search").show();
	$("#allsearch").hide();
}
function allsearch() {
	$("#allsearch").show();
	$("#search").hide();
}



</script>
<section>
	<article>
		<div class="content_header">
			<h2>연차/휴가일수 조회</h2>
		</div>
		<div class="content">
			<form name="searchform">
			<c:if test="${sys_rank == 1}">
			    <div>
			        <span><input type="button" onclick="search()" value="사원조회" style="background: #d3292c; border: solid 1px #d3292c;"></span>
			        <span><input type="button" onclick="allsearch()" value="전체조회" style="background: #d3292c; border: solid 1px #d3292c;"></span>
			    </div>
		    </c:if>
			    <div class="search-wrap mt10" style="height: 38px;">
					<div class="form-group">
						<c:if test="${sys_rank == 1}">
					        <div id="search">
					            <span class="bold5px">사업장 : </span>
					            <c:forEach var="dto" items="${dtoss}">
					                <span class="bold5px">${dto.c_name}</span>
					            </c:forEach>
					            <span class="ml50 bold5px">아이디</span>
					            <span><input type="text" class="searchId" id="id" required autofocus></span>
					            <span><a href="#" onclick="searchId()" class="find_btn"><i class="fa fa-search fa-fw"></i></a></span>
					            <span><input type="text" class="searchName" name="name"></span>
					            <span class="ml50"><b></b></span>
					            <span class="bold5px ml50">*년도별검색 : </span>
					            <span><input type="text" id="year" placeholder="예)2019" maxlength="4"></span>
					            <span><input type="button" onclick="VacationViews()" value="조회" style="background: #d3292c;"></span>
					        </div>
					        <!-- 전체보기 -->
					        <div id="allsearch" style="display:none;">
					            <span class="bold5px ml50">*년도별검색 : </span>
					            <span><input type="text" id="year2" placeholder="예)2019" maxlength="4"></span>
					            <span><input type="button" onclick="VacationViews2()" value="조회" style="background: #d3292c;"></span>
					        </div>
					    </c:if>
					    <c:if test="${sys_rank != 1}">
					        <div>
					            <span class="bold5px">사업장 : </span>
					            <c:forEach var="dto" items="${dtoss}">
					                <span class="bold5px">${dto.c_name}</span>
					            </c:forEach>
					            <span class="ml50 bold5px">아이디</span>
					            <span><input type="text" class="searchId" id="id" value="${id}" readonly></span>
					            <span class="bold5px ml50">이름 : </span>
					            <span><input type="text" class="searchName" name="name" value="${name}" readonly></span>
					            <span class="ml50 bold5px">*급여년월</span>
					            <span><input type="text" id="year" placeholder="예)2019" maxlength="4"></span>
					            <span><input type="button" onclick="VacationViews()" value="조회" style="background: #d3292c;"></span>
					        </div>
					    </c:if>
					</div>
				</div>
			</form>
			<h3>휴가일수계산</h3>
			<div id="result" class="mt20">
				<div class="table_top">
					<table>
						<colgroup>
							<col width="145px" />
							<col width="145px" />
							<col width="145px" />
							<col width="143px" />
							<col width="143px" />
							<col width="143px" />
							<col width="143px" />
							<col width="143px" />
							<col width="143px" />
							<col width="143px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
					            <th>사원번호</th>
					            <th>성명</th>
					            <th>직급</th>
					            <th>입사일</th>
					            <th>연차</th>
					            <th>연차 설정횟수</th>
					            <th>사용연차</th>
					            <th>잔여연차</th>
					            <th>휴가 설정횟수</th>
					            <th>휴가 사용수</th>
					            <th>잔여휴가</th>
					        </tr>
						</thead>
					</table>
				</div>
			    <div class="salary_info">
			    	<table>
			    		<tbody>
			    			<tr>
			    				<td colspan="11" style="height: 384px;">정보가 없습니다.</td>
			    			</tr>
			    		</tbody>
			    	</table>
			    </div>
			</div>
			<div class="notice mt30">
				<ul>
					<li>
						처리순서 : 휴가일수 조회 -> 사용 휴가일수  집계 처리 -> 휴가일수 자동계산 후 출력
					</li>
					<li>
						휴가일수 조회시 전년도 결근일수에 따라서 바뀔수 있습니다.
					</li>
					<li>
						휴가일수  : 휴가일수 미사용시 자동계산하여 상여금으로 처리 후 마감 처리를 하면  조회를 할 수 없습니다.
					</li>
					<li>
						휴가일수  조회는 해당년도 12월 31일로 마감처리가 됩니다.
					</li>
					<li>
						수정을 원하는 경우에는 인사 관리자에게 요청하여 관리자가 직접 수정할 수 있습니다.
					</li>
					<li>
						[휴가일수설정(최초1회)] 메뉴에서 이관한 자료를 삭제(재이관)하는 방법은 다음과 같습니다.
					</li>
					<li>
						[연차/휴가일수 조회] 메뉴에서 해당 사원 자료를 삭제 할 수 없습니다.
					</li>
				</ul>
			</div>
		</div>
	</article>
</section>