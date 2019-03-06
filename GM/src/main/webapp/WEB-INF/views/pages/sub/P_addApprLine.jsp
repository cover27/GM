<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<link rel="stylesheet" href="${path}css/P_style.css" />
<script type="text/javascript">
	function checkMember(){
		if(!document.payLine.select.value){
			alert('결재구성원을 선택해야 합니다');
			return false;
		}
	}
	
	 function remove_item(obj){
    	$(obj).parent().parent().remove();
        // obj.parentNode 를 이용하여 삭제
        // document.getElementById('field').removeChild(obj.parentNode);
    }
	 
 	function moveUp(el){
		var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
		$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
	}
	
	function moveDown(el){
		var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
		$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
	}
	
	function mySubmit(index){
		if(index == 1){
			if(!document.payLine.select.value){
				alert('결재구성원을 선택해야 합니다');
				return false;
			}
			document.payLine.action='P_payLinePro';
			document.payLine.submit();
		} else if(index == 2){
			document.payLine.action='P_resistPayLine';
			document.payLine.submit();
		}
		
	}
</script>
<html>
<head>
	<style>
		body {
			background: #fff;
		}
	</style>
</head>
<body>
	<div class="content" style="padding:20px;overflow-y: scroll;">
		<h3 class="mb10">결재선지정</h3>
		<div>
			<form name="payLine" method="post">
				<div class="w30p fleft payleft">
					<table>
						<c:forEach var="dname" items="${dname }">
							<tr>
								<th>${dname }</th>
							</tr>
							<c:forEach var="dto" items="${dtos }">
								<c:if test="${dto.g_name == dname}">
									<tr>
										<td>
											<label>
												<input type="radio" name="select" value="${dto.id }">
												<span class="ml10">${dto.name }</span>
												<span class="ml10">${dto.r_name }</span>
											</label>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:forEach>
					</table>
				</div>
				<div class="w10p fleft ml30 howpay mt40" style="font-size: 1em;">
					<ul>
						<li>
							<label>
								<input type="radio" name="pay" value="1" checked >
								<span class="ml5">결재</span>
							</label>
						</li>
						<li>
							<label>
								<input type="radio" name="pay" value="2">
								<span class="ml5">합의</span>
							</label>
						</li>
						<li class="mt30">
							<input type="button" value="추가" onclick="mySubmit(1);" style="width:100%; height: 36px;">
						</li>
						<li class="mt10">
							<input type="button" value="결재선 지정" onclick="mySubmit(2);" style="width: 100%; height: 36px; background: #d3292c;">
						</li>
					</ul>
				</div>
				<div class="w55p fright payright" id="rightfield">
					<table>
						<colgroup>
							<col width="100px" />
							<col width="*" />
							<col width="200px" />
						</colgroup>
						<tr>
							<th>구분</th>
							<th>이름</th>
							<th>순서</th>
						</tr>
						<%
							int i = 1;
						%>
						<c:forEach var="line" items="${sessionScope.payLine }">
							<tr>
								<c:if test="${line.order == 1 }">
									<td>
										기안
										<input type="hidden" name="order" value="<%=i %>">
										<%
											i++;
										%>
									</td>
								</c:if>
								<c:if test="${line.order == 0 }">
									<td>
										<input type="hidden" name="order" value="0">
										합의
									</td>
								</c:if>
								<c:if test="${line.order > 1 }">
									<td>
										결재
										<input type="hidden" name="order" value="<%=i %>">
										<%
											i++;
										%>
									</td>
								</c:if>
								<td>
									${line.name }&nbsp;${line.r_name }
									<input type="hidden" name="id" value="${line.id }">
								</td>
								<td>
									<input type="button" onclick="moveUp(this);" class="upBtn">
									<input type="button" onclick="moveDown(this);" class="downBtn">
									<input type="button" value="삭제" onclick="remove_item(this);" style="background: #d3292c;">
								</td>
							</tr>
						</c:forEach>
					</table>
					<input type="hidden" name="before" value="0">
				</div>
			</form>
		</div>
	</div>
</body>
</html>