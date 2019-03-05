<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function todoList(){
	var item = document.getElementById("todoInput").value;
	var text = document.createTextNode(item);
	var newItem = document.createElement("li");
	newItem.appendChild(text);
	document.getElementById("todoList").appendChild(newItem);
}

$(function(){
	$('#todosub').click(function(){	
		var content = $("#todoForm").serialize(); // form submit을 ajax로 사용하기
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/pages/W_insertTodoPro',	//{컨트롤러}/이동페이지
			data : content,
			success : function(result){ //콜백함수
				$('#result').html(result);
			},
			error : function(result){
				alert('오류');
			}
		});
	});
});
</script>

<section>
	<article>
		<div class="content_header">
			<h2>나의 할일</h2>
		</div>
		
		<div>
			<form action="<c:url value='/pages/W_insertTodoPro'/>" id="todoForm" method="post">
				<input type="text" id="todoInput" name="content" autofocus>
				<input type="button" id="todosub" value="등록">
			</form>
			
			<div id="result">
				<%@ include file="/WEB-INF/views/pages/O_listMyTodoCreate.jsp"%>
			</div>
		</div>


	</article>
</section>