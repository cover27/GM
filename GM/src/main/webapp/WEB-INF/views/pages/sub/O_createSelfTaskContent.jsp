<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.content-wrap{
	min-width:830px;
	position:relative;
	width:100%;
	background-color:#fff;
}
.content-write{
	margin-bottom:30px;
}
.content-write .table th{
	padding:4px 10px 5px;
	width:120px;
	line-height: 28px;
	vertical-align:middle;
	color:#111;
	text-align:right;
	font-weight:600;
	border-botton:1px solid #e5e5e5;
	background-color:#f5f5f5;
}
.text-point-b{
	padding-right:3px;
	color:#f05050 !important;
	font-weight:bold;
}
.form-block table td{
	border-bottom:1px solid #e8e8e8;
}
input[type="radio"]{
	margin:0 0 1px;
}
.textcolor11{
	color:#ed1c24 !important;
}
.fnone{
	float:none !important;
}
input[type="text"], input[type="password"]{
	height:27px;
	line-height:27px;
	padding:0 8px;
	border:1px solid #c3c6c9;
	border-radius:2px;
	box-shadow:0 3px 3px #f4f4f4 inset;
}
.form-control{
	display:inline-block;
	width:100%;
	border:1px solid #c3c6c9;
	border-radius:2px;
	font-size:12px;
	color:#555;
	line-height:1.42857;
}
.fileup_t{
	position: relative;
	padding: 12px 0 7px 10px;
	border-bottom:1px solid #E5e5e5;
}
.fileup_t h3{
	font-size:15px;
	font-weight: bold;
}
.fileup h3{
	background:url("../img/ic_attach.gif") no-repeat scroll 0 3px transparent;
	padding-left:12px;
}
.fileup_t div.extendButton{
	position: absolute;
	right:12px;
	top:19px;
}
.content-write .table td{
	padding:4px 10px 5px;
	line-height:28px;
	vertical-align: middle;
	text-align:left;
	color:#111;
	border-bottom:1px solid #e5e5e5;
	background-color:#fff;
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
.icon.calendar{
	height:18px;
	width:18px;
	background:url(../../images/theme/theme01/ic_theme01.png) 0 0 no-repeat;
}
.tbl-inner i{
	margin:0;
}
i.icon{
	display:inline-block;
	background-image: url('../images/common/ic_common.png');
	margin:0 4px;
	background-repeat: no repeat;
	vertical-align:middle;
}
.blind{
	position:absolute;
	left:-10000px;
	top:-10000px;
	width:0;
	height: 0;
	font-size:0;
}
.timepicker-wrap{
	display:inline-block;
	vertical-align:middle;
	width:90px;
}
.timepicker-wrap .bootstrap-timepicker{
	line-height: 13px;
}
.bootstrap-timepicker{
	position:relative;
}
.input-group{
	position:relative;
	display:table;
	border-collapse: separate;
}
.timepicker-wrap .input-timepicker{
	width:60px;
	border-right:none;
}
.bootstrap-timepicker input{
	border-top-left-radius:3px !important;
	border-bottom-left-radius:3px !important;
}
.timepicker-wrap input{
	border-radius:2px 0 0 2px !important;
}
.table td .btn-color5.br{
	border:1px #bbb solid;
}
.table td .btn-color5{
	background:#fff !important;
}
.bootstrap-timepicker .input-group-addon{
	cursor:pointer;
}
.btn-color5.br{
	border:1px solid #363636;
}
.input-group .btn{
	border-top-left-radius:0 !important;
	border-bottom-left-radius:0 !important;
}
.timepicker-wrap .btn{
	border-radius:0 2px 2px 0;
	padding:3px 6px 2px;
	min-width:30px;
}
.timepicker-wrap .btn .fa{
	position:relative;
	top:1;
	font-size:18px;
	color:#ff757f;
}
.table td .btn-color5 i{
	color:#fd7d86 !important;
}
.fa{
	display:inline-block;
	font:normal normal normal 14px/1 FontAwesome;
	font-size:inherit;
	text-rendering:auto;
	-webkit-font-smoothing:antialiased;
	-moz-osx-font-smoothing:grayscale;
}
.ml10{
	margin-left:10px !important;
}
.label-group input[type=checkbox]{
	margin-right:4px;
}
.label-group label:last-child{
	margin-right:0px;
}
.label-group label{
	margin-right:10px;
}
input[type="checkbox"]{
	margin:0;
}
.todo_request_btn.todo_comp{
	left:61px;
	width:208px;
	padding:15px 0px 0px 0px;
}
.todo_request_btn{
	padding:5px 10px;
	width:200px;
	top:32px;
	left:66px;
	position:absolute;
	border:2px solid #888;
	border-radius: 6px;
	background:#fffeec;
}
.bubble{
	position:absolute;
	width:200px;
	height:auto;
	padding:0px;
	border:solid 2px #ff757f;
	background:#ffffff;
	z-index:9;
}
.todo_request_btn i.close{
	position:absolute;
	top:0px;
	right:0px;
	padding:0;
	width:20px;
	height:20px;
	border:none;
	background:url(../images/common/btn_close.png) no-repeat 50% 50%;
	cursor:pointer;
}
.todo_request_btn.todo_comp ul li{
	line-height:17px;
	color:#555;
	font-weight: bold;
	padding:6px 6px;
}
li:not(.itemContentLi){
	list-style:none;
}
.todo_request_btn.todo_comp ul li span{
	font-weight: blod;
}
.todo_request_btn.todo_incomp{
	left:225px;
	width:214px;
	padding:15px 0px 0px 0px;
}
.todo_request_btn.todo_incomp ul li{
	line-height: 17px;
	color:#555;
	font-weight:bold;
	padding:6px 6px;
}
.todo_request_btn.todo_incomp ul li span{
	font-weight:bold;
}
.input-group div.tagsinput{
	border-right:none;
	border-radius:2px 0 0 2px;
	overflow-y:auto;
	max-height: 84px;
}
div.tagsinput{
	background:#ffffff;
	width:100%;
	height:auto;
	padding:0 8px;
	border:1px solid #c3c6c9;
	border-radius: 2px;
}
div.tagsinput input{
	width:80px;
	margin:0px;
	font-family:helvetica;
	font-size:12px;
	border:1px solid transparent;
	padding:0 5px;
	height:21px !important;
	line-height:20px;
	background:transparent;
	outline:0;
	margin:2px 4px 2px 0;
	vertical-align: middle;
}
.ml15{
	margin-left:15px !important;
}
.content-write .form-group{
	position:relative;
	margin-bottom: 0;
	padding:0;
}
.mt10{
	margin-top:10px !important;
}
.fileup_c .fileAttach:nth-child(2){
	margin-top:5px;
}
.plupload_wrapper{
	width:100%;
}
.plupload_wrapper{
	font:normal 11px Verdana,sans-serif;
	width:100%;
	min-width:520px;
	line-height: 12px;
}
.plupload_wrapper .ui-widget-content{
	border:none;
}
.plupload_container{
	min-height:200px;
}
.plupload_container{
	height: 300px;
	min-height: 300px;
	position:relative;
}
.plupload_wrapper *{
	box-sizing:content-box;
}
div.plupload_header{
	display:none;
}
.plupload_header{
	background:#2A2C2E url('../img/backgrounds.gif') repeat-x;
}
.plupload_header_content{
	background:url('../img/backgrounds.gif') no-repeat 0 -317px;
	min-height:56px;
	padding-left:60px;
	color:#fff;
}
.plupload_header_content{
	height:56px;
	padding:0 160px 0 60px;
	position: relative;
}
.plupload_logo{
	width:40px;
	height:40px;
	background:url('../img/plupload.png') no-repeat 0 0;
	position:absolute;
	top:8px;
	left:8px;
}
.plupload_header_title{
	font:normal 18px sans-serif;
	padding:6px 0 3px;
}
.plupload_header_title{
	font:normal 18px sans-serif;`
	line-height: 19px;
	padding:6px 0 3px;
}
.plupload_header_text{
	font:normal 12px sans-serif;
}
.plupload_filelist_header{
	padding:3px 10px;
}
.plupload_filelist_header{
	border-bottom:10px solid #e5e5e5;
	height:20px;
}
.plupload_filelist_header, .plupload_filelist_footer{
	background:#DFDFDF;
	padding:8px 8px;
	color:#42454A;
}
.plupload_filelist{
	margin:0;
	padding:0;
	list-style:none;
}
.plupload_filelist{
    border-collapse: collapse;
    border-left: none;
    border-right: none;
    margin: 0;
    padding: 0;
    width: 100%;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
}
.plupload_filelist .plupload_file_name{
	width: 205px; 
    white-space: nowrap;
    text-overflow: ellipsis;
}
.plupload_view_list .plupload_file_size, .plupload_view_list .plupload_file_status, .plupload_filelist_footer .plupload_file_size, .plupload_filelist_footer .plupload_file_status{
    text-align: right;
    width: 52px;
}
.plupload_filelist_header td{
	background-color: #f5f5f5 !important;
}
.plupload_file_size, .plupload_file_status, .plupload_file_action{
	text-align: right;
}
.plupload_file_size, .plupload_file_status, .plupload_progress{
    float: right;
    width: 100px;
}
.plupload_file_status{
    color: #777;
}
.plupload_cell{
	padding: 8px 6px;
}
.plupload_view_list .plupload_file_size, .plupload_filelist_footer .plupload_file_size{
	width:70%;
}
.plupload_content{
	top: 38px;
    bottom: 45px;
    background-color: #f9f9f9;
}
.plupload_content{
	position: absolute;
    top: 86px;
    bottom: 44px;
    left: 0;
    right: 0;
    overflow-y: auto;
    width: 100%;
}
.plupload_dropbox .plupload_droptext{
	display: block;
}
.plupload_droptext{
	line-height: 124px;
    color: #555;
}
.plupload_droptext{
	position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: transparent;
    text-align: center;
    vertical-align: middle;
    border: 0;
    line-height: 160px;
    display: none;
}
.plupload_clearer, .plupload_progress_bar{
	display: block;
    font-size: 0;
    line-height: 0;
}
.plupload_clear, .plupload_clearer{
	clear: both;
}
.plupload_clearer{
    height: 0;
}
.plupload_filelist_footer{
	position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
}
.plupload_view_switch{
	position: absolute;
    right: 16px;
    bottom: 8px;
    margin: 0;
    display: none;
}
.plupload_hidden{
	display: none !important;
}
.plupload_filelist_footer td{
	background-color: #f5f5f5 !important;
    border-bottom: 1px solid #e5e5e5;
    border-top: 1px solid #e5e5e5;
}
.plupload_file_action{
	float: right;
    width: 16px;
    height: 16px;
    margin-left: 15px;
}
.btn-wrap{
    padding: 8px 0 8px 0;
    text-align: right;
}
.btn-wrap .btn{
    min-width: 63px;
    padding: 5px 11px;
    box-shadow: 0 3px 5px #e3e3e3;
}
button, input, optgroup, select, textarea{
	color:inherit;
	font:inherit;
	margin:0;
}
input, button, select, textarea{
	vertical-align: middle;
	margin-bottom:0;
}
label{
	display:inline-block;
	
}
form{
	display:block;
	margin-top:0em;
}
div{
	display:block;
}
table{
	border-spacing: 0;
	width:100%;
	max-width:100%;
	table-layout:fixed;
	border-collapse: collapse;
	background-color:#fff;
}
img{
	border:0;
	vertical-align: middle;
}
</style>

<section>
	<article>
		<div class="content_header">
			<h2>업무 등록</h2>
		</div>
		
		<div>
		
			<div class="content-wrap">
			    <div class="content-write">
			        <form id="orderForm" name="orderForm" method="post" action="?OWASP_CSRFTOKEN=QFWJ-DX3G-EQJC-DRNT-CQK6-XCW4-TB9K-0LXK" novalidate="novalidate">
			            <input type="hidden" name="searchConditionString" value="">
			            <input type="hidden" name="etcName" id="etcName">
			            <input type="hidden" name="etcName2" id="etcName2">
			            <input type="hidden" name="dueDate" value="">
			            <input type="hidden" name="startDate" value="">
			            <input type="hidden" id="startDateCalendar" value="2019.01.23">
			            <input type="hidden" id="dueTimeHour" value="">
			            <input type="hidden" id="dueTimeMinute" value="">
			            <input type="hidden" id="categoryId" name="categoryId" value="">
			            <input type="hidden" id="attachTaskIds" name="attachTaskIds" value="">
			            <input type="hidden" id="attachApprIds" name="attachApprIds" value="">
			            <input type="hidden" name="isAlarm" value="0">
			            <input type="hidden" id="taskTempYn" value="N">
			            
			            <div class="form-block">
			                <table class="table">
			                    <caption></caption>
			                    <tbody>
			                        <tr>
			                            <th scope="row"><span class="text-point-b">*</span>제목</th>
			                            <td>
			                                <div>
			                                	<input type="text" title="제목" name="title" class="form-control" placeholder="제목을 입력하세요.">
			                                </div>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th scope="row"><span class="text-point-b">*</span>업무형태</th>
			                            <td>
			                                <div class="label-group">
		                                        <label class="radio-inline"><input type="radio" class="fnone" id="type0" name="taskType" title="나의 할 일" value="0"> 나의 할 일</label>
		                                        <label class="radio-inline"><input type="radio" class="fnone" id="type1" checked="checked" name="taskType" title="업무 요청" value="1"> 업무 요청</label>
		                                        <label class="radio-inline"><input type="radio" class="fnone" id="type2" name="taskType" title="업무 보고" value="2"> 업무 보고</label>
		                                        <label class="radio-inline"><input type="radio" class="fnone" id="type3" name="taskType" title="업무 일지" value="3"> 업무 일지</label>
			                                </div>
			                            </td>
			                        </tr>
			                        <tr id="isTermlessTR">
			                            <th scope="row"><span class="text-point-b">*</span>업무기한</th>
			                            <td>
			                                <input type="text" title="업무기한" id="dueDateCalendar" name="dueDateCalendar" value="2019.01.24" readonly="readonly" class="input-datepicker w100" data-date-format="yyyy.mm.dd" placeholder="yyyy.mm.dd">
			                                <button type="button" id="dueDateCalendarBtn" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
			                                <div class="timepicker-wrap blind">
			                                    <div class="input-group bootstrap-timepicker">
			                                        <input type="text" title="시간" name="timepicker" readonly="readonly" class="input-timepicker" placeholder="h:mm">
			                                        <a href="javascript:void(0);" class="btn input-group-addon btn-color5 br">
			                                            <i class="fa fa-clock-o"></i>
			                                        </a>
			                                    </div>
			                                </div>
			                                <span class="label-group ml10">
			                                    <input type="checkbox" id="isTermless" title="기한없음" name="isTermless" value="0"><label>기한없음</label>
			                                </span>
			                            </td>
			                        </tr>
			                        <tr id="workerTR">
			                            <th id="workerTH1" scope="row"><span class="text-point-b">*</span>담당자</th>
			                            <th id="workerTH2" scope="row" style="display:none;">
			                            	<span class="text-point-b">*</span>수신자
			                            </th>
			                            <td>
			                            	<div style="position: relative;">
				                            	<div id="isViewDiv" style="">
			                            	    	<label class="radio-inline"><input type="radio" class="fnone" id="isView0" checked="checked" name="isView" title="업무완료(100%) 이후 조회" value="0"> 업무완료(100%) 이후 조회</label><span id="todoCompleteIcon"><i class="fa fa-question-circle textcolor11" style="font-size:15px;vertical-align: middle;margin-top: -2px;margin-left:3px;padding-right:10px; cursor:pointer" onclick="todoCompleteTooltip(this);"></i></span>
			                                    	<label class="radio-inline"><input type="radio" class="fnone" id="isView1" name="isView" title="업무완료 이전 조회 가능" value="1"> 업무완료 이전 조회 가능</label><i class="fa fa-question-circle textcolor11" style="font-size:15px;vertical-align: middle;margin-top: -2px;margin-left: 3px; cursor:pointer" onclick="todoIncompleteTooltip()" ;=""></i>
				                            	</div>
				                            	<div id="todoComplete" class="bubble todo_request_btn todo_comp" style="display: none;">
													<div class="ez_moneyInfo">
														<a href="javascript:void();" onclick="todoCompleteTooltip();"><i class="icon close"></i></a>
														<ul>
															<li><span>업무처리자가 요청 받은 업무를
																처리 완료(진척율 100%)한 경우에만
																요청자가 처리내용을 확인할 수
																있습니다.</span>
															</li>
														</ul>
													</div>
												</div>
				                            	<div id="todoIncomplete" class="bubble todo_request_btn todo_incomp" style="display: none;">
													<div class="ez_moneyInfo">
														<a href="javascript:void();" onclick="todoIncompleteTooltip();"><i class="icon close"></i></a>
														<ul>
															<li><span>업무처리자가 요청 받은 업무를
																진행 중인(진척율 0%~80%) 경우에도
																요청자가 처리내용을 확인할 수
																있습니다.</span>
															</li>
														</ul>
													</div>
												</div>
				                                <div id="selectUser1" class="input-group organization">
				                                	<div id="selectUser1_div" class="tagsinput">
				                                		<input type="text" title="사용자" id="selectUser1_input" placeholder="사용자" style="box-shadow:none;">
				                                	</div>
				                                	<a href="#a" title="사용자" class="btn input-group-addon btn-color5 br">
					                                	<i class="icon man-plus"></i>
					                                	<span class="none">사용자</span>
				                                	</a>
				                                </div>
			                                </div>
			                            </td>
			                        </tr>
			                        <tr id="worker2TR">
			                            <th scope="row">참조자</th>
			                            <td>
			                                <div id="selectUser2" class="input-group organization">
				                                <div id="selectUser2_div" class="tagsinput">
				                                	<input type="text" title="사용자" id="selectUser2_input" placeholder="사용자" style="box-shadow:none;">
				                                </div>
				                                <a href="#a" title="사용자" class="btn input-group-addon btn-color5 br">
					                                <i class="icon man-plus"></i>
					                                <span class="none">사용자</span>
				                                </a>
			                                </div>
			                            </td>
			                        </tr>
			                        <tr id="alarmTR">
			                            <th scope="row">등록 알림</th>
			                            <td>
			                                <label><input name="alarmType0" type="checkbox" title="메일 발송" value="1"> 메일 발송</label>&nbsp;&nbsp;
			                                <label><input name="alarmType1" type="checkbox" title="쪽지 발송" value="2"> 쪽지 발송</label>&nbsp;&nbsp;
			                                <label><input name="alarmType2" type="checkbox" title="푸시 발송 " value="3"> 푸시 발송 </label>&nbsp;&nbsp;
			                                <label><input name="isSmsPreNotice" id="sSms" type="checkbox" title="[SMS 발송] 가 없습니다. 확인해주세요." value="4" disabled="disabled"> SMS 발송</label>&nbsp;&nbsp;<i class="fa fa-exclamation-circle  ml15" style="font-size:15px;vertical-align: middle;margin-top: -2px;"></i> SMS발송시 EZ머니 차감 <a href="#" class="showEzmoney"><i class="fa fa-question-circle textcolor11" style="font-size:15px;vertical-align: middle;margin-top: -2px;"></i></a>
			                            </td>
			                        </tr>
			                        <tr id="rAlarmTR">
			                            <th scope="row">완료 알림</th>
			                            <td>
			                                <label><input name="isMailNotice" type="checkbox" title="메일 발송" value="0"> 메일 발송</label>&nbsp;&nbsp;
			                                <label><input name="isMessageNotice" type="checkbox" title="쪽지 발송" value="0"> 쪽지 발송</label>&nbsp;&nbsp;
			                                <label><input name="isMobileNotice" type="checkbox" title="푸시 발송 " value="0"> 푸시 발송 </label>&nbsp;&nbsp;
			                                <label><input name="isSmsPostNotice" id="eSms" type="checkbox" title="SMS 발송" value="0" disabled="disabled"> SMS 발송</label>&nbsp;&nbsp;<i class="fa fa-exclamation-circle  ml15" style="font-size:15px;vertical-align: middle;margin-top: -2px;"></i> SMS발송시 EZ머니 차감 <a href="#" class="showEzmoney"><i class="fa fa-question-circle textcolor11" style="font-size:15px;vertical-align: middle;margin-top: -2px;"></i></a>
			                            </td>
			                        </tr>
			                        <tr id="folderTR">
			                            <th scope="row"><label for="folderId">업무 보관함</label></th>
			                            <td id="selectFolder">
			                                <input type="hidden" id="folderId" name="folderId" value="">
			                                <input type="hidden" id="folderNmae" name="folderName" value="">
			                                <button type="button" class="btn btn-color7 br mr10" onclick="javascript:listTodoFolderViewPopup();">업무 보관함</button>
	<!--                                         <select name="folderId" id="folderId" class="w400" style=""> -->
	<!--                                                 </option> -->
	<!--                                         </select> -->
			                            </td>
			                        </tr>
			                        <tr id="categoryTR1" style="display: none;">
			                            <th scope="row"><label for="categoryId1">업무 보고 유형</label></th>
			                            <td>
	                                        <select name="categoryId1" id="categoryId1" class="w400">
	                                            <option value="" data-contents="" selected="selected">선택안함</option>
	                                                <option value="26944881">
	                                               			 테스트
	                                                </option>
	                                        </select>
			                            </td>
			                        </tr>
			                        <tr id="categoryTR2" style="display: none;">
			                            <th scope="row"><label for="categoryId2">업무 일지 유형</label></th>
			                            <td>
	                                        <select name="categoryId2" id="categoryId2" class="w400">
	                                            <option value="" data-contents="" selected="selected">선택안함</option>
	                                        </select>
			                            </td>
			                        </tr>
			                        <tr id="categoryTR3">
			                            <th scope="row"><label for="docId">관련업무</label></th>
			                            <td>
			                                <button type="button" class="btn btn-color7 br" onclick="javascript:selectTodoViewPopup();">관련업무 추가</button>
			                                <div id="addTask"></div>
			                            </td>
			                        </tr>
			                        <tr id="categoryTR4">
			                            <th scope="row"><label for="apprId">관련결재</label></th>
			                            <td>
			                                <button type="button" class="btn btn-color7 br" onclick="javascript:selectApprPopup();">관련결재 추가</button>
			                                <div id="addAppr"></div>
			                            </td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
			            
			    <!-- 글쓰기 내용이 들어가야하는 자리 -->        
				<div class="form-group">
						<textarea id="taskContents" name="taskContents" class="form-control" placeholder="내용" rows="6" title="내용" style="display: none;"></textarea>
						<div id="editorDiv" class="col-xs-12">
							<div id="dext_frame_holderdext5" style="width:100%; height:550px; ">
								<table>
									<tr>
										<th>글쓰는곳</th>
											<td>sdafasdfas</td>
											<td>dd</td>
									</tr>
								</table>
								<!-- <iframe frameborder="0" scrolling="no" id="dext_frame_dext5" title="에디터 전체영역" width="100%" height="100%" style="width: 100%; height: 100%;"></iframe>iframe 안에 src="https://ezgroupware.bizmeka.com/js/dext5editor/pages/editor_release.html?ver=3.5.1263556.1800.01" -->
							</div>
						</div>
				</div>
			            
				<div id="fileUploadArea">
					<div class="fileup">
						<div class="fileup_t">
							<h3>파일 업로드</h3>
								<div class="extendButton">
									<a href="#a">
									<img src="/js/plupload-2.1.8/js/jquery.ui.plupload/img/ic_fileup_opened.gif" alt="접기" title="접기" border="0"></a>
								</div>
						</div>
						<div class="fileup_c">
							<div class="fileAttach mt10"></div>
							<div class="fileAttach mt10"></div>
							<div id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1">
								<div class="plupload_wrapper">
									<div class="ui-widget-content plupload_container ui-resizable plupload_view_list" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_container">
										<div class="ui-state-default ui-widget-header plupload_header">
											<div class="plupload_header_content">
												<div class="plupload_logo"></div>
												<div class="plupload_header_title">파일 선택</div>
												<div class="plupload_header_text">파일을 업로드 큐에 추가한 후 시작 버튼을 클릭하십시오.</div>
											</div>
										</div>
										<table class="plupload_filelist plupload_filelist_header ui-widget-header">
											<tbody>
												<tr>
												<td class="plupload_cell plupload_file_name">파일명</td>
												<td class="plupload_cell plupload_file_status">상태</td>
												<td class="plupload_cell plupload_file_size">크기</td>
												<td class="plupload_cell plupload_file_action">&nbsp;</td>
												</tr>
											</tbody>
										</table>
										<div class="plupload_content plupload_dropbox" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_dropbox">
											<div class="plupload_droptext">이곳에 파일을 드래그 하세요.</div>
												<ul class="plupload_filelist_content" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_filelist" unselectable="on"></ul>
												<div class="plupload_clearer">&nbsp;</div>
											</div>
										<table class="plupload_filelist plupload_filelist_footer ui-widget-header">
											<tbody>
												<tr>
													<td class="plupload_cell plupload_file_name">
														<div class="plupload_buttons" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_buttons"><!-- Visible -->
															<a class="plupload_button plupload_add" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_browse" style="position: relative; z-index: 1;">파일 추가</a>&nbsp;
															<a class="plupload_button plupload_start" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_start">업로드 시작</a>&nbsp;
															<a class="plupload_button plupload_stop plupload_hidden" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_stop">업로드 중지</a>&nbsp;
															<div id="html5_1d1s4kgul19e71m7rs18qqjobs4_container" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 0px; left: 0px; width: 66px; height: 26px; overflow: hidden; z-index: 0;">
																<input id="html5_1d1s4kgul19e71m7rs18qqjobs4" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" multiple="" accept="text/plain,.asc,.txt,.text,.diff,.log,text/html,.xhtml,text/rtf,.rtf,.xml,.vcf,text/csv,.csv,image/bmp,.bmp,image/gif,.gif,image/jpeg,.jpeg,.jpg,image/png,.png,image/tiff,.tiff,.tif,application/zip,.zip,.alz,.rar,.jar,.tar,.bat,application/msword,.doc,.dot,application/pdf,.pdf,application/pgp-signature,.pgp,application/postscript,.ps,.ai,.eps,.rtf,application/vnd.ms-excel,.xls,.xlb,application/vnd.ms-powerpoint,.ppt,.pps,.pot,application/vnd.openxmlformats-officedocument.wordprocessingml.document,.docx,application/vnd.openxmlformats-officedocument.presentationml.presentation,.pptx,application/vnd.openxmlformats-officedocument.presentationml.slideshow,.ppsx,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,.xlsx,.hwp,.dwg,.dws,.dxf,.dwt,.plt,audio/x-wav,.wav,audio/x-ms-wma,.wma,audio/mpeg,.mpga,.mpega,.mp2,.mp3,audio/x-m4a,.m4a,video/avi,.avi,video/x-matroska,.mkv,video/mpeg,.mpeg,.mpg,.mpe,video/quicktime,.qt,.mov,video/mp4,.mp4,video/x-m4v,.m4v,video/x-flv,.flv,video/vnd.rn-realvideo,.rv,application/x-shockwave-flash,.swf,.swfl,.pages,.keynote,.a01,.a02,.a03,.a04,.a05,.a06,.a07,.a08,.a09,.a10,.a11,.a12,.a13,.a14,.a15,.a16,.a17,.a18,.a19,.a20,.extension,application/vnd.openxmlformats-officedocument.wordprocessingml.template,.dotx,application/vnd.openxmlformats-officedocument.presentationml.template,.potx,.xlt,.xltx,.7z,audio/aac,.aac,audio/aiff,.aiff,audio/flac,.flac,audio/ogg,.ogg,.fla,image/photoshop,.psd,video/3gpp,.3gp,.ts,video/webm,.webm,.gul,.odt,.ods,.odp,.xlsm,.stp,.catpart,.igs,.ap">
															</div>
														</div>
														<div class="plupload_view_switch ui-buttonset" style="display: block; position: static;">
															<input type="radio" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_view_list" name="view_mode_o_1d1s4kgse1uhn1sqb1afmhkd1tks1" checked="checked" value="" class="ui-corner-left" style="display: none;">
															<label class="plupload_button" for="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_view_list" data-view="list" style="display: none;">목록보기</label>
															<input type="radio" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_view_thumbs" name="view_mode_o_1d1s4kgse1uhn1sqb1afmhkd1tks1" value="" class="ui-corner-right" style="display: none;">
															<label class="plupload_button" for="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_view_thumbs" data-view="thumbs" style="display: inline-block;">미리보기</label>
														</div>
														<div class="plupload_started plupload_hidden"><!-- Hidden -->
															<div class="plupload_progress plupload_right">
																<div class="plupload_progress_container ui-progressbar ui-widget ui-widget-content ui-corner-all" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
																	<div class="ui-progressbar-value ui-widget-header ui-corner-left" style="display: none; width: 0%;"></div>
																</div>
															</div>
															<div class="plupload_cell plupload_upload_status"></div>
															<div class="plupload_clearer">&nbsp;</div>
														</div>
													</td>
													<td class="plupload_file_status">
														<span class="plupload_total_status">0%</span>
													</td>
													<td class="plupload_file_size" style="width: 130px;">
														<span class="plupload_total_file_size" style="color: rgb(66, 69, 74);">0 B</span> / <span><b>500 MB</b></span>
													</td>
													<td class="plupload_file_action"></td>
												</tr>
											</tbody>
										</table>
										<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div>
									</div>
									<input class="plupload_count" value="0" type="hidden" id="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_count" name="o_1d1s4kgse1uhn1sqb1afmhkd1tks1_count">
								</div>
							</div>
						</div>
					</div>
				</div>
				     <input type="hidden" name="OWASP_CSRFTOKEN" value="QFWJ-DX3G-EQJC-DRNT-CQK6-XCW4-TB9K-0LXK"></form>
				 </div>
				 <div class="btn-wrap">
					<button id="uploadFromFileBox" type="button" class="btn btn-color7 br" onclick="">웹디스크 파일첨부</button>
					<button type="button" class="btn btn-color5 br" id="saveButton">저장</button>
					<button type="button" class="btn btn-color7 br" id="taskTempButton">임시저장</button>
					<button type="button" class="btn btn-color7 br" onclick="javascript:location.href='/groupware/todo/listTodoView.do?searchConditionString=';">취소</button>
				 </div>
			</div>
		</div>
		
		
		
	</article>
</section>