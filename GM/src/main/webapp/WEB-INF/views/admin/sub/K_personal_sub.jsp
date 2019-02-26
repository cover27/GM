<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/setting.jsp"%> --%>
<script type="text/javascript">

    function add_item(){
        // pre_set 에 있는 내용을 읽어와서 처리..
        var div = document.createElement('div');
        div.innerHTML = document.getElementById('pre_set').innerHTML;
        document.getElementById('field').appendChild(div);
    }
 
    function remove_item(obj){
    	$(obj).parent().parent().parent().parent().remove();
        // obj.parentNode 를 이용하여 삭제
        // document.getElementById('field').removeChild(obj.parentNode);
    }
	
    
</script>
<section>
	<article>
		<div class="content_header">
			<h2>근태/급여 기준정보 설정</h2>
		</div>
		<div class="content">
			<div class="k_personal">
				<div id="pre_set" style="clear:both; display:none;">
					<ul>
						<li>
							<div class="fleft">
								<div>
									<span> 입사연차 : </span>
									<span><input type="text" name="year"></span>
									<span>년 이상</span>
								</div>
								<div>
									<span>연차허용일수 : </span>
									<span><input type="text" name="day"></span>
									<span>일</span>
								</div>
							</div>
							<div class="fright">
								<input type="button" value="삭제" onclick="remove_item(this)">
							</div>
						</li>
					</ul>
				</div>
				<div>
					<form action="<c:url value='/admin/registpersonal'/>" method="post">
						<ul>
							<li class="ml10">
								<span>여름휴가 : </span>
								<span><input type="text" name="holiday" value="${holiday }"></span>
								<span>일</span>
							</li>
						</ul>
						<hr>
						<div id="field" class="fleft w49p" style="overflow-y:auto;max-height:760px;">
							<input type="button" value=" 추가 " onclick="add_item()">
							<c:forEach var="dto" items="${dayoffList }">
								<div id="pre_set" style="clear:both;">
									<ul>
										<li>
											<div class="fleft">
												<div>
													<span> 입사연차 : </span>
													<span><input type="text" name="year" value="${dto.year }"></span>
													<span>년 이상</span>
												</div>
												<div>
													<span>연차허용일수 : </span>
													<span><input type="text" name="day" value="${dto.day }"></span>
													<span>일</span>
												</div>
											</div>
											<div class="fright">
												<input type="button" value="삭제" onclick="remove_item(this)">
											</div>
										</li>
									</ul>
								</div>
							</c:forEach>
						</div>
						<div class="fright w49p" style="overflow-y:auto;max-height:760px;">
							<input type="submit" value="저장">
							<ul>
								<li>
									<span>근무시각</span>
									<span><input type="time" name="go" value="${attended.gos }"></span>
									<span style="margin:0 10px;">~</span>
									<span><input type="time" name="off" value="${attended.offs }"></span>
								</li>
								<li>
									<span>휴게시각</span>
									<span>
										<input type="time" name="rest_start" value="${attended.rest_starts }">
										<span style="margin:0 10px;">~</span>
										<input type="time" name="rest_end" value="${attended.rest_ends }">
									</span>
								</li>
								<li>
									<span>연장근로시각</span>
									<span>
										<input type="time" name="over_start" value="${attended.over_starts }">
										<span style="margin:0 10px;">~</span>
										<input type="time" name="over_end" value="${attended.over_ends }">
									</span>
								</li>
								<li>
									<span>연장근무시간당 수당</span>
									<input type="text" name="over_sal" value="${attended.over_sal }">
								</li>
								<li>
									<span>야간근무시각</span>
									<span><input type="time" name="night_start" value="${attended.night_starts }"></span>
									<span style="margin:0 10px;">~</span>
									<span><input type="time" name="night_end" value="${attended.night_ends }"></span>
								</li>
								<li>
									<span>야간근무시간당 수당</span>
									<input type="text" name="night_sal" value="${attended.night_sal }">
								</li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</article>
</section>