<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
.ellipsis{
	text-overflow:ellipsis;
	white-space:nowrap;
	overlow:hidden;
	-o-text-overflow:ellipsis;
}
.todo-cate-box5.color7{
	border: 1px solid #ddd !important;
    background: #fff !important;
    color: #111 !important;
    padding: 2px 6px 2px 6px;
    display: inline-block;
    height: 20px;
    line-height: 16px;
}
.todo-cate-box5{
    display: inline-block;
    height: 17px;
    padding: 0px 4px 0px 2px;
    margin-top: -1px;
    line-height: 17px;
    vertical-align: text-top;
    text-align: center;
    font-size: 11px;
    color: #fff;
    border-radius: 2px;
}
</style>


<section>
	<article>
		<div class="content_header">
			<h2>업무 보관함</h2>
		</div>
		
		
		<!-- 업무 보관함 상단  -->
		<%@ include file="/WEB-INF/views/pages/sub/O_header/O_listMenuStoredTaskContentView.jsp" %>
		
		<!-- 업무 보관함 게시글 나열 list -->
		<div class="content-list">
	            <table class="table table-striped" id="tblList">
	                <caption></caption>
					<colgroup>
	                    <col style="width: 40px;">
	                    <col style="width: 80px;">
	                    <col style="width: 120px;">
	                    <col style="width: *;">
	                    <col style="width: 140px;">
	                    <col style="width: 90px;">
	                    <col style="width: 120px;">
	                    <col style="width: 100px;">
	                    <col style="width: 100px;">
               		</colgroup>
	                <thead>
			            <tr>
			                <th scope="col">번호</th>
			                <th scope="col">
			                    <a data-sortcolumn="TASKTYPE" href="#">유형<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
			                </th>
			                <th scope="col">
			                    <a data-sortcolumn="CATEGORYNAME" href="#">업무 유형<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
			                </th>
			                <th scope="col">
			                    <a data-sortcolumn="TITLE" href="#">제목<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
			                </th>
			                <th scope="col">구분</th>
			                <th scope="col">
			                    <a data-sortcolumn="REGISTER" href="#">등록자<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
			                </th>
			                <th scope="col">
			                    <a data-sortcolumn="REGISTDATE" href="#">등록일<i class="fa fa-caret-down active"><span class="blind">내림차순</span></i></a>
			                </th>
			                <th scope="col">상태</th>
			                <th scope="col">확인</th>
			            </tr>
			        </thead>
	                
	                
	                <!-- 게시글 나열 list -->
	                <tbody>
	                    <tr class="important" style="background: rgb(249, 249, 249);">
                        <td>1</td>
                        <td>업무 보고</td>
                        <td>업무 유형</td>
                        <td class="text-left">
                            <div class="ellipsis" title="업무보고">업무보고</div>
                        </td>
                        <td>
                        	<span class="todo-cate-box5 color7"><a href="javascript:void(0);" onclick="goURLBtn('1', '2', '26950244', 'U260222')">등록</a></span>
                            <span class="todo-cate-box5 color7"><a href="javascript:void(0);" onclick="goURLBtn('2', '2', '26950244', 'U260222')">수신</a></span>
                            <span class="todo-cate-box5 color7"><a href="javascript:void(0);" onclick="goURLBtn('3', '2', '26950244', 'U260222')">참조</a></span>
                        </td>
                        <td>오정</td>
                        <td>등록일</td>
                        <td>
                            <a href="javascript:void(0);" onclick="todoStatusPopup('26950244', '업무보고');">
                            	<span class="todo-cate-box2">승인완료</span>
                            </a>
                        </td>
                        <td>
                            <a href="javascript:void(0);" onclick="todoReadStatusPopup('26950244', '2','업무보고', 'B', '0', '');">
                            	<span class="todo-cate-buuton">읽음확인</span>
                            </a>
                        </td>
                    </tr>
		        	</tbody>
	            </table>
	            
	            
	            <!-- 게시물 아래 <<, >> 버튼 및 업무등록, 완료 버튼 -->
	            <div class="pagination-wrap">
	            	<ul class="pagination">
	            		<li>
	            			<a href="javascript:void(0)" class="disabled">
	            				<i class="fa fa-chevron-left"></i>
	            				<i class="fa fa-chevron-left"></i>
	            				<span class="none">first</span>
	            			</a>
	            		</li>
	            		<li>
	            			<a href="javascript:void(0)" class="disabled">
	            				<i class="fa fa-chevron-left"></i>
	            				<span class="none">previous</span>
	            			</a>
	            		</li>
	            		<li class="active">
	            			<a href="javascript:void(0)">1</a>
	            		</li>
	            		<li>
	            			<a href="javascript:void(0)" class="disabled">
	            				<i class="fa fa-chevron-right"></i>
	            				<span class="none">next</span>
	            			</a>
	            		</li>
	            		<li>
	            			<a href="javascript:void(0)" class="disabled">
	            				<i class="fa fa-chevron-right"></i>
	            				<i class="fa fa-chevron-right"></i>
	            				<span class="none">last</span>
	            			</a></li>
	            	</ul>
	            </div>
	            <script>pageMoveAction = function(inputName, formId, movePageIndex) { jQuery('input[name=' + inputName + ']', formId).val(movePageIndex); jQuery('input[name=action]', formId).val('pagePerRecord');};</script>
	           
	            <input name="pageIndex" type="hidden" value="1" title="현재 페이지">
	            
        </div>
		
	</article>
</section>