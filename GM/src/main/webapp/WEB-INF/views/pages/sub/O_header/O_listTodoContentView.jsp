<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.content-wrap{
	display:table;
	position:relative;
	width:100%;
	backgroud-color: #fff;
}
.table-header{
	position:relative;
	height:50px;
	margin:0 20px;
	border-bottom:2px solid #e5a1a1;
	backgroud:#fff;
}
.table-header .listinfo{
	position:relative;
	top:11px;
	line-height:20px;
}
.table-header .listinfo select{
	float:left;
	display:inline-block;
}
.table-header .listinfo .totalnum{
	float:left;
	display:inline-block;
	margin:4px 16px 0 10px;
	color:#999;
}
.table-search{
	position:absolute;
	top:11px;
	right:0;
}
.table-search .input-unread{
	position:relative;
	float:left;
	padding-right:15px;
	line-height:26px;
}
.table-search .input-unread label{
	font-weight:normal;
}
.table-search label{
	float:left;
	margin-right:9px;
	line-height:27px;
	font-weight:600px;
}
.table-search select{
	float:left;
	margin-right:5px;
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
.w180{
	width: 180px !important;
}
.ui-step-todo{
	position:relative;
	margin:-7px 20px;
	min-height:46px;
}
.ui-step-todo .step-bar{
	position:absolute;
	top:29px;
	left:0;
	width:100%;
	height:6px;
	background:#e6e6e6;
}
.ui-step-todo label{
	position:absolute;
	top:-4px;
	cursor:pointer;
}
.ui-step-todo input{
	opacity: 0;
	vertical-align:text-top;
}
.ui-step-todo span.box{
	display:block;
	position: absolute;
	top:28px;
	left:0;
	width:16px;
	height:16px;
	border:2px solid #ccc;
	border-radius:2px;
	background:#fff;
}
.ui-step-todo span.txt{
	display: inline-block;
	position: absolute;
	top:0;
	left:-22px;
	width:60px;
	text-align:center;
	font-weight: normal;
	color:#555;
}
.w100{
	width: 100px !important;
}
.input-datepicker{
	text-align:center;
}
.btn-color7.br{
	border:1px solid #aaa;
}
.btn-color7{
	background:#fff;
	color:#111;
}
.tbl-inner{
	height:27px !important;
	min-width:30px;
	padding:2px 6px 3px 6px !important;
	margin-left:-5px !important;
	line-height:19px !important;
	border-radius:0px 3px 3px 0;
}
.btn{
	display:inline-block;
	padding:3px 11px;
	line-height:19px;
	font-size:13px;
	font-weight:600px;
	color:#fff;
	text-align:center;
	vertical-align:middle;
	border:1px solid transparent;
	border-radius:2px;
	cursor:pointer;
	white-space:nowrap;
}
.table-search .input-search{
	position:relative;
	float:left;
}
input[type="text"], input[type="password"]{
	height:27px;
	line-height:27px;
	padding:0 8px;
	border:1px solid #c3c6c9;
	border-radius:2px;
	box-shadow:0 3px 3px #f4f4f4 inset;
}
.input-datepicker{
	text-align: center;
}
input[type="checkbox"]{
	margin:0;
}
label{
	display:inline-block;
	margin-bottom:0;
}
div{
	display:block;
}
select{
	height:27px;
	padding:3px;
	color:#111;
	border:1px solid #c3c6c9;
	border-radius: 2px;
}
</style>


<div class="content-wrap">	<!-- 수신업무요청의 content 전체 view -->
		<div class="table-header">		<!-- 수신업무요청의 content 상위 view -->
			<div class="listinfo">
				<select id="pagePerRecord" name="pagePerRecord" title=" ">	
					<option value="10" selected="selected">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
			<div class="totalnum">전체<span></span></div>
			</div>
			
			<div class="table-search" style="right:262px;">
				<div class="input-unread">
					<label>
						<i class="icon imp"></i>중요
					</label>
					<input type="checkbox" id="checkboxPriority" title="중요" value="1">
				</div>
				
				<div class="input-unread w180">
                     <div class="ui-step-wrap">
                         <div class="ui-step-todo">
                             <div class="step-bar"></div>
                             <label for="statusReject" style="left: 0%;"><!-- 반려 -->
                             	<input type="checkbox" name="statusCode" title="반려" id="statusReject" value="20" checked="">
                             	<span class="box"></span><span class="txt">반려</span>
                             </label>
                             <label for="statusDelay" style="left: 33.3%;"><!-- 지연 -->
	                             <input type="checkbox" name="statusCode" title="지연" id="statusDelay" value="11" checked="">
	                             <span class="box"></span><span class="txt">지연</span>
                             </label>
                             <label for="statusNotComplete" style="left: 66.6%;"><!-- 미완료 -->
	                             <input type="checkbox" name="statusCode" title="미완료" id="statusNotComplete" value="12" checked="">
	                             <span class="box"></span><span class="txt">미완료</span>
                             </label>
                             <label for="statusComplete" style="left: 100%;"><!-- 완료 -->
	                             <input type="checkbox" name="statusCode" title="완료" id="statusComplete" value="1" checked="">
	                             <span class="box"></span><span class="txt">완료</span>
                             </label>
                         </div>
                    </div>
                </div>
				
				<input id="startDate" type="text" title="날짜시작" name="" class="input-datepicker w100" placeholder="From" value="" readonly="readonly">
				<button type="button" class="btn btn-color7 br tbl-inner">
					<i class="icon calendar"></i>
				</button>
				<span>~</span>
				<input id="endDate" type="text" title="날짜끝" name="" class="input-datepicker w100" placeholder="To" value="" readonly="readonly">
				<button type="button" class="btn btn-color7 br tbl-inner">
					<i class="icon calendar"></i>
				</button>
			</div>
			
			<div class="table-search">
				<select name="searchColumn" title="검색타입">
                        <option value="searchUser" selected="selected">요청자</option>
                        <option value="searchTitle">제목</option>
                        <option value="searchTContents">업무내용</option>
				</select>
				
				<div class="input-search">
                    <input name="searchWord" value="" type="text" class="w150 aTitle" title="검색어" placeholder="검색어">
                    <button id="searchMessageListButton" class="btn btn-color5"><i class="fa fa-search"></i><span>검색</span></button>
                </div>
			</div>
		</div>	
			
			
		
</div>