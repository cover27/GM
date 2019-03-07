<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function modify(num) {
		var date = $("#date").val();
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/modify',
			type : 'POST',
			data : {
				'num' : num,
				'date' : date
			}, //전송할 데이터
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
	};
	function deleteAttended(num) {
		var date = $('#date').val();
		window.location="deleteAttended?num="+num + "&date=" + date;
	};
	function allList() {
		var date = $('#date').val();
		var textLength2 = $('#date').val().length;
		 if(textLength2 == 0){
			alert("날짜를 입력해주십시오.");
		}else {
		window.location="J_A_management?date=" + date; 
		}
	};
	//휴가승인된 목록 보기	
	function vacationList() {
		var date = $('#date').val();
		var url = "vacationList?date=" + date;
		window.open(url, "vacationList", "menubar=no, width=1000, height=520");
	}
	
	

</script>
<section>
	<article>
		<div class="content_header">
			<h2>사원 근태 관리</h2>
		</div>
		<div class="content">
			<form action="modifyUpdate" method="post">
				<div class="search-wrap">
			    	<div class="form-group">
				        <span class="bold5px">*근무일자</span>
				        <span><input type="date" id="date" name="date" value="${date}" style="position:relative; top: 0;"></span>
				        <span><input type="button" value="검색" onclick="allList()"></span>
			    	</div>
			    </div>
			    <c:if test="${date == null}">
			        <script>
			            document.getElementById('date').value = new Date().toISOString().slice(0, 10);
					</script>
			    </c:if>
			    <input type="button" value="휴가승인목록" onclick="vacationList()">
			    <div id="result" class="mt20">
			    	<div class="table_top">
			    		<table>
			    			<colgroup>
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="143px" />
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
					                <th>등록번호</th>
					                <th>사원 번호</th>
					                <th>성명</th>
					                <th>출근시간</th>
					                <th>퇴근시간</th>
					                <th>근무시간</th>
					                <th>연장근로</th>
					                <th>야간근로</th>
					                <th>지각시간</th>
					                <th>조퇴시간</th>
					                <th>기능</th>
					            </tr>
			    			</thead>
			    		</table>
			    	</div>
			        <div class="salary_info">
				        <table>
				        	<colgroup>
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="143px" />
			    				<col width="*" />
			    			</colgroup>
				            <tbody>
					            <c:if test="${cnt == 0}">
					                <tr>
					                    <td colspan="11">데이터 정보가 없습니다.</td>
					                </tr>
					            </c:if>
					            <c:if test="${cnt > 0}">
					                <c:forEach var="dtos" items="${dtos}">
					                    <c:if test="${dtos.result == 1}">
					                    <tr>
					                        <td>${dtos.num}</td>
					                        <td>${dtos.id}</td>
					                        <td>${dtos.name}</td>
					                        <td>${dtos.gos}</td>
					                        <td>${dtos.offs}</td>
					                        <td>${dtos.worktimes}</td>
					                        <td>${dtos.overtimes}</td>
					                        <td>${dtos.nighttimes}</td>
					                        <c:if test="${dtos.perceptiontimes ne '00:00'}">
					                            <td style="color: #d3292c; font-weight: bold;">${dtos.perceptiontimes}</td>
					                        </c:if>
					                        <c:if test="${dtos.perceptiontimes eq '00:00'}">
					                            <td>${dtos.perceptiontimes}</td>
					                        </c:if>
					                        <c:if test="${dtos.departuretimes ne '00:00'}">
					                            <td style="color: #d3292c; font-weight: bold;">${dtos.departuretimes}</td>
					                        </c:if>
					                        <c:if test="${dtos.departuretimes eq '00:00'}">
					                            <td>${dtos.departuretimes}</td>
					                        </c:if>
					                        <td>
					                        <input type="button" value="변경" onclick="modify('${dtos.num}')" style="background: #d3292c;">
					                        <input type="button" value="삭제" onclick="deleteAttended('${dtos.num}')">
					                        </td>
					                    </tr>
					                    </c:if>
					                    <c:if test="${dtos.result == 3}">
					                    <tr>
					                        <td>${dtos.num}</td>
					                        <td>${dtos.id}</td>
					                        <td>${dtos.name}</td>
					                        <td colspan="7">휴가처리</td>
					                        <td>
					                        <input type="button" value="변경" onclick="modify('${dtos.num}')" style="background: #d3292c;">
					                        <input type="button" value="삭제" onclick="deleteAttended('${dtos.num}')">
					                        </td>
					                    </tr>
					                    </c:if>
					                    <c:if test="${dtos.result == 4}">
					                    <tr>
					                        <td>${dtos.num}</td>
					                        <td>${dtos.id}</td>
					                        <td>${dtos.name}</td>
					                        <td>${dtos.gos}</td>
					                        <td>${dtos.offs}(반차)</td>
					                        <td>${dtos.worktimes}</td>
					                        <td>${dtos.overtimes}</td>
					                        <td>${dtos.nighttimes}</td>
					                        <c:if test="${dtos.perceptiontimes ne '00:00'}">
					                            <td style="color: #d3292c; font-weight: bold;">${dtos.perceptiontimes}</td>
					                        </c:if>
					                        <c:if test="${dtos.perceptiontimes eq '00:00'}">
					                            <td>${dtos.perceptiontimes}</td>
					                        </c:if>
					                        <c:if test="${dtos.departuretimes ne '00:00'}">
					                            <td style="color: #d3292c; font-weight: bold;">${dtos.departuretimes}</td>
					                        </c:if>
					                        <c:if test="${dtos.departuretimes eq '00:00'}">
					                            <td>${dtos.departuretimes}</td>
					                        </c:if>
					                        <td>
					                        <input type="button" value="변경" onclick="modify('${dtos.num}')">
					                        <input type="button" value="삭제" onclick="deleteAttended('${dtos.num}')">
					                        </td>
					                    </tr>
					                    </c:if>
					                </c:forEach>
					            </c:if>
				            </tbody>
				        </table>
			        </div>
			    </div>
			</form>
		</div>
	</article>
</section>