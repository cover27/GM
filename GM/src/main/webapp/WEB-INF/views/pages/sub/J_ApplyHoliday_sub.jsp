<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<<script type="text/javascript">

function doOpenCheck(chk){
    var obj = document.getElementsByName("fullhalfday");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }else if (obj[0] == chk){
        	$("#end2").show();
        	$("#end3").show();
        	document.getElementById("day").value = '';
        }else if(obj[1] == chk){
        	$("#end2").hide();
        	$("#end3").hide();
        	document.getElementById("day").value = '0.5';
        }
    }
}

function cancelapplication(num) {
	var con_test = confirm("휴가 신청취소  하시겠습니까?.");
	if (con_test == true) {
	//var num = $("#num").val();
	window.location="cancelapplication?num="+num;
	} else if (con_test == false) {
		return false;
	}
};
function handler(e){
	var strDate = $('#begin').val();
	var endDate = $('#end').val();
	
	var date1 = new Date(strDate); // 2017-11-30
    var date2 = new Date(endDate); // 2017-12-6
    var count = 0;
while(true) {  
    var temp_date = date1;
    if(temp_date.getTime() > date2.getTime()) {
        console.log("count : " + count);
        break;
    } else {
        var tmp = temp_date.getDay();
        if(tmp == 0 || tmp == 6) {
            // 주말
            console.log("주말");
        } else {
            // 평일
            console.log("평일");
            count++;         
        }
        temp_date.setDate(date1.getDate() + 1); 
    }
}
	

	/* var arr1 = strDate.split('-');
	var arr2 = endDate.split('-');
	var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
	var diff = dat2 - dat1;
	var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨 */
	document.getElementById("day").value =  count;
	
	//document.write("* 일수 차이 : " + parseInt(diff/currDay) + " 일<br/>");
}

//셀렉트 박스 선택시
function chageLangSelect(){
	var aaa = $('select').val();
	// 2는 연차
	// 1는 휴가
	if(aaa == 2){
		$("#qksck").show();
		$("#end2").show();
		$("#end3").show();
	}else if(aaa == 1){
		$("#qksck").hide();
		$("#end2").show();
		$("#end3").show();
	}
}
</script>
<section>
	<article>
	
		<div class="content_header">
			<h2>월 근태 현황</h2>
		</div>
		<div class="content">
		    <form action="leaveapplication" method="post">
		    	<div class="search-wrap mt10" style="height: 38px;">
					<div class="form-group">
			            <span class="bold5px">사업장 : </span>
			            <c:forEach var="dto" items="${dtoss}">
			                <span class="bold5px">${dto.c_name}</span>
			            </c:forEach>
			            <span class="ml50 bold5px">아이디</span>
			            <span><input type="text" class="searchId" id="id" value="${id}" readonly></span>
			            <span class="bold5px ml50">이름 : </span>
			            <span><input type="text" class="searchName" name="name" value="${name}" readonly></span>
			        </div>
		        </div>
		        <h3>*휴가신청내역</h3>
		        <div class="table_top">
		        	<table>
		        		<thead>
		        			<tr>
			                    <th>휴가번호</th>
			                    <th>신청일</th>
			                    <th>휴가구분</th>
			                    <th>전일/반일</th>
			                    <th>시작일</th>
			                    <th>종료일</th>
			                    <th>일수</th>
			                    <th>상태</th>
			                    <th>휴가사유</th>
			                    <th>취소</th>
			                </tr>
		        		</thead>
		        	</table>
		        </div>
		        <div class="salary_info" style="height: 289px;">
		            <table>
		                <tbody>
		                	<c:if test="${cnt == 0}">
			                    <tr>
			                        <td colspan="9" style="height:286px;">*데이터 정보가 없습니다.</td>
			                    </tr>
			                </c:if>
			                <c:if test="${cnt > 0}">
			                    <c:forEach var="dto" items="${dtos}">
			                        <tr>
			                            <td id="num" name="num">${dto.num}</td>
			                            <td>${dto.applicationdate}</td>
			                            <td>
			                                <c:if test="${dto.types == 1}">연차</c:if>
			                                <c:if test="${dto.types == 2}">휴가</c:if>
			                            </td>
			                            <td>
			                                <c:if test="${dto.fullhalfday == 1}">전일</c:if>
			                                <c:if test="${dto.fullhalfday == 2}">반일</c:if>
			                            </td>
			                            <td>${dto.begin}</td>
			                            <td>${dto.end}</td>
			                            <c:if test="${dto.fullhalfday == 2}">
			                                <td>${dto.day/2}</td>
			                            </c:if>
			                            <c:if test="${dto.fullhalfday == 1}">
			                                <td>${dto.day}</td>
			                            </c:if>
			                            <td>
			                                <c:if test="${dto.state == 2}">승인대기</c:if>
			                                <c:if test="${dto.state == 3}">승인취소</c:if>
			                            </td>
			                            <td>${dto.content}</td>
			                            <td><input type="button" value="신청취소" onclick="cancelapplication('${dto.num}')"></td>
			                        </tr>
			                    </c:forEach>
			                </c:if>
		                </tbody>
		            </table>
		        </div>
		        <h3 class="mt30">*휴가신청</h3>
		        <div class="salary_info_result mt10">
		            <table>
		            	<colgroup>
		            		<col width="10%" />
		            		<col width="23%" />
		            		<col width="10%" />
		            		<col width="23%" />
		            		<col width="10%" />
		            		<col width="23%" />
		            	</colgroup>
		                <tbody>
			                <tr>
			                    <th>휴가신청일</th>
			                    <td><input type="date" name="applicationdate" id="applicationdate"></td>
			                    <th>휴가구분</th>
			                    <td>
			                        <select name="types" onchange="chageLangSelect()" id="select">
			                            <option value="1">휴가</option>
			                            <option value="2">연차</option>
			                        </select>
			                    </td>
			                    <th>전일/반일</th>
								<td>
									<table>
										<tr>
											<td style="border:0;">
												<span style="position: relative; top: 2px;">
													<label>
														<input name="fullhalfday" type="checkbox" value="1" onclick="doOpenCheck(this); " checked style="width: 14px;">
														<span style="position: relative; bottom: 3px;">전차</span>
													</label>
												</span>
											</td>
											<td style="border:0; text-align: left;">
												<span class="ml50" style="position: relative; top: 2px; display:none;" id="qksck">
													<label>
														<input name="fullhalfday" type="checkbox" value="2" onclick="doOpenCheck(this);" style="width: 14px;">
														<span style="position: relative; bottom: 3px;">반차</span>
													</label>
												</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
			                <tr>
			                    <th>휴가기간</th>
			                    <td>
			                    	<span style="margin: 0 9px;"><input type="date" id="begin" name="begin" style="width:45%;"></span>
			                    	<span id="end3" > ~ </span>
			                    	<span id="end2" ><input type="date" id="end" name="end" onchange="handler(event);" style="width:45%;"></span>
			                    </td>
			                    <th>일수</th>
			                    <td>
			                    	<input type="text" name="day" id="day" required>
			                    </td>
			                    <th>휴가사유</th>
			                    <td><input type="text" name="content"></td>
			                </tr>
		                </tbody>
		            </table>
		            <div class="fright mt10"><input type="submit" value="신청"></div>
		            <div class="notice" style="margin-top: 60px;">
		            	<ul>
		            		<li>
		            			휴가구분은 [휴가항목설정]에서 추가 또는 변경할 수 있습니다.
		            		</li>
		            		<li>
		            			휴가신청 작성 후 전자결재 처리 순서입니다
		            			<ol>
		            				<li style="list-style:decimal;">
		            					최초 입력 후(전자결재 사용시) : 휴가 신청 등록 -> 전자결재(완료)
		            				</li>
		            				<li style="list-style:decimal;">
		            					최초 입력 후(전자결재 미사용시) : 휴가 신청 등록과 동시에 전자결재(자동승인) 처리
		            				</li>
		            			</ol>
		            		</li>
		            		<li>
		            			[휴가신청] 메뉴에서 전자결재가 완료(승인) 된 경우, 해당 휴가내역은 수정, 삭제가 불가합니다. 실제사용여부를 미체크 후 재등록하시기 바랍니다.
		            		</li>
		            		<li>
		            			휴가신청시, 각종 휴일을 휴가기간에서 제외하시고자 할 경우, [휴일설정]에서 해당 일자를 휴일로 지정하시기 바랍니다.
		            		</li>
		            	</ul>
		            </div>
		        </div>
		        <script>
		            document.getElementById('applicationdate').value = new Date().toISOString().slice(0, 10);
		
		        </script>
		        <script>
		            document.getElementById('begin').value = new Date().toISOString().slice(0, 10);
		
		        </script>
		        <script>
		            document.getElementById('end').value = new Date().toISOString().slice(0, 10);
		
		        </script>
		    </form>
		</div>
	</article>
</section>