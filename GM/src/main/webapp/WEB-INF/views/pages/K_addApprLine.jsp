<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>  

<script type="text/javascript">

/*결재방법 변경 실패했음 
function change1(){
		$(function(){
			var displaycourse=$('#apprTypeChange option:selected').text();
			var aaa = $(this).val();
			alert(aaa);
			$(this).parent().prev().html(displaycourse);
		});
	} */

//결재자 클릭시 추가하는 버튼
$(document).ready(function(){
	$('#btnItemAdd').click(function(){
		var radioVal = $('input[name="memName"]:checked').val();
		var radioApprType = $('input[name="apprType"]:checked').val();
			alert($('input[name="memName"]:checked').val());
			$('#liDiv > table > tbody:first').append('<tr><td style="padding:10px 5px; width: 30px; text-align: center;"><input type="checkbox" id="id2" name="id2" value="'+radioVal+'"></td><td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">'+radioApprType+ '</td><td class="textLeft ellipsis" id="apprTypeTd1" style="border-left:1px solid #F0F3F7; padding-left: 3px;"><input name="apprTypeTd2" value="'+radioVal+'" readonly></td><td><select id="apprTypeChange" name="apprTypeChange" title="결재방법변경" style="float:right;"><option value="2" selected="selected">결재</option><option value="1">합의</option></select></td></tr>');
	});
	
	//삭제 버튼
	var trHtml;
	$(document).on("click", "input[name=id2]", function() {
		trHtml = $(this).parent().parent();
	});
 	$('#btnItemRemove').click(function(){
		trHtml.remove();
	});
 	
 	// 결재선 지정 적용
 	$("#btnApply").click(function(apprTypeTd2) {
 		var approverId=[];
 		var $resultItems = $("#tbodyRusult").children();
 		
 		if($resultItems.length <= 0) {
 			alert("결재선을 선택하지 않으셨습니다.");
 			return false;
 		}else{
		var apprSend = $('input[name="apprTypeTd2"]').val();
			alert(apprSend);
			alert("결제선 적용 되었습니다.");
			opener.document.apprDocForm.apprLine0BTr1.value=apprSend;
 			
			//$('#apprLine0Tr > table > tbody > tr:last > td:last').append('<td height="60" class="last">'+apprSend+'</td>');
			
			window.close();
 		}
 		
		// 결재선 중복체크 실패했음
		/* $.each($resultItems, function(idx) {
			var data = $.extend({}, $.data(this, "data"));
			approverId[idx]=this.type=='group'?data.code:data.id;
		}); */
 	});
 	
 	
 	
 	/* 결재방법 변경 실패했음
 	$('#apprTypeChange').change(function(){
		alert(111);
		var displaycourse=$('#apprTypeChange option:selected').text();
		$(this).parent().prev().html(displaycourse);
	}); */
 	
});


</script>


<style>
.body .nav-tabs6 {
    margin: 0 0 10px;
}
.nav-tabs6 {
    padding: 0;
    margin-bottom: 10px;
    border-bottom: 1px solid #e2e6ed;
}
.nav > li {
    position: relative;
    display: block;
}
.nav-tabs6 > li {
    display: inline-block;
    margin: 0 2px -1px 0;
}
li:not(.itemContentLi) {
    list-style: none;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.nav-tabs6 > li.active a {
    font-weight: 600;
    background-color: #fff;
    border: 1px solid #bec7d2;
    border-bottom: 1px solid #fff;
    color: #fd7d86;
}
.nav > li > a {
    display: block;
    position: relative;
    padding: 8px 15px 7px;
}
.shuttleL {
    float: left;
    width: 53%;
    padding-left: 0;
}
.org-approval .shuttleL {
    width: 45%;
}
.w30p {
    width: 30% !important;
}
.shuttleM {
    float: left;
    width: 7%;
    text-align: center;
}
.org-approval .shuttleM {
    width: 10% !important;
}
.apprline {
    margin: 160px 5px 0;
    padding: 8px;
    border: 1px solid #ddd;
}
input, button, select, textarea {
    vertical-align: middle;
}
.apprline .title {
    margin-bottom: 5px;
    padding-bottom: 5px;
    font-weight: 600;
    border-bottom: 1px solid #eee;
}
.apprline ul {
    margin: 0;
}
.shuttleM li, .shuttle-basic li {
    padding: 3px 0;
    text-align: center;
}
.shuttleR {
    float: right;
    width: 40%;
    padding-right: 0;
}

.org-approval .shuttleR {
    width: 45%;
}
.w60p {
    width: 60% !important;
}
.subtitle {
    overflow: hidden;
    position: relative;
    margin: 25px 0 8px;
    padding: 0 20px;
}
.mt0 {
    margin-top: 0px !important;
}
.rbox {
    padding: 5px 20px;
    border-radius: 5px;
    border: 1px solid #e1e1e1;
    background: #f9f9f9;
}
.mb20 {
    margin-bottom: 20px !important;
}
.w130 {
    width: 130px !important;
}
.dpI {
    display: inline-block !important;
}
.line-wrap {
    height: 365px;
    margin-bottom: 20px;
    overflow: auto;
}
.fleft {
    float: left !important;
    width: auto !important;
}
.list-selectable li.nomove {
    background: #C6C6C6;
}
.wfooter {
    position: relative;
    height: 27px;
    margin: 13px 0 0 0;
    padding: 0;
    text-align: left;
    /* width:101px; */
}
.wfooter .right {
	position:absolute;
    /* position: relative; */
    top: 0;
    right:0;
    /* left: 800px; */
}
</style>
<title>결재선지정</title>


<body>
<div class="body pd" style="padding:10px;">

	<form action="K_createApprDocFormView" method="post">
		<div class="shuttleL w30p ui-tabs ui-widget ui-widget-content ui-corner-all" id="divTabs">					
			<ul class="nav nav-tabs6 push ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" data-toggle="tabs" role="tablist">
				<li class="active ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="tab-orggroup" aria-labelledby="ui-id-1" aria-selected="true">
					<a href="#tab-orggroup" data-toggle="tab" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">조직도</a>
				</li>
			</ul>
			
			<!-- 조직도 출력 부분이며, fa fa-leaf은 아이콘 모양 -->
			
			<div class="tab-content">
				<div class="tab-pane active ui-tabs-panel ui-widget-content ui-corner-bottom" id="tab-orggroup" aria-labelledby="ui-id-1" role="tabpanel" aria-expanded="true" aria-hidden="false">
					<div class="inbox h480">
						<div class="shuttleTree">
							<div id="treeDept" class="jstree jstree-0 jstree-focused jstree-ikep">
								<ul>
									<li id="treeItem_G151121" class="jstree-last jstree-open">
										<c:forEach var="dname" items="${dname}">
											-- ${dname}
											<c:forEach var="dto" items="${dtos}">
													<ul>
														<li id="treeItem_U260216" class="jstree-leaf">
														<c:if test="${dto.getG_name()==dname}">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<!-- <a href="#" onclick="approval();"> -->
															<label>
															<input type="radio" name="memName" value="${dto.getName()}(${dto.getId()}) - ${dto.getG_name()}"><ins class="fa fa-leaf">&nbsp;</ins>
																${dto.getName()}(${dto.getId()})<!-- </a> -->
															</label>
														</c:if>
														</li>
													</ul>
											</c:forEach>
										</c:forEach>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			
			
		<div class="shuttleM">
			<div class="apprline">
				<input type="hidden" title="" name="apprType" value="0">
				<div class="title">결재방법</div>
				<ul class="mb10">
					<li class="text-center"><label><input type="radio" value="결재" id="apprType" name="apprType" title="" class="radio" checked="checked">결재</label></li>
					<!-- <li class="text-center none"><label><input type="radio" value="4" name="apprType" title="" class="radio">후결</label></li> -->
					<li class="text-center"><label><input type="radio" value="합의" id="apprType" name="apprType" title="" class="radio">합의</label></li>
				</ul>
				<ul>
					<!-- fa fa-angle-left,  fa fa-undo는 아이콘 모양-->
					<li><a href="#" id="btnItemAdd" class="btn-color5"><i class="fa fa-angle-right"></i><span class="blind">Add</span></a></li>
					<li><a href="#" id="btnItemRemove"><i class="fa fa-angle-left"></i><span class="blind">Remove</span></a></li>
					<li><a id="btnItemRemoveAll" href=""><i class="fa fa-undo"></i><span class="blind"><button id="reset">Reset</button></span></a></li>
				</ul>						
			</div>
		</div>
	
	
	
	<div class="shuttleR w60p">
		<!-- inbox -->
		<div class="inbox" style="height:524px;">
			<div class="subtitle mt0">
				<h4>결재선 정보</h4>
			</div>
			
				<div class="rbox mb20 ">
					<div class="dpI w130"><strong>사용자 결재선</strong></div>
					<select title="사용자 결재선" id="userLineId" class="valign-middle ml5 w300">
						<option value="">--  선택  --</option>
																	
					</select>		
					<button class="btn s2 btn-color7 br ml5" type="button" id="btnRemove">삭제</button>
				</div>
			
				
			<div class="line-wrap">
				<div class="fleft" style="width:80% !important; overflow-y:auto;">
 						<ul id="ulResult" class="list-selectable ui-sortable" style="width:100%; font-size:1em;">
							<li class="ui-state-default important nomove">
								<div class="liDiv">
									<table cellspacing="1" cellpadding="1" border="0" style="width: 100%; table-layout:fixed; border:1px solid #eee">
										<tbody>
											<tr>
												<td style="padding:10px 5px; width: 30px; text-align: center;"></td>
												<td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">결재</td>
												<td class="textLeft ellipsis" style="border-left:1px solid #F0F3F7; padding-left: 3px;">${vo.getName()} 기안 ${vo.getG_name()}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</li>
						
							<li class="ui-state-default important move ui-selected">
								<div class="liDiv" id="liDiv">
									<table cellspacing="1" cellpadding="1" border="0" style="width: 100%; table-layout:fixed; border:1px solid #eee">
										<tbody id="tbodyRusult">
											<!-- <tr>
												<td id="apprTypeTd" style="padding:10px 5px; text-align: center; border-left:1px solid #F0F3F7; width: 70px;">결재</td>
												<td class="textLeft ellipsis" id="apprTypeTd1" style="border-left:1px solid #F0F3F7; padding-left: 3px;"></td>
											</tr> -->
										</tbody>
									</table>
								</div>
							</li>
						</ul>
					</div>
				
				<!-- <div class="fright w30p" style="overflow-y:auto;">	
					
					<div style="border:1px solid #eee" class="pt5 pl5 pr5 pb5 mb5" id="apprTypeDiv">
						<dt><strong>결재방법변경</strong>
							<dl>
								<select id="apprTypeChange" name="apprTypeChange" title="결재방법변경" class="w100p">
									<option value="0" selected="selected">결재</option>
									<option value="1">합의</option>
								</select>
							</dl>
						</dt>
					</div>
					
					<div id="setAuth" class="none" style="display: block;">
						
							<div style="border:1px solid #eee" class="pt5 pl5 pr5 pb5 mb5">
								<dt><strong>권한설정</strong>
									<dl><input type="checkbox" class="checkbox" id="docModifyAuth" name="docModifyAuth" title="문서변경"> 문서변경</dl>
								</dt>
							</div>
						
					</div>
						
					<div style="border: 1px solid rgb(238, 238, 238); display: none;" class="pt5 pl5 pr5 pb5 mb5 none" id="apprLineType">
						<dt><strong>합의 방법</strong>
							<dl class="">
								<input id="agreeSeq" type="radio" value="0" name="apprLineType" title="순차합의" checked="checked">
								<label for="agreeSeq">순차합의</label>
							</dl>
							<dl class="">
								<input id="agreePar" type="radio" value="1" name="apprLineType" title="병렬합의">
								<label for="agreePar">병렬합의</label>
							</dl>												
						</dt>
					</div>
				</div> -->
			</div>

			<div class="clearboth"></div>
				<div class="rbox">
					<div class="dpI w130"><strong>사용자 결재선명</strong></div>
					<input type="text" class="valign-middle ml5 w300" title="사용자 결재선명" id="userLineName" name="userLineName" value="">					
					<button class="btn s2 btn-color7 br ml5" type="button" id="btnSave">저장</button>
				</div>
		</div>
	</div>

	<div class="wfooter">	
		<div id="formButtonDiv">
			<div class="left"></div>
			<div class="right">							
				<button id="btnApply" type="submit" class="btn btn-color5 br">적용</button>
		    	<button id="btnClose" type="reset" class="btn btn-color7 br" onclick="self.close()">닫기</button>
		    </div>
		</div>
	</div>
	</form>	
</div>


</body>
