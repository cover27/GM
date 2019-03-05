<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
//나의 할일 등록
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

//나의 할일 삭제
$(function(){
	$('#tododel').click(function(){	
		var content = $("#todoForm").serialize(); // form submit을 ajax로 사용하기
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/pages/W_deleteTodoPro',	//{컨트롤러}/이동페이지
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
		
		<div class="content">
			<form action="<c:url value='/pages/W_insertTodoPro'/>" id="todoForm" method="post">
				<input type="text" id="todoInput" name="content" autofocus style="width: 1507px; height: 48px; font-size: 1.2em; border-radius: 5px; padding-left: 20px;">
				<input type="button" id="todosub" value="등록" class="ml2" style="font-size: 1.5em;border-radius: 4px; padding: 10px; position: relative; top: 5px;">
			</form>
			
			<div id="result" class="pb10">
				<%@ include file="/WEB-INF/views/pages/O_listMyTodoCreate.jsp"%>
			</div>
		</div>


	</article>
</section>