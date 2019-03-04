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
</script>

<section>
	<article>
		<div class="content_header">
			<h2>나의 할일</h2>
		</div>
		
		<div>
			<form id="todoForm" method="post">
				<input type="text" id="todoInput" >
				<button type="button" onclick="todoList();">클릭</button>
			</form>
			<ol id="todoList">
			
			</ol>
		</div>


	</article>
</section>