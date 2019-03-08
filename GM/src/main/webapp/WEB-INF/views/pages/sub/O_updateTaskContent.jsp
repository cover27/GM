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
</script>

<section>
	<article>
		<div class="content_header">
			<h2>업무 요청 수정</h2>
		</div>
		
		<div class="content">
		    <div id="result">
		        <form action="<c:url value='/pages/W_updateTaskPro'/>" method="post" name="searchform123">
		        
		        <input type="hidden" name="todonum" value="${todonum}">
		        <input type="hidden" name="state" value="미완료">
		        <input type="hidden" name="del" value="0">
				<table>
					<colgroup>
						<col width="200px;" />
						<col width="*" />
					</colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span>*</span>제목</th>
                            <td>
                                <div>
                                	<input type="text" title="제목" name="subject" value="${vo.subject}" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span >*</span>업무기한</th>
                            <td style="text-align: left;">
                                <input type="date" title="업무기한" name="begin" id="now_date" value="${vo.begin}" style="width: 200px;">
								<span>~</span>
                                <input type="date" title="업무기한" name="end" id="now_date2" min="begin" value="${vo.end}" style="width: 200px;">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>*</span>담당자</th>
                            <th scope="row" style="display:none;">
                            	<span>*</span>수신자
                            </th>
                            <td style="text-align: left;">
                            	<input type="hidden" id="id" name="id" readonly>
                            	<input type="text" id="b_name" name="b_name" title="사용자" value="${vo.b_name}" style="box-shadow:none; width:200px;" required>
                            	<button onclick="searchIdPlease()" class="btn btn-color7 br">검색</button>
                            </td>
                        </tr>
                        <tr style="height:500px;">
                        	<th scope="row">내용</th>
                        	<td>
								<textarea name="content" style="width:100%; height:480px;border:0;background:#f7f7f7;">${vo.content}</textarea>
							</td>
						</tr>
                    </tbody>
                </table>		            
				    <!-- 글쓰기 내용이 들어가야하는 자리 -->        
		            
					 <div class="btnset">
						<input type="submit" class="btn btn-color5 br" id="saveButton" value="저장">
						<input type="button" class="btn btn-color7 br" onclick="window.history.back();"  value="취소">
					 </div>
				</form>
			</div>
		</div>
		
		
	</article>
</section>