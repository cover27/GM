<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function selectAllTodo(){
	if( $("#checkAll").is(':checked') ){
		$("input[name=chkid]").prop("checked", true);
	}else{
		$("input[name=chkid]").prop("checked", false);
	}
}
function deleteT(){
	var delT = confirm("삭제하시겠습니까?");
	if(!document.getElementsByName('chkid')){
		alert("하나이상 선택해야 합니다.");
		return false;
	}else{
		if(delT){
			var deleT = document.getElementsByName('chkid');
			var deleArray=new Array();
			var count = 0;
			for(var i=0; i<deleT.length; i++){
				if(deleT[i].checked){
					alert(deleT[i].value);
					deleArray[count] = deleT[i].value;
					count += 1;
				}
			}
			window.location="W_listDeletePro?todonum="+deleArray;
		}
	}
}

function setAction(num){
	if(num == 0){
		document.deleteTask.action="<c:url value='/pages/W_searchTodoTool' />";
	} else{
		document.deleteTask.action="<c:url value='/pages/W_listDeletePro' />";
	}
	document.deleteTask.submit();
}

//날짜 예외처리 방법
function lastDate(){
	var lastD = $('#begin').val();
	$('#end').attr("min", lastD);
}
function firstDate(){
	var firstD = $('#end').val();
	$('#begin').attr("max", firstD);
}
</script>

<section>
	<article>
		<div class="content_header">
			<h2>내가 한 업무요청</h2>
		</div>
		
		<!-- 내가 한 업무요청 상단  -->
		<div class="content">
			<form name="deleteTask" method="post">
				<input type="hidden" name="sel_Payment" value="1">
				<div class="search-wrap">
					<div class="form-group">
						<span>
							<label class="bold5px">담당자<input name="searchUserName" value="" type="text" title="담당자" class="ml10" placeholder="담당자 이름 입력"></label>
						</span>
						<span>
							<select name="toggleSearchType" title="검색타입">
		                        <option value="subject">업무제목</option>
		                        <option value="content">업무내용</option>
							</select>
						</span>
	                    <span>
	                    	<input name="searchApprTitle" value="" type="text" title="문서제목" placeholder="검색어">
	                    </span>	
						<span>
							<input id="begin" type="date" title="날짜시작" onchange="lastDate()" max="firstD" name="searchStartDate" value="">
								<span>~</span>
							<input id="end" type="date" title="날짜끝" onchange="firstDate()" min="lastD" name="searchEndDate" value="" >
						</span>
		                <span>
			               <input type="button" value="검색" onclick="setAction(0);">
		                </span>
					</div>
				</div>
				<h3>전체<span class="ml10 cnt">${cnt }</span></h3>
				<!-- 내가 한 업무요청 게시글 나열 list -->
				<div class="table_head">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="700px" />
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">
									<input type="checkbox" id="checkAll" name="checkAll" onclick="selectAllTodo();">
								</th>
								<th scope="col">
									<a data-sortcolumn="TITLE" href="#">제목</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="REGISTERNAME" href="#">담당자</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="INSERTDATE" href="#">요청일</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="DUEDATE" href="#">마감일</a>
								</th>
								<th scope="col">
									<a data-sortcolumn="TODOSTATUS" href="#">상태</a>
								</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table_body" style="height: 551px;">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="700px" />
							<col width="200px" />
							<col width="200px" />
							<col width="200px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<c:if test = "${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
		                            <tr>
		                                <td>
		                                    <input name="chkid" id="chkid" type="checkbox" value="${dto.todonum}">
		                                </td>
		                                <td style="text-align: left; padding-left: 20px;">
	                                        <a href="<c:url value='/pages/W_readOrderView?todonum=${dto.todonum}'/>">${dto.subject }</a> 
		                                </td>
		                                <td>
		                                    <div title="">${dto.b_name}</div>
		                                </td>
		                                <td>${dto.begin}</td>
		                                <td>${dto.end}</td>
		                                <td><span>${dto.state}</span></td>
		                            </tr>
		                        </c:forEach>
		                    </c:if>
		                    <!-- 게시글이 없으면 -->
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="6" align="center">업무 요청을 한 내역이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
		       	<div class="paging">
					<c:if test="${cnt > 0}">
					    <c:if test="${startPage > pageBlock}">
					        <a href="<c:url value='/pages/W_listPureOrderView'/>"><i class="fas fa-angle-double-left"></i></a>
					        <a href="<c:url value='/pages/W_listPureOrderView?num=${num}&pageNum=${startPage - pageBlock}'/>"><i class="fas fa-angle-left"></i></a>
					    </c:if>
					
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        <c:if test="${i == currentPage}">
					            <span class="thisPage"><b>${i}</b></span>
					        </c:if>
					        <c:if test="${i != currentPage}">
					            <a href="<c:url value='/pages/W_listPureOrderView?num=${num}&pageNum=${i}'/>">${i}</a>
					        </c:if>
					    </c:forEach>
					
					    <c:if test="${pageCount > endPage}">
					        <a href="<c:url value='/pages/W_listPureOrderView?num=${num}&pageNum=${startPage + pageBlock}'/>"><i class="fas fa-angle-right"></i></a>
					        <a href="<c:url value='/pages/W_listPureOrderView?num=${num}&pageNum=${pageCount}'/>"><i class="fas fa-angle-double-right"></i></a>
					    </c:if>
					</c:if>
	            </div>	
		       	<div class="btnset">
	                <button type="button" class="btn btn-color5 br" onclick="window.location='<c:url value='/pages/W_createSelfTaskView'/>'">업무 등록</button>
	                <button type="button" class="btn btn-color7 br" onclick="setAction(1);">삭제</button>
	            </div>
	       	</form>
       	</div>
		
	</article>
</section>