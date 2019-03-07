<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<html>
<head>
	<link rel="stylesheet" href="${path}css/K_style.css" />
	<style>
		.content {
			width: 780px;
		    margin: 0 auto;
		    position: relative;
		    top: 20px;
		}
		table {
			border-radius: 10px;
			box-shadow: 3px 3px 30px #555;
		}
		textarea {
			width: 100%;
		    height: 100%;
		    text-align: left;
		    vertical-align: top;
		    padding: 10px;
		    border: none;
		    background: #f7f7f7;
		}
		.btnset {
			position: relative;
    		top: 490px;
		}
	</style>
</head>
<body>
	<div class="content">
		<h3>쪽지보내기</h3>
		<form action="K_sendMessage_pro" method="post">
			<input type="hidden" name="id" value="${id }">
			<div id="result" style="border-top: 0; border-bottom: 0;">
				<table>
					<tr>
						<th style="border-radius: 10px 0 0 0;">보내는사람</th>
						<td>시스템관리자 (master)</td>
					</tr>
					<tr>
						<th>받는사람</th>
						<td>${name } (${id })</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" autofocus></td>
					</tr>
					<tr>
						<td colspan="2" style="border-bottom: 0; height: 380px;">
							<textarea name="content">
							</textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="btnset">
				<input type="submit" value="보내기" style="background: #d3292c!important;">
				<input type="button" value="닫기" onclick="self.close();" style="background: #fff!important; color: #333!important;">
			</div>
		</form>
	</div>
</body>
</html>