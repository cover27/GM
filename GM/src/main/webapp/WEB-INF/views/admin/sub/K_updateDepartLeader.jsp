<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		div {
			width: 520px;
		    margin: 0 auto;
		    position: relative;
		    top: 32px;
		    background: #fff;
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 3px 3px 30px #333;
		}
		
		li {
			line-height: 36px;
		}

		input[type="text"] {
			width: 100%;
		}
		
		input[type="submit"], input[type="button"], button {
			cursor: pointer;
		    padding: 5px 15px;
		    border-radius: 3px;
		    border: none;
		    font-size: 1em;
		    font-weight: bold;
		    width: 49.1%;
		    background: #555;
		    color: #fff;
    	}
    	
    	input[type="submit"] {
    		background: #d3292c;
    	}
    	
    	table {
    	font-size: 1em;
    	}
    	
    	table th {
    		border-right: 1px #e5e5e5 solid;
    		border-top: 1px #c0c0c0 solid;
		    border-bottom: 1px #c0c0c0 solid;
		    background: #f5f5f5;
		    padding: 5px 0;
		    
    	}
    	
    	table td {
	    	border-right: 1px #e5e5e5 solid;
		    border-bottom: 1px #e5e5e5 solid;
		    padding: 5px;
		    text-align: center;
    	}
    	
    	th:last-child, td:last-child {
    		border-right: 0;
    	}
	</style>
</head>
<body>

<c:if test="${mgiList.size() == 0}">
	<script type="text/javascript">
		alert('구성원이 없어 부서장을 지정할 수 없습니다.');
		self.close();
	</script>
</c:if>

<c:if test="${mgiList.size() != 0}">
	<div>
		<form action="K_departLeader_pro" method="post">
			<input type="hidden" name="depart" value="${depart }">
			<ul>
				<li>
					<c:forEach var="dto" items="${mgiList }">
						<c:if test="${dto.leader == 1 }">
							<b>현재 부서장 : </b><span>${dto.name}</span>
						</c:if>
					</c:forEach>
				</li>
			</ul>
			<table>
				<colgroup>
					<col width="50px" />
					<col width="100px" />
					<col width="80px" />
					<col width="*" />
				</colgroup>
				<thead>
					<tr>
						<th>선택</th>
						<th>이름</th>
						<th>직급</th>	
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${mgiList }">
						<tr>
							<td><input type="radio" name="check" value="${dto.id }"></td>
							<td>${dto.name }</td>
							<td>${dto.rankName }</td>
							<td>${dto.email }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4" style="height: 48px; padding: 10px;">
							<input type="submit" value="변경">
							<input type="button" value="취소" onclick="self.close();">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</c:if>
	
</body>
</html>