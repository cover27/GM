<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<<<<<<< HEAD
<style>
.content-list{
	border-top:1px solid #d1d1d1;
	margin:0 20px;
	margin-top:-1px;
}
.content-list .table{
	border-bottom:1px solid #eee;
}
table{
	border-spacing: 0;
	width:100%;
	max-width:100%;
	table-layout:fixed;
	border-collapse: collapse;
	background-color:#fff;
}
table caption{
	display: none;
}
caption{
	display:table-caption;
	text-align:-webkit-center;
}
colgroup{
	display:table-column-group;
}
thead{
	display:table-header-group;
	vertical-align: middle;
	border-color:inherit;
}
tr{
	display:table-row;
	vertical-align: inherit;
	border-color:inherit;
}
th{
	font-weight: bold;
	text-align: internal center;
}
td, th{
	display:table-cell;
	vertical-align: inherit;
}
.content-list .table > thead > tr > th{
	padding:5px 5px 6px;
	height:38px;
	line-height:18px;
	color:#111;
	text-align:center;
	font-weight:600;
	vertical-align: middle;
	border-bottom:1px solid #d1d1d1;
	background:#fff;
}
.content-list .table > tbody > tr > td{
	padding:3px 5px;
	height:34px;
	line-height:18px;
	color:#333;
	text-align:center;
	vertical-align:middle;
}
.table-striped > tbody > tr:nth-child(odd) > td, .table-striped > tbody > tr:nth-child(odd) > th{
	background-color:#f9f9f9;
}
tbody {
	display:table-row-group;
	vertical-align:middle;
	border-color:inherit;
}
.pagination-wrap{
	padding:6px 0 7px;
	margin-top:-1px;
	height:39px;
	text-align:center;
	border-top:1px solid #eee;
	border-bottom:1px solid #eee;
	background:#fff;
}
.pagination{
	display:inline-block;
}
.pagination > li{
	display:inline;
}
.pagination > li > a, .pagination > li > span{
	color:#222;
	float:left;
	font-weight:600;
	margin:0 2px;
	padding:4px 9px;
	min-width:25px;
	height:25px;
	text-decoration: none;
	border-radius:25px !important;
}
.btn-wrap{
	padding:8px 0 8px 0;
	text-align:right;
}
.btn-color5.br{
	border:1px solid #363636;
}
.btn-wrap .btn{
	min-width:63px;
	padding:5px 11px;
	box-shadow: 0 3px 5px #e3e3e3;
}
.btn-color5{
	background:#363636!important;
}
.todo-cate-box1{
	display:inline-block;
	width:83px;
	padding:2px 8px 1px !important;
	line-height:18px;
	text-align:center;
	font-size:11px;
	border-radius:2px;
	color:#fff;
}
.todo-cate-box2{
	display:inline-block;
	width:83px;
	padding:2px 8px 1px !important;
	line-height:18px;
	border:1px solid #ddd !important;
	background:#fff;
	text-align:center;
	font-size:11px;
	color:#767575 !important;
	border-radius:2px;
}
.content-list .table > tbody > tr > td a{
	color:#111;
	padding-left:10px;
}
.todo-cate-buuton{
	display:inline-block;
	width:83px;
	padding:1px 8px 0 !important;
	line-height:18px;
	border:1px solid #aaa !important;
	background:#fff;
	text-align:center;
	font-size:11px;
	color:#111 !important;
	border-radius:2px;
	font-weight:bold;
}
.todo-cate-box.color3, .todo-cate-box1.color3, .todo-cate-box3.color3, .todo-cate-box4.color3{
	background:#f07070;
}
.todo-cate-box.color2, .todo-cate-box1.color2, .todo-cate-box3.color2, .todo-cate-box4.color2{
	background:#59c2e6;
}
.ellipsis{
	text-overflow:ellipsis;
	white-space:nowrap;
	overlow:hidden;
	-o-text-overflow:ellipsis;
}
i.icon.imp{
	width:13px;
	height:13px;
	margin:0 0 2px 0;
	background-position:-83px -55px;
}
i.icon{
	disply:inline-block;
	background-image:url('../images/common/ic_common.png');
	margin:0 4px;
	background-repeat:no-repeat;
	vertical-align:middle;
}
</style>
=======
>>>>>>> branch 'master' of https://github.com/cover27/GM.git

<section>
	<article>
		<div class="content_header">
			<h2>내가 한 업무요청</h2>
		</div>
				<div class="content">
		<!-- 내가 한 업무요청 상단  -->
<<<<<<< HEAD
	
		<div class="">
			<form action="<c:url value='/pages/W_searchTodoTool'/>" method="post">
			<input type="hidden" name="sel_Payment" value="1">
				<div class="content-wrap">	<!-- 내가 한 업무요청의 content 전체 view -->
					<div class="table-header">		<!-- 내가 한 업무요청의 content 상위 view -->
						
						<h3>전체<span class="ml10 cnt">${cnt }</span></h3>
						
						<div class="table-search">
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
	                    	<input name="searchApprTitle" value="" type="text" class="w150 aTitle" title="문서제목" placeholder="검색어">
	                    </span>	
						<span>
							<input id="begin" type="date" title="날짜시작" name="searchStartDate" value="">
								<span>~</span>
							<input id="end" type="date" title="날짜끝" name="searchEndDate" value="" >
						</span>
		                <span>
			               <i class="fa fa-search"><input type="submit" value="검색" id="searchMessageListButton" class="btn btn-color5"></i>
		                </span>
					</div>
						
				</div>	
			</div>
				
				
				
				<!-- 내가 한 업무요청 게시글 나열 list -->
				<div class="content-list">
=======
		<%@ include file="/WEB-INF/views/pages/sub/O_header/O_listPureOrderContentView.jsp" %>
		
		<!-- 내가 한 업무요청 게시글 나열 list -->
				
>>>>>>> branch 'master' of https://github.com/cover27/GM.git
		            <table class="table table-striped" id="tblList">
		                <caption></caption>
		                <colgroup>
		                    <col style="width: 10%;">
		                    <col style="width: 30%;">
		                    <col style="width: 10%;">
		                    <col style="width: 10%;">
		                    <col style="min-width: 30%;">
		                    <col style="width: 10%;">
		                </colgroup>
		               
		                <thead>
		                    <tr>
		                        <th scope="col"><input id="checkAll" name="" onclick="selectAllTodo()" type="checkbox" value="" title="checkAll"></th>
		                        <th scope="col">
		                            <a data-sortcolumn="subject" href="#">제목</a>
		                        </th>
		                        <th scope="col">담당자</th>
		                        <th scope="col">
		                            <a data-sortcolumn="begin" href="#">요청일</a>
		                        </th>
		                        <th scope="col">
		                            <a data-sortcolumn="end" href="#">마감일</a>
		                        </th>
		                        <th scope="col">
		                            <a data-sortcolumn="state" href="#">상태</a>
		                        </th>
		                    </tr>
		                </thead>
		                
		                
		                <!-- 게시글 나열 list -->
		                <tbody>
			                <c:if test = "${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
		                            <tr style="background: rgb(249, 249, 249);">
		                                <td>
		                                    <input name="chkid" type="checkbox" title="checkbox" value="26904787" data-status="A1">
		                                </td>
		                                <td class="text-left">
		                                    <div class="ellipsis">
		                                        <a href="<c:url value='/pages/W_readOrderView?todonum=${dto.todonum}'/>">${dto.subject }</a> 
		                                    </div>
		                                </td>
		                                <td>
		                                    <div class="ellipsis" title="">${dto.b_name}</div>
		                                </td>
		                                <td>${dto.begin}</td>
		                                <td>${dto.end}</td>
		                                <td>
		                                    <a href="javascript:void(0);" onclick="todoStatusPopup('26904787', '테스트', 'A1', '0', '');">
		                                    	<span class="todo-cate-box1 color2">${dto.state}</span>
		                                    </a>
		                                </td>
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
		            
		            
		            
		            
		            <!-- 게시물 아래 <<, >> 버튼 및 업무등록, 완료 버튼 -->
		            <div class="pagination-wrap">
		            	<table>
							<tr>
								<th align="center">
									<!-- 게시글이 있으면 -->
									<c:if test="${cnt > 0}">
										<!-- 처음[◀◀] / 이전블록[◀]  -->
										<c:if test="${startPage > pageBlock}">
											<a href="<c:url value='/pages/W_listPureOrderView'/>">[◀◀]</a>
											<a href="<c:url value='/pages/W_listPureOrderView?pageNum=${endPage - pageBlock}'/>">[◀]</a>
										</c:if>
		
										<!-- 중간에 들어갈 페이지 -->
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i==currentPage}">
												<span><b>[${i}]</b></span>
											</c:if>
											<c:if test="${i!=currentPage}">
												<a href="<c:url value='/pages/W_listPureOrderView?pageNum=${i}'/>">[${i}]</a>
											</c:if>
										</c:forEach>
		
										<!-- 다음[▶] / 마지막[▶▶]  -->
										<c:if test="${pageCount > endPage}">
											<a href="<c:url value='/pages/W_listPureOrderView?pageNum=${startPage + pageBlock}'/>">[▶]</a>
											<a href="<c:url value='/pages/W_listPureOrderView?pageNum=${pageCount}'/>">[▶▶]</a>
										</c:if>
									</c:if>
								</th>
							</tr>
						</table>
		            </div>
		            
		            <div class="btn-wrap">
		                <button type="button" class="btn btn-color5 br" onclick="window.location='<c:url value='/pages/W_createSelfTaskView'/>'">업무 등록</button>
		                <button type="button" class="btn btn-color7 br" onclick="deleteTask();">삭제</button>
		            </div>
		       	</div>
	       	</form>
       	</div>
		
	</article>
</section>