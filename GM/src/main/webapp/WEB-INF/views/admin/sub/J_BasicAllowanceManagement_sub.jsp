<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	//수정 버튼
	 /*
    * window.open("파일명", "윈도우명", "창 속성");
    * url="주소?속성=" + 속성값; → get방식
    */
	function J_ExtrapayInfoModified(num, type, state, cost, content){
  	 var url="J_ExtrapayInfoModified?num=" + num + "&type=" + type + "&state=" + state + "&cost=" + cost + "&content=" + content;
   	window.open(url, "J_ExtrapayInfoModified", "menubar=no, width=1000, height=560");
	}
	// dataType이 text인 경우
	function load2(id, content) {
		alert(id);
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/J_extrapayinfo2', //컨트롤러/basic1_sub로 가라
			type : 'POST',
			data : {
				'id' : id,
				'content' : content
			}, //전송할 데이터
			success : function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
				//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
	};

	function load(id) {
		alert(id);
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/J_extrapayinfo', //컨트롤러/basic1_sub로 가라
			type : 'POST',
			data : {
				'id' : id
			}, //전송할 데이터
			success : function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
				//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
				$('#result').html(result);
			},
			error : function() {
				alert('오류');
			}
		});
	};

	// 행 추가
	function addhang() {
		var addStaffText = '<tr name="trStaff">'
				+ '       <td><select name="type"><option value="상여금">상여금</option><option value="삭감">삭감</option></select></td>'
				+ '       <td><select name="state"><option value="지급">지급</option><option value="미지급">미지급</option></select></td>'
				+ '       <td><input type="text" name="cost" placeholder="금액" required ></td>'
				+ '       <td><input type="text" name="content" placeholder="사유" required ></td>'
				+ '       <td><button class="btn btn-default" name="delStaff">삭제</button></td>'
				+ '       button class="btn btn-default" name="delStaff">삭제</button>'
				+ '</tr>';
		var trHtml = $("tr[name=trStaff]:last"); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
		trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
	}

	//삭제 버튼
	$(document).on("click", "button[name=delStaff]", function() {
		var trHtml = $(this).parent().parent();
		trHtml.remove(); //tr 테그 삭제
	});

	//개인 상여금/삭감 목록 삭제
	function deleteInfo(num) {
		var con_test = confirm("삭제하시겠습니까?.");
		if (con_test == true) {
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/deleteInfo', //컨트롤러/basic1_sub로 가라
				type : 'POST',
				data : "num=" + num, //전송할 데이터
				success : function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
					//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
					$('#result').html(result);
				},
				error : function() {
					alert('오류');
				}
			});
		} else if (con_test == false) {
			return false;
		}
	}
	
	//수정 완료
	function J_ExtrapayInfoModifiedComplete(num){
		var con_test = confirm("수정하시겠습니까?.");
		var type = $('#type').val();
		var state = $('#state').val();
		var cost = $('#cost').val();
		var content = $('#content').val();
		if (con_test == true) {
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/J_ExtrapayInfoModifiedComplete', //컨트롤러/basic1_sub로 가라
				type : 'POST',
				data : "num=" + num + "&type=" + type + "&state=" + state + "&cost=" + cost + "&content=" + content, //전송할 데이터
				success : function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
					//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
					$('#result').html(result)
					,$("#result2").hide();

				},
				error : function() {
					alert('오류');
				}
			});
		} else if (con_test == false) {
			return false;
		}
	}
	//수정 버튼
	function J_ExtrapayInfoModified(num){
		var con_test = confirm("수정하시겠습니까?.");
		if (con_test == true) {
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/J_ExtrapayInfoModified', //컨트롤러/basic1_sub로 가라
				type : 'POST',
				data : "num=" + num, //전송할 데이터
				success : function(result) { //콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
					//변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수의 변수명result와 일치해야 한다.
					$("#result2").show()
					,$('#result2').html(result);
				},
				error : function() {
					alert('오류');
				}
			});
		} else if (con_test == false) {
			return false;
		}
	}
</script>

<section>
	<article>
		<div class="content_header">
		    <h2>기본수당 외 수당 관리</h2>
		</div>
		<div class="content">
			<div class="search-wrap">
				<div class="form-group">
					<form action="J_BasicAllowanceManagement" method="post" name="searchform">
				        <span class="bold5px">사업장 : </span>
				        <c:forEach var="dto" items="${dtoss}">
		                    <span class="bold5px">${dto.c_name}</span>
		                </c:forEach>
		                <span class="ml50 bold5px">조건 : </span>
		                <span>
			                <select name="search_title2" id="search_title2">
		                        <option value="none" selected="selected">해당없음</option>
		                        <option value="depart">부서</option>
		                        <option value="id">아이디</option>
		                    </select>
		                </span>
		                <span>
		                	<input type="text" class="search_content2" id="search_content2" name="search_content2" placeholder="검색명을 입력하세요.">
		                </span>
		                <span class="ml50 bold5px">검색년월 : </span>
		                <span>
			                <c:if test="${content == null || fn:length(content) == 0 || content eq 'none'}">
		                        <input type="text" name="search_content" placeholder="예)20180724">
		                    </c:if>
		                    <c:if test="${fn:length(content) > 0}">
		                        <input type="text" name="search_content" placeholder="${content}">
		                    </c:if>
		                </span>
		                <span>
		                	<input type="submit" value="검색">
		                </span>
				    </form>
				</div>
			</div>
			
			<div class="fleft w30p bam_left">
				<h3>기본정보</h3>
				<div>
	                <table>
	                    <tr>
	                        <td style="text-align: center; background-color: #cccccc;">사원번호</td>
	                        <td style="text-align: center; background-color: #cccccc;">성명</td>
	                        <td style="text-align: center; background-color: #cccccc;">부서</td>
	                    </tr>
	                    <c:if test="${cnt > 0}">
	                        <c:forEach var="dto" items="${dtos}">
	                            <tr id="ttr">
	                                <c:if test="${content != null}">
	                                    <!--날짜검색  -->
	                                    <td onclick="load2('${dto.id}','${content}')" style="cursor: pointer; background-color: blue;">${dto.id}</td>
	                                </c:if>
	                                <c:if test="${content == null}">
	                                    <!--이번달  -->
	                                    <td onclick="load('${dto.id}')" style="cursor: pointer; background-color: red;">${dto.id}</td>
	                                </c:if>
	                                <td>${dto.name}</td>
	                                <td>${dto.j_name}</td>
	                            </tr>
	                        </c:forEach>
	                    </c:if>
	                    <!-- 게시글이 없으면 -->
	                    <c:if test="${cnt == 0}">
	                        <tr>
	                            <td colspan="3" align="center">게시글이 없습니다. 글을 작성해주세여.</td>
	                        </tr>
	                    </c:if>
	                </table>
	                <div>
	                    <table>
	                        <!-- 페이지 컨트롤 -->
	                        <tr>
	                            <th colspan="7" align="center">
	                                <!-- 게시글이 있으면 -->
	                                <c:if test="${cnt >0}">
	                                    <!-- 처음[◀◀] / 이전블록[◀]-->
	                                    <c:if test="${startPage > pageBlock}">
	                                        <a href="J_BasicAllowanceManagement">[PageDown x2]</a>
	                                        <a href="J_BasicAllowanceManagement?pageNum=${startPage - pageBlock}">[PageDown]</a>
	                                    </c:if>
	
	
	                                    <!-- 블록내의 페이지 번호 -->
	                                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
	                                        <c:if test="${i == currentPage}">
	                                            <span><b> [${i}] </b></span>
	                                        </c:if>
	                                        <c:if test="${i != currentPage}">
	                                            <a href="J_BasicAllowanceManagement?pageNum=${i}&search_content=${content}">[${i}]</a>
	                                        </c:if>
	                                    </c:forEach>
	                                    <!-- 다음 블록[▶] /마지막[▶▶] -->
	                                    <c:if test="${pageCount > endPage}">
	                                        <a href="J_BasicAllowanceManagement?pageNum=${startPage + pageBlock}">[▶]</a>
	                                        <a href="J_BasicAllowanceManagement?pageNum=${pageCount}">[▶▶]</a>
	                                    </c:if>
	                                </c:if>
	                            </th>
	                        </tr>
	                    </table>
	                </div>
	            </div>
			</div>
		    <div class="fright w70p" style="background:blue;height:300px;">
		    
		    </div>
		
		    <div>
		        <div id="result" class="fleft">
		            <h3>기본수당외 수당등록</h3>
		            <table border="1">
		                <tr>
		                    <td style="text-align: center; background-color: #cccccc;" width="25%">상여금/삭감</td>
		                    <td style="text-align: center; background-color: #cccccc;" width="25%">지급/공제</td>
		                    <td style="text-align: center; background-color: #cccccc;" width="25%">금액</td>
		                    <td style="text-align: center; background-color: #cccccc;" width="25%">비고</td>
		                </tr>
		                <tr>
		                    <td colspan="4">사원번호를 클릭 하십시오.</td>
		                </tr>
		            </table>
		        </div>
		    </div>
		    <div id="result2">
		        <h3>수정 할 목록</h3>
		    </div>
		</div>
	</article>
</section>