<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<section>
	<article>
		<div class="content_header">
			<h2>인사정보등록</h2>
		</div>
		<br>
		<div style="overflow-y: scroll; height:400px;">
         <table border="1">
         	<select name="">
         	</select>
            <c:forEach var="dto" items="${list }">
               <tr>
                  <th>${dto.id}</th>
               </tr>
            </c:forEach>
         </table>
      </div>
	</article>
</section>