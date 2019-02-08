<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- text-editor를 쓰기 위한 script 파일 설정으로 아래 textarea가 있어야 한다. -->
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<script type="text/javascript">
function addApprLine(){
	var url="O_addApprLine";
	window.open(url, "addApprLine", "menubar=no, width=1000, height=560");
}
</script>

<style>
.btn-wrap {
    padding: 8px 0 8px 0;
    text-align: right;
}
.pt10{
	padding-top: 10px !important;
}
.approval h2 {
    font-size: 30px;
    text-align: center;
    margin-bottom: 10px;
}
.approval .appline-wrap {
    margin: 0 10px 20px;
}
.approval .appline-wrap > div {
    clear: both;
}
.fright {
    float: right !important;
    width: auto !important;
}
.appline-lst {
    margin-bottom: 10px;
    border-collapse: collapse;
    table-layout: auto;
}
.appline-lst th {
    padding: 0 6px;
    width: 25px;
    border: 1px solid #ccc;
    height: 100%;
    color: #111;
    background-color: #f5f5f5;
    text-align: center;
}
.appline-lst .apprLine {
    padding: 3px 0;
    width: 80px;
    background: #f5f5f5;
}
.appline-lst td {
    line-height: 18px;
    text-align: center;
    border: 1px solid #ccc;
}
.bdr-t{
    border-top: 2px #c0c0c0 solid !important;
}
.approval .content-write .table th, .approval .content-write .table td {
    border: 1px solid #e5e5e5;
    border-top: none;
}
.content-write .table th {
    padding: 4px 10px 5px;
    width: 120px;
    line-height: 28px;
    vertical-align: middle;
    color: #111;
    text-align: right;
    font-weight: 600;
    border-bottom: 1px solid #e5e5e5;
    background-color: #f5f5f5;
}
.content-write .table td {
    padding: 4px 10px 5px;
    line-height: 28px;
    vertical-align: middle;
    text-align: left;
    color: #111;
    border-bottom: 1px solid #e5e5e5;
    background-color: #fff;
}
.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
}
.input-group div.tagsinput {
    border-right: none;
    border-radius: 2px 0 0 2px;
    overflow-y: auto;
    max-height: 84px;
}
div.tagsinput {
    background: #ffffff;
    width: 100%;
    height: auto;
    padding: 0 8px;
    border: 1px solid #c3c6c9;
    border-radius: 2px;
}
div.tagsinput input {
    width: 80px;
    margin: 0px;
    font-family: helvetica;
    font-size: 12px;
    border: 1px solid transparent;
    padding: 0 5px;
    height: 21px !important;
    line-height: 20px;
    background: transparent;
    outline: 0;
    margin: 2px 4px 2px 0;
    vertical-align: middle;
}
.input-group .btn {
    border-top-left-radius: 0 !important;
    border-bottom-left-radius: 0 !important;
}
.input-group-addon, .input-group-btn {
    width: 1%;
    white-space: nowrap;
    vertical-align: middle;
}
.input-group-addon, .input-group-btn, .input-group .form-control {
    display: table-cell !important;
}
i.icon.man-plus {
    width: 16px;
    height: 17px;
    margin: 0;
    background-position: -19px -95px;
}
i.icon {
    display: inline-block;
    background-image: url(../images/common/ic_common.png);
    margin: 0 4px;
    background-repeat: no-repeat;
    vertical-align: middle;
}
.fileup_t {
    position: relative;
    padding: 12px 0 7px 10px;
    border-bottom: 1px solid #E5E5E5;
}
.fileup_t div.extendButton {
    position: absolute;
    right: 12px;
    top: 19px;
}
.mt10 {
    margin-top: 10px !important;
}
.plupload_container {
    min-height: 200px;
    _height: 300px;
    min-height: 300px;
    position: relative;
}
div.plupload_header {
    display: none;
}
.plupload_wrapper * {
    box-sizing: content-box;
}
.plupload_cell {
    padding: 8px 6px;
}
.plupload_content {
    top: 38px;
    bottom: 45px;
    background-color: #f9f9f9;
}
.plupload_button {
    display: -moz-inline-box;
    FF < 3: ;
    display: inline-block;
    font-size: 12px;
    /* font-weight: 600; */
    text-decoration: none;
    color: #222 !important;
    border: 1px solid #aaa;
    padding: 2px 8px 2px 24px;
    /* padding: 2px 8px; */
    margin-right: 4px;
    background: #fff url(../img/buttons.png) no-repeat 0 center;
    /* background: #fff; */
    outline: 0;
    text-decoration: none !important;
    Optional rounded corners for browsers that support it: ;
    -moz-border-radius: 3px;
    -khtml-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
}
.table td .btn-color5.br {
    border: 1px #bbb solid;
}
table.separate {
    border-collapse: separate !important;
}
table {
    border-spacing: 0;
    width: 100%;
    max-width: 100%;
    table-layout: fixed;
    border-collapse: collapse;
    background-color: #fff;
}
div{
	display:block;
}

</style>


<section>
	<article>
		<div class="content_header">
			<h2>기안문 작성</h2>
		</div>
		
		<!-- 결재 선 라인 -->
		<div id="formButtonDiv" class="btn-wrap pt10">
		    <button id="addApprLineButton" name="addApprLineButton" type="button" class="btn btn-color5 br" onclick="addApprLine();">결재선</button>
		    <button id="createApprDocButton" type="button" class="btn btn-color5 br">결재요청</button>
		    <button id="addApprRefInfoButton" type="button" class="btn btn-color7 br">기결재첨부</button>
			<button id="createApprDocTemporayButton" type="button" class="btn btn-color7 br">임시저장</button>
			<button id="listApprDocButton" type="button" class="btn btn-color7 br">취소</button>
		</div>
		
		<!-- 기안 용지 작성 content -->
		<div class="content-wrap approval responsive">
			<div class="content-write">	
				<form id="apprDocForm" name="apprDocForm" method="post" action="/groupware/approval/work/apprWorkDoc/createApprDoc.do?OWASP_CSRFTOKEN=MH9Z-B476-OG7Y-7N0R-GGXM-44ZS-CS40-3K6R" novalidate="novalidate">
					<input name="msie" type="hidden" value="0">
			        <input type="hidden" name="systemId" value="GW">
			        <input type="hidden" name="formId" value="26211286">
			        <input type="hidden" name="formVersion" value="1">		    
			        <input type="hidden" name="apprDocType" value="0">
			        <textarea title="formLayoutData" name="formLayoutData" style="display:none;"></textarea>
			        <input type="hidden" name="isLinkUrl" value="0">
			        <input type="hidden" name="linkDataType" value="0">
			        <textarea title="formData" name="formData" style="display:none;"></textarea>
			        <input type="hidden" name="defLineId" value="">
			        <input type="hidden" name="defLineUse" value="0">
			        <input type="hidden" name="isDefLineUpdate" value="0">
			        <input type="hidden" name="isRequestForm" value="0">		        		        		        		            
			        <input type="hidden" name="apprId" value="">        
			        <input type="hidden" name="registerJobTitle" value="">
			        <textarea title="formLinkedData" name="formLinkedData" style="display:none;"></textarea>
			        <input type="hidden" name="apprLineType" value="0">
			        <input type="hidden" name="apprLine" value="[{&quot;type&quot;:&quot;joinUser&quot;,&quot;apprType&quot;:0,&quot;id&quot;:&quot;U260222&quot;,&quot;code&quot;:&quot;U260222&quot;,&quot;userName&quot;:&quot;오정&quot;,&quot;teamName&quot;:&quot;테스트&quot;,&quot;jobTitleName&quot;:&quot;기안&quot;,&quot;approverType&quot;:0,&quot;apprOrder&quot;:0,&quot;apprStatus&quot;:1,&quot;lineModifyAuth&quot;:1,&quot;docModifyAuth&quot;:1,&quot;readModifyAuth&quot;:1,&quot;apprDate&quot;:&quot;&quot;,&quot;name&quot;:&quot;결재 오정 기안 테스트&quot;}]">
			        <input type="hidden" name="referenceId">
			        <input type="hidden" name="readId">
			        <input type="hidden" name="apprReceiveLine">
			        <input type="hidden" name="apprDocStatus" value="1">
			        <input type="hidden" name="isApprReceive" value="0">
			        <input type="hidden" name="listType" value="listApprForm">
			        <input type="hidden" name="registerMessage">
			        <input type="hidden" name="apprRefId">
			        <input type="hidden" name="mode" value="new">
			        <input type="hidden" name="linkType" value="">
			        <input type="hidden" name="popupYn" value="false">
			        <input type="hidden" name="modalYn" value="Y">
			        <input type="hidden" name="isEmergency">   	    			        
			        <input type="hidden" name="appKey01" value="">
			        <input type="hidden" name="appKey02" value="">
			        <input type="hidden" name="appKey03" value="">
			        <input type="hidden" name="appKey04" value="">
			        <input type="hidden" name="appKey05" value=""> 
			        <input type="hidden" name="isOfficial" value="0"> 
			        <input type="hidden" name="systemType" value="0"> 
			        <textarea title="formHtmlData" name="formHtmlData" style="display:none;"></textarea>
			            
					
					<h2>기안용지</h2>
					
					<!-- 결재 sign 부분 -->
					<div class="appline-wrap">
						<div class="fright" id="apprLine0Tr" style="display: block;">
							<div class="fleft">	
								<table class="appline-lst">
									<caption></caption>
									<tbody>	
										<tr id="apprLine0TTr">
											<th rowspan="2">
												결<br><br class="last">재
											</th>
											<th class="apprLine last">기안</th>
										</tr>
										<tr id="apprLine0BTr">									
										<td height="60" class="last">${vo.getName()}</td></tr>
									</tbody>
								</table>							
							</div>		
						</div>
						
						
						<div class="clearfix">
							<div class="fright" id="apprLine1Tr" style="display: none; width: 0px;">
								<table class="appline-lst">
									<caption></caption>
									<tbody>	
										</tbody><tbody>	
											<tr id="apprLine1TTr">	
												<th rowspan="2">					
													합<br><br class="last">의
												</th>
											<th class="apprLine last">-</th>
										</tr>
										<tr id="apprLine1BTr">	
											<td height="60" class="last">합의자</td>								
										</tr>
									</tbody>
								</table>						
							</div>		
						</div>
					</div>
										
						
					
					<div class="form-block bdr-t">
	
						<table class="table separate">
							<caption></caption>
							<colgroup>
								<col style="width: 15%;">
								<col style="width: 35%;">
								<col style="width: 15%;">
								<col style="width: 35%;">
							</colgroup>						
							<tbody>							
								<tr>
									<th>문서번호</th>
									<td>자동채번</td>
									<th>기안일자</th>
									<td>${today}</td>
								</tr>
								<tr>
									<th>기안자</th>
									<td>${vo.getName()} (${vo.getR_name()})</td>
									<th>기안부서</th>
									<td>
										<input type="hidden" name="apprGroupId" value="G153190">${vo.getG_name()}
									</td>
								</tr>
								<tr>
									<th>참조자</th>
									<td>
										<div id="selectReferenceId" class="input-group organization">
											<div id="selectReferenceId_div" class="tagsinput">
												<input type="text" title="사용자" id="selectReferenceId_input" placeholder="사용자" style="box-shadow:none;">
											</div>
											<a href="#a" title="사용자" class="btn input-group-addon btn-color5 br">
												<i class="icon man-plus"></i><span class="none">사용자</span>
											</a>
										</div>
									</td>
									<th>기결재첨부</th>
									<td> 
								        <span id="apprRefInfoUl"></span>
									</td>
								</tr>
								<tr id="apprReceiveLineTr" style="display: none;">
									<th scope="row">수신처</th>
									<td colspan="3">
										<div id="apprReceiveLineInfoDiv">쓰지 않음</div>
									</td>
								</tr>
								<tr>
									<th><span class="text-point-b">*</span>문서제목</th>
									<td colspan="3">
						    			<input type="text" title="문서제목" name="apprTitle" value="" class="inputbox w100p" maxlength="100" placeholder="문서제목을 입력하세요." required="required">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
						
			        <!--  template의 jsp 호출 시작-->
					
						
					
					<!--  template의 jsp 호출 끝-->
					<!-- <div id="formLinkedHtmlDataDiv" style="border: 1px solid #e0e0e0;" class="mt10 padding10 none"></div> -->								
					<div class="border_t1" style="border-top:none !important;">
						<div id="editorDiv">
							<div id="dext_frame_holderdext5" style="width:100%; height:550px;">
								<!-- text-editor를 쓰기 위함으로 class name은 ckeditor로 쓰여야 한다. -->
								<textarea class="ckeditor" id="formEditorData" title="formEditorData" name="formEditorData">글쓰기 시작</textarea>
								<!-- text-editor를 쓰기 위함으로 위의 textarea의 class name이 아래 쓰인다. -->
								<script>CKEDITOR.replace('formEditorData')</script>
							</div>
						</div>
					</div>
					
					
					
				<div id="fileUploadDiv" class="">
					<div class="fileup">
						<div class="fileup_t">
							<h3>파일 업로드</h3>
							<div class="extendButton">
								<a href="#a">
									<img src="/js/plupload-2.1.8/js/jquery.ui.plupload/img/ic_fileup_opened.gif" alt="접기" title="접기" border="0">
								</a>
							</div>
						</div>
						<div class="fileup_c">
							<div class="fileAttach mt10"></div>
							<div class="fileAttach mt10"></div>
							<div id="o_1d220s3b61uaa9l31l8uqa1tdm1">
								<div class="plupload_wrapper">
									<div class="ui-widget-content plupload_container ui-resizable plupload_view_list" id="o_1d220s3b61uaa9l31l8uqa1tdm1_container">
										<div class="ui-state-default ui-widget-header plupload_header">
											<div class="plupload_header_content">
												<div class="plupload_logo"> </div>
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
										<div class="plupload_content plupload_dropbox" id="o_1d220s3b61uaa9l31l8uqa1tdm1_dropbox">
										<div class="plupload_droptext">이곳에 파일을 드래그 하세요.</div>
											<ul class="plupload_filelist_content" id="o_1d220s3b61uaa9l31l8uqa1tdm1_filelist" unselectable="on"> </ul>
											<div class="plupload_clearer">&nbsp;</div>
										</div>
										
										<table class="plupload_filelist plupload_filelist_footer ui-widget-header">
											<tbody>
												<tr>
													<td class="plupload_cell plupload_file_name">
														<div class="plupload_buttons" id="o_1d220s3b61uaa9l31l8uqa1tdm1_buttons"><!-- Visible -->
															<a class="plupload_button plupload_add" id="o_1d220s3b61uaa9l31l8uqa1tdm1_browse" style="position: relative; z-index: 1;">파일 추가</a>&nbsp;
															<a class="plupload_button plupload_start" id="o_1d220s3b61uaa9l31l8uqa1tdm1_start">업로드 시작</a>&nbsp;
															<a class="plupload_button plupload_stop plupload_hidden" id="o_1d220s3b61uaa9l31l8uqa1tdm1_stop">업로드 중지</a>&nbsp;
															<div id="html5_1d220s3bq18olkug12kt1poqm0s4_container" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 0px; left: 0px; width: 66px; height: 26px; overflow: hidden; z-index: 0;">
																<input id="html5_1d220s3bq18olkug12kt1poqm0s4" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" multiple="" accept="text/plain,.asc,.txt,.text,.diff,.log,text/html,.xhtml,text/rtf,.rtf,.xml,.vcf,text/csv,.csv,image/bmp,.bmp,image/gif,.gif,image/jpeg,.jpeg,.jpg,image/png,.png,image/tiff,.tiff,.tif,application/zip,.zip,.alz,.rar,.jar,.tar,.bat,application/msword,.doc,.dot,application/pdf,.pdf,application/pgp-signature,.pgp,application/postscript,.ps,.ai,.eps,.rtf,application/vnd.ms-excel,.xls,.xlb,application/vnd.ms-powerpoint,.ppt,.pps,.pot,application/vnd.openxmlformats-officedocument.wordprocessingml.document,.docx,application/vnd.openxmlformats-officedocument.presentationml.presentation,.pptx,application/vnd.openxmlformats-officedocument.presentationml.slideshow,.ppsx,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,.xlsx,.hwp,.dwg,.dws,.dxf,.dwt,.plt,audio/x-wav,.wav,audio/x-ms-wma,.wma,audio/mpeg,.mpga,.mpega,.mp2,.mp3,audio/x-m4a,.m4a,video/avi,.avi,video/x-matroska,.mkv,video/mpeg,.mpeg,.mpg,.mpe,video/quicktime,.qt,.mov,video/mp4,.mp4,video/x-m4v,.m4v,video/x-flv,.flv,video/vnd.rn-realvideo,.rv,application/x-shockwave-flash,.swf,.swfl,.pages,.keynote,.a01,.a02,.a03,.a04,.a05,.a06,.a07,.a08,.a09,.a10,.a11,.a12,.a13,.a14,.a15,.a16,.a17,.a18,.a19,.a20,.extension,application/vnd.openxmlformats-officedocument.wordprocessingml.template,.dotx,application/vnd.openxmlformats-officedocument.presentationml.template,.potx,.xlt,.xltx,.7z,audio/aac,.aac,audio/aiff,.aiff,audio/flac,.flac,audio/ogg,.ogg,.fla,image/photoshop,.psd,video/3gpp,.3gp,.ts,video/webm,.webm,.gul,.odt,.ods,.odp,.xlsm,.stp,.catpart,.igs,.ap">
															</div>
														</div>
														<div class="plupload_view_switch ui-buttonset" style="display: block; position: static;">
															<input type="radio" id="o_1d220s3b61uaa9l31l8uqa1tdm1_view_list" name="view_mode_o_1d220s3b61uaa9l31l8uqa1tdm1" checked="checked" value="" class="ui-corner-left" style="display: none;">
															<label class="plupload_button" for="o_1d220s3b61uaa9l31l8uqa1tdm1_view_list" data-view="list" style="display: none;">목록보기</label>
															<input type="radio" id="o_1d220s3b61uaa9l31l8uqa1tdm1_view_thumbs" name="view_mode_o_1d220s3b61uaa9l31l8uqa1tdm1" value="" class="ui-corner-right" style="display: none;">
															<label class="plupload_button" for="o_1d220s3b61uaa9l31l8uqa1tdm1_view_thumbs" data-view="thumbs" style="display: inline-block;">미리보기</label>
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
										<input class="plupload_count" value="0" type="hidden" id="o_1d220s3b61uaa9l31l8uqa1tdm1_count" name="o_1d220s3b61uaa9l31l8uqa1tdm1_count">
									</div>
								</div>
							</div>
						</div>
					</div>
		
				<input type="hidden" name="OWASP_CSRFTOKEN" value="MH9Z-B476-OG7Y-7N0R-GGXM-44ZS-CS40-3K6R"></form>
	    
				<form id="listForm" name="listForm" method="get" action="/groupware/approval/work/apprWorkForm/listApprForm.do?OWASP_CSRFTOKEN=MH9Z-B476-OG7Y-7N0R-GGXM-44ZS-CS40-3K6R">
				    <input type="hidden" name="topFormParentId" value="26211283">
				    <input type="hidden" name="formParentId" value="26211283">
				    <input type="hidden" name="formId" value="26211286">
				    <input type="hidden" name="actionType" value="">
				    <input type="hidden" name="sortColumn" value="">
				    <input type="hidden" name="sortType" value="">
				    <input type="hidden" name="usage" value="0">
				    <input type="hidden" name="searchWord" value="">
				    <input type="hidden" name="pageIndex" value="1">
				    <input type="hidden" name="pagePerRecord" value="10">
				    <input type="hidden" name="linkType" value="">
					<input type="hidden" name="OWASP_CSRFTOKEN" value="MH9Z-B476-OG7Y-7N0R-GGXM-44ZS-CS40-3K6R">
				</form>   
			</div>
		</div>
		
		
		<div id="formButtonDiv" class="btn-wrap pt10">
			<button id="uploadFromFileBox" type="button" class="btn btn-color7 br" onclick="">웹디스크 파일첨부</button>
		    <button id="addApprLineButton" type="button" class="btn btn-color5 br">결재선</button>
		    <button id="createApprDocButton" type="button" class="btn btn-color5 br">결재요청</button>
		    <button id="addApprRefInfoButton" type="button" class="btn btn-color7 br">기결재첨부</button>
			<button id="createApprDocTemporayButton" type="button" class="btn btn-color7 br">임시저장</button>
			<button id="listApprDocButton" type="button" class="btn btn-color7 br">취소</button>
		</div>
		
		
		
	</article>
</section>