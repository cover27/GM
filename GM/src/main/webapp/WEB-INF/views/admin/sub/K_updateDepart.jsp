<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		div {
			width: 280px;
		    margin: 0 auto;
		    position: relative;
		    top: 68px;
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
	</style>
</head>
<body>
	<div>
		<form action="K_updateDepartName" method="post">
			<ul>
				<li>
					<input type="hidden" name="depart" value="${depart }">
					<span>선택 부서 : </span>
					<span>${departName}</span>
				</li>
				<li>
					<input type="text" name="dname" required>
					<input type="submit" value="변경">
					<input type="button" value="취소" onclick="self.close();">
				</li>
			</ul>
		</form>
	</div>
</body>
</html>