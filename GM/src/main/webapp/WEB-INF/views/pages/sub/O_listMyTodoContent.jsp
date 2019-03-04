<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
/* function todoList(){
	var item = document.getElementById("todoInput").value;
	var text = document.createTextNode(item);
	var newItem = document.createElement("li");
	newItem.appendChild(text);
	document.getElementById("todoList").appendChild(newItem);
} */

/* $(function(){
	$('#todosub').click(function(){	
		$('#result').css('display', 'block');
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/pages/W_insertTodoPro',	//{컨트롤러}/이동페이지
			success : function(result){ //콜백함수
				$('#result').html(result);
			alert('ddd');
			},
			error : function(result){
				alert('오류');
			}
		});
	});
}); */
</script>

<section>
	<article>
		<div class="content_header">
			<h2>나의 할일ff11f</h2>
		</div>
		
		<div>
			<form action="<c:url value='/pages/W_insertTodoPro'/>" id="todoForm" method="post">
				<input type="text" id="todoInput" name="content" autofocus>
				<input type="submit" id="todosub" value="등록">
			</form>
			
			<div id="result">
				<%@ include file="/WEB-INF/views/pages/O_listMyTodoCreate.jsp"%>
			</div>
		</div>


	</article>
</section>