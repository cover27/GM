<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- text-editor를 쓰기 위한 script 파일 설정으로 아래 textarea가 있어야 한다. -->
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<script type="text/javascript">
function addApprLine(){
	var url="P_addApprLine";
	window.open(url, "addApprLine", "menubar=no, width=1000, height=560");
}

function cancelPay(){
	window.location='P_listApprTodoView';
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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
	<article>
		<div class="content_header">
			<h2>기안문 작성</h2>
		</div>
		
		<!-- 결재 선 라인 -->
		<div id="formButtonDiv" class="btn-wrap pt10">
		    <input type="button" name="payLine" value="결재선" onclick="addApprLine();">
		    <input type="button" name="paySubmit" value="결재요청" onclick="document.apprDocForm.submit();">
		    <input type="button" name="cancel" value="취소" onclick="cancelPay();">
		</div>
		
		<!-- 기안 용지 작성 content -->
		<div class="content-wrap approval responsive">
			<div class="content-write">	
				<form id="apprDocForm" name="apprDocForm" method="post" action="P_apprDocFormReqPro" enctype="multipart/form-data">
			       	<input type="hidden" name="del" value="0">
					
					<h2>기안용지</h2>
					
					<!-- 결재 sign 부분 -->					
					<table border="1">
						<tr>
							<c:forEach var="line" items="${sessionScope.payLine }">
								<c:if test="${line.order == 1}">
									<th>기안</th>
								</c:if>
								<c:if test="${line.order > 1}">
									<th>결재</th>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="line" items="${sessionScope.payLine }">
								<c:if test="${line.order != 0}">
									<th>${line.r_name }<br>${line.name }</th>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="line" items="${sessionScope.payLine }">
								<c:if test="${line.order == 0}">
									<th>합의</th>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="line" items="${sessionScope.payLine }">
								<c:if test="${line.order == 0}">
									<th>${line.r_name }<br>${line.name }</th>
								</c:if>
								<input type="hidden" name="id" value="${line.id }">
								<input type="hidden" name="order" value="${line.order }"> 
							</c:forEach>
						</tr>
					</table>
					<%
						request.getSession().removeAttribute("payLine");
					%>
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
									<td><input type="hidden" name="num" value="">자동채번</td>
									<th>기안일자</th>
									<td><input type="hidden" name="reg_date" value="${today}">${today}</td>
								</tr>
								<tr>
									<th>기안자</th>
									<td><input type="hidden" name="name" value="${vo.getName()}">${vo.getName()} (${vo.getR_name()})</td>
									<th>기안부서</th>
									<c:if test="${vo.getG_name() != null }">
										<td>
											<input type="hidden" name="apprGroupId" value="${vo.getG_name()}">${vo.getG_name()}
										</td>
									</c:if>
									<c:if test="${vo.getG_name() == null }">
										<td>
											<input type="hidden" name="apprGroupId" value="${vo.getC_name()}">${vo.getC_name()}
										</td>
									</c:if>
								</tr>
								<tr>
									<th><span class="text-point-b">*</span>문서제목</th>
									<td colspan="3">
						    			<input type="text" name="subject" class="inputbox w100p" maxlength="100" placeholder="문서제목을 입력하세요." required autofocus>
									</td>
								</tr>
								<tr>
									<th>
										첨부파일
									</th>
									<td colspan="3">
										<input type="file" name="file">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- <div id="formLinkedHtmlDataDiv" style="border: 1px solid #e0e0e0;" class="mt10 padding10 none"></div> -->								
					<div class="border_t1" style="border-top:none !important;">
						<div id="editorDiv">
							<div id="content1" style="width:100%; height:550px;">
								<!-- text-editor를 쓰기 위함으로 class name은 ckeditor로 쓰여야 한다. -->
								<textarea class="ckeditor" id="formEditorData" title="formEditorData" name="formEditorData"></textarea>
								<!-- text-editor를 쓰기 위함으로 위의 textarea의 class name이 아래 쓰인다. -->
								<script>CKEDITOR.replace('formEditorData')</script>
								<!-- <input type="text" id="content" name="content"> --> 
							</div>
						</div>
					</div>
		
					<div id="formButtonDiv" class="btn-wrap pt10">
					    <input type="button" name="payLine" value="결재선" onclick="addApprLine();">
					    <input type="button" name="paySubmit" value="결재요청" onclick="document.apprDocForm.submit();">
					    <input type="button" name="cancel" value="취소" onclick="cancelPay();">
					</div>
				</form>
			</div>
		</div>
		
		
	</article>
</section>