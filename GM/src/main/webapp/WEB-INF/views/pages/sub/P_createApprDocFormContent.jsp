<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.gm.vo.Join_payVO2" %>
<!-- text-editor를 쓰기 위한 script 파일 설정으로 아래 textarea가 있어야 한다. -->
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<script type="text/javascript">
function addApprLine(){
	var url="P_addApprLine";
	window.open(url, "addApprLine", "menubar=no, width=1000, height=800");
}

function cancelPay(){
	window.location='P_listApprTodoView';
}

function checkSubject(){
	if(!document.apprDocForm.subject.value){
		alert('제목을 입력해야 합니다.');
		return false;
	}
	document.apprDocForm.submit();
}
</script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
	<article>
		<div class="content_header">
			<h2>기안문 작성</h2>
		</div>
		<!-- 
		결재 선 라인
		<div class="btnset mt10 mb10">
		    <input type="button" name="payLine" value="결재선" onclick="addApprLine();">
		    <input type="button" name="paySubmit" value="결재요청" onclick="document.apprDocForm.submit();">
		    <input type="button" name="cancel" value="취소" onclick="cancelPay();">
		</div>
		 -->
		<!-- 기안 용지 작성 content -->
		<div class="content">
			<div>	
				<form name="apprDocForm" method="post" action="P_apprDocFormReqPro" enctype="multipart/form-data">
			       	<input type="hidden" name="del" value="0">
					<h3 class="mb10">기안용지</h3>
					<!-- 결재 sign 부분 -->	
					<%
						List<Join_payVO2> payLine = (List<Join_payVO2>)request.getSession().getAttribute("payLine");
						//표 만맞추기위해 빈칸의 이름을 empty로 지정
						int countPay = 0;
						int countapp = 0;
						int direction = 0;
						int countEmpty = 0;
						for(int i=0;i<payLine.size();i++) {
							if(payLine.get(i).getOrder() == 0) {
								countapp++;
							} else {
								countPay++;
							}
						}
						if(countapp>countPay) {
							direction = 1;
							countEmpty = countapp - countPay;
						} else if(countapp<countPay){
							direction = 2;
							countEmpty = countPay - countapp;
						} else {
							direction = 0;
						}
					
				%>		
					<div class="sign fright mr10 mb10">
						<table>
							<tr>
								<c:if test="<%=direction == 1 %>">
									<%
										for(int i=0; i<countEmpty; i++){
									%>
										<th class="empty"></th>
									<%
										}
									%>
								</c:if>
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
								<c:if test="<%=direction == 1 %>">
									<%
										for(int i=0; i<countEmpty; i++){
									%>
										<td class="empty"></td>
									<%
										}
									%>
								</c:if>
								<c:forEach var="line" items="${sessionScope.payLine }">
									<c:if test="${line.order != 0}">
										<td>${line.r_name }<br>${line.name }</td>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<c:if test="<%=direction == 2 %>">
									<%
										for(int i=0; i<countEmpty; i++){
									%>
										<th class="empty"></th>
									<%
										}
									%>
								</c:if>
								<c:forEach var="line" items="${sessionScope.payLine }">
									<c:if test="${line.order == 0}">
										<th>합의</th>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<c:if test="<%=direction == 2 %>">
									<%
										for(int i=0; i<countEmpty; i++){
									%>
										<td class="empty"></td>
									<%
										}
									%>
								</c:if>
								<c:forEach var="line" items="${sessionScope.payLine }">
									<c:if test="${line.order == 0}">
										<td>${line.r_name }<br>${line.name }</td>
									</c:if>
									<input type="hidden" name="id" value="${line.id }">
									<input type="hidden" name="order" value="${line.order }"> 
								</c:forEach>
							</tr>
						</table>
					</div>
					<%
						request.getSession().removeAttribute("payLine");
					%>
					<div id="result" class="clear">
						<table>
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
										<!-- <label class="file_label">첨부파일<input type="file" name="file"></label> -->
										<input type="file" name="file">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- <div id="formLinkedHtmlDataDiv" style="border: 1px solid #e0e0e0;" class="mt10 padding10 none"></div> -->								
					<div class="border_t1" style="border-top:none !important;">
						<div id="editorDiv">
							<div id="content1">
								<!-- text-editor를 쓰기 위함으로 class name은 ckeditor로 쓰여야 한다. -->
								<textarea class="ckeditor" id="formEditorData" title="formEditorData" name="formEditorData"></textarea>
								<!-- text-editor를 쓰기 위함으로 위의 textarea의 class name이 아래 쓰인다. -->
								<script>CKEDITOR.replace('formEditorData')</script>
								<!-- <input type="text" id="content" name="content"> --> 
							</div>
						</div>
					</div>
		
					<div class="btnset mt30 mb50">
					    <input type="button" name="payLine" value="결재선" onclick="addApprLine();">
					    <input type="button" name="paySubmit" value="결재요청" onclick="checkSubject();">
					    <input type="button" name="cancel" value="취소" onclick="cancelPay();">
					</div>
				</form>
			</div>
		</div>
		
		
	</article>
</section>