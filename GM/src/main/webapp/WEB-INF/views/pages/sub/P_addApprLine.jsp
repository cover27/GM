<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
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
</head>
<body>
	<h3>결재선지정</h3>
	<div>
		<form name="payLine" method="post">
			<div class="w50p fleft">
				<table border="1">
					<c:forEach var="dname" items="${dname }">
						<tr>
							<td>${dname }</td>
							<td></td>
						</tr>
						<c:forEach var="dto" items="${dtos }">
							<c:if test="${dto.g_name == dname}">
								<tr>
									<td><input type="radio" name="select" value="${dto.id }"></td>
									<td>${dto.name }&nbsp;${dto.r_name }</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
					<tr>
						<td>
							<input type="radio" name="pay" value="1" checked >결재<br>
							<input type="radio" name="pay" value="2">합의
						</td>
						<td><input type="button" value="추가" onclick="mySubmit(1);"></td>
					</tr>
				</table>
			</div>
			<div class="w50p fright" id="rightfield">
				<table border="1">
					<tr>
						<th>구분</th>
						<th>이름</th>
						<th></th>
					</tr>
					<%
						int i = 1;
					%>
					<c:forEach var="line" items="${sessionScope.payLine }">
						<tr>
							<c:if test="${line.order == 1 }">
								<th>
									기안
									<input type="hidden" name="order" value="<%=i %>">
									<%
										i++;
									%>
								</th>
							</c:if>
							<c:if test="${line.order == 0 }">
								<th>
									<input type="hidden" name="order" value="0">
									합의
								</th>
							</c:if>
							<c:if test="${line.order > 1 }">
								<th>
									결재
									<input type="hidden" name="order" value="<%=i %>">
									<%
										i++;
									%>
								</th>
							</c:if>
							<th>
								${line.name }&nbsp;${line.r_name }
								<input type="hidden" name="id" value="${line.id }">
							</th>
							<th>
								<input type="button" value="삭제" onclick="remove_item(this);">
								<input type="button" value="위" onclick="moveUp(this);">
								<input type="button" value="아래" onclick="moveDown(this);">
							</th>
						</tr>
					</c:forEach>
				</table>
				<input type="hidden" name="before" value="0">
				<input type="button" value="결재선지정" onclick="mySubmit(2);">
			</div>
		</form>
	</div>
</body>
</html>