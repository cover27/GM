<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	function searchIdPlease() {
		var id = $('.searchp').val();
		var url = "O_searchId_sub?id=" + id;
		window.open(url, "O_searchId", "menubar=no, width=700, height=560");
	}
    function back(id,b_name){
    	opener.document.searchform123.id.value=id;
    	opener.document.searchform123.b_name.value=b_name;
    	self.close();
    }
</script>

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
.form-control{
	display:inline-block;
	width:100%;
	border:1px solid #c3c6c9;
	border-radius:2px;
	font-size:12px;
	color:#555;
	line-height:1.42857;
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
	/* background:#fff; */
	/* color:#d3292c; */
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
.table td .btn-color5.br{
	border:1px #bbb solid;
}
.table td .btn-color5{
	background:#fff !important;
}
.btn-color5.br{
	border:1px solid #363636;
}
.input-group .btn{
	border-top-left-radius:0 !important;
	border-bottom-left-radius:0 !important;
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
.label-group label:last-child{
	margin-right:0px;
}
.label-group label{
	margin-right:10px;
}
li:not(.itemContentLi){
	list-style:none;
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
.content-write .form-group{
	position:relative;
	margin-bottom: 0;
	padding:0;
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
			<h2>업무 요청 수정</h2>
		</div>
		
		<div class="content-wrap">
		    <div class="content-write">
		        <form action="<c:url value='/pages/O_updateTaskPro'/>" method="post" name="searchform123">
		        
		        <input type="hidden" name="todonum" value="${todonum}">
		        <input type="hidden" name="state" value="미완료">
		        <input type="hidden" name="del" value="0">
		            
		            <div class="form-block">
		                <table class="table">
		                    <caption></caption>
		                    <tbody>
		                        <tr>
		                            <th scope="row"><span class="text-point-b">*</span>제목</th>
		                            <td>
		                                <div>
		                                	<input type="text" title="제목" name="subject" class="form-control" value="${vo.subject}" required>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th scope="row"><span class="text-point-b">*</span>업무기한</th>
		                            <td>
		                                <input type="date" title="업무기한" name="begin" id="now_date" value="${vo.begin}">
											<span>~</span>
		                                <input type="date" title="업무기한" name="end" id="now_date2" min="begin" value="${vo.end}">
		                            </td>
		                        </tr>
		                        <tr>
		                            <th scope="row"><span class="text-point-b">*</span>담당자</th>
		                            <th scope="row" style="display:none;">
		                            	<span class="text-point-b">*</span>수신자
		                            </th>
		                            <td>
		                            	<div style="position: relative;">
			                                <div class="input-group organization">
			                                	<div class="tagsinput">
			                                		<input type="hidden" class="searchp" id="id" name="id" style="box-shadow:none; width:90%;" readonly>
			                                		<input type="text" class="searchp" id="b_name" name="b_name" title="사용자" value="${vo.b_name}" style="box-shadow:none; width:90%;" required>
			                                	</div>
			                                	<button onclick="searchIdPlease()" class="btn btn-color7 br">검색</button>
			                                </div>
		                                </div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th scope="row"><label for="docId">관련업무</label></th>
		                            <td>
		                                <button type="button" class="btn btn-color7 br" onclick="javascript:selectTodoViewPopup();">관련업무 추가</button>
		                                <div id="addTask"></div>
		                            </td>
		                        </tr>
		                        <tr>
		                            <th scope="row"><label for="apprId">관련결재</label></th>
		                            <td>
		                                <button type="button" class="btn btn-color7 br" onclick="javascript:selectApprPopup();">관련결재 추가</button>
		                                <div id="addAppr"></div>
		                            </td>
		                        </tr>
		                        <tr style="height:400px;">
		                        	<th scope="row">내용</th>
		                        	<td>
										<textarea name="content" style="width:100%; height:390px;">${vo.content}</textarea>
									</td>
								</tr>
		                    </tbody>
		                </table>
		            </div>
		            
				    <!-- 글쓰기 내용이 들어가야하는 자리 -->        
		            
					 <div class="btn-wrap">
						<input type="submit" class="btn btn-color5 br" id="saveButton" value="저장">
						<input type="button" class="btn btn-color7 br" onclick="window.history.back();"  value="취소">
					 </div>
				</form>
			</div>
		</div>
		
		
	</article>
</section>