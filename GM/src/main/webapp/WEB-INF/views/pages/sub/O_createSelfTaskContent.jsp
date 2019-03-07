<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function searchIdPlease() {
		var id = $('.searchp').val();
		var url = "W_searchId_sub?id=" + id;
		window.open(url, "W_searchId", "menubar=no, width=700, height=560");
	}
    function back(id,b_name){
    	opener.document.searchform123.id.value=id;
    	opener.document.searchform123.b_name.value=b_name;
    	self.close();
    }
    
 	 //날짜 예외처리 방법
    function lastDate(){
    	var lastD = $('#now_date').val();
    	$('#now_date2').attr("min", lastD);
    }
    function firstDate(){
    	var firstD = $('#now_date2').val();
    	$('#now_date').attr("max", firstD);
    }
    function checkName(){
    	if(!document.searchform123.b_name.value){
    		alert('담당자를 지정해야 합니다.');
    		return false;
    	}
    }
</script>

<section>
	<article>
		<div class="content_header">
			<h2>업무 등록</h2>
		</div>
		<div class="content">
		    <div class="content">
		        <form action="<c:url value='/pages/W_createSelfTaskPro'/>" method="post" name="searchform123" onsubmit="return checkName();">
			        <input type="hidden" name="todonum" value="${todonum}">
			        <input type="hidden" name="groupId" value="${groupId}">
			        <input type="hidden" name="state" value="${state}">
			        <input type="hidden" name="del" value="${del}">
			        <input type="hidden" name="reg_date" value="${reg_date}">
			        <input type="hidden" name="reg_date2" value="${reg_date2}">
			        <input type="hidden" name="donum" value="${donum}">
		            <div id="result">
		                <table>
		                	<colgroup>
		                		<col width="200px;" />
		                		<col width="600" />
		                		<col width="200px;" />
		                		<col width="*" />
		                	</colgroup>
		                    <tbody>
		                        <tr>
		                            <th><span>*</span>제목</th>
		                            <td colspan="3"><input type="text" title="제목" name="subject" placeholder="제목을 입력하세요." required autofocus></td>
		                        </tr>
		                        <tr>
		                            <th><span>*</span>업무기한</th>
		                            <td style="text-align: left;">
		                            	<input type="date" title="업무기한" name="begin" id="now_date" onchange="lastDate()" max="firstD" style="width: 130px;">
		                                <script>
											document.getElementById('now_date').valueAsDate = new Date();
										</script>
										<span>~</span>
		                                <input type="date" title="업무기한" name="end" id="now_date2" onchange="firstDate()" min="lastD" style="width: 130px;">
		                                <script>
											document.getElementById('now_date2').valueAsDate = new Date();
										</script>
										<!-- <button type="button" onclick="javascript:selectTodoViewPopup();" class="ml50">관련업무 추가</button>
		                                <button type="button" onclick="javascript:selectApprPopup();" class="ml20">관련결재 추가</button> -->
		                            </td>
		                            <th><span>*</span>담당자</th>
		                            <th style="display:none;">
		                            	<span>*</span>수신자
		                            </th>
		                            <td style="text-align: left;">
	                               		<input type="hidden" class="searchp" name="id">
	                               		<input type="text" class="searchp" name="b_name" title="사용자" required style="width:308px;" readonly>
	                                	<a href="#" onclick="searchIdPlease();" style="margin-left: 5px;background: #555;color:#fff;border-radius:5px;padding:5px;font-size:0.8em;font-weight:bold;">검색</a>
		                            </td>
		                        </tr>
		                        <tr style="height:400px;">
		                        	<th>내용</th>
		                        	<td colspan="3">
										<textarea name="content" style="padding: 10px;width:100%; height:620px; border:solid 1px #eee; background: #f7f7f7;"></textarea>
									</td>
								</tr>
		                    </tbody>
		                </table>
		            </div>
		            
				    <!-- 글쓰기 내용이 들어가야하는 자리 -->        
		            
					 <div class="btnset">
						<input type="submit" id="saveButton" value="저장">
						<input type="button" onclick="window.history.back();"  value="취소">
					 </div>
				</form>
			</div>
		</div>
		
		
	</article>
</section>