<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
	<link rel="stylesheet" href="${path}css/find_account.css">
	<style>
		.findAccount_wrap {
		    animation: fadein 2s;
		    -moz-animation: fadein 2s; /* Firefox */
		    -webkit-animation: fadein 2s; /* Safari and Chrome */
		    -o-animation: fadein 2s; /* Opera */
		}
		@keyframes fadein {
		    from {
		        opacity:0;
		    }
		    to {
		        opacity:1;
		    }
		}
		@-moz-keyframes fadein { /* Firefox */
		    from {
		        opacity:0;
		    }
		    to {
		        opacity:1;
		    }
		}
		@-webkit-keyframes fadein { /* Safari and Chrome */
		    from {
		        opacity:0;
		    }
		    to {
		        opacity:1;
		    }
		}
		@-o-keyframes fadein { /* Opera */
		    from {
		        opacity:0;
		    }
		    to {
		        opacity: 1;
		    }
		}
		.findAccount_box {
			padding: 20px;
		}
		.text_wrap {
			background: #fff;
			width: 100%;
			height: 100%;
			padding: 28px 40px;
			border-radius: 5px;
			line-height: 32px;
		}
		h2 {
			padding-top: 50px !important;
			color: #777 !important;
			font-size: 24px !important;
		}
		h3 {
			font-size: 24px;
			font-weight: bold;
			margin-bottom: 40px;
		}
		button {
			display: inline-block;
		    width: 185px;
		    height: 40px;
		    text-align: center;
		    font-size: 16px;
		    font-weight: 600;
		    color: #fff;
		    border-radius: 4px;
		    cursor: pointer;
		    background: #555;
		    border: 1px solid #555;
		}
		button:hover {
			opacity: 0.8;
		}
	</style>
	<script>
		$(function(){
			var url = window.location.href
			$('#getUrl').html(url);
		});
	</script>
</head>
<body>
	<div class="findAccount_wrap">
		<div style="width: 320px; margin: 0 auto;">
			<a href="index">
				<img src="${path}images/main_logo.png" id="main_logo">
			</a>
			<h2>
				error <span style="font-size: 52px; color: #d3292c;">403</span> Forbidden
				
			</h2>
		</div>
		<div class="findAccount_box" style="left: 50%;">
			<div class="text_wrap">
				<ul>
					<li>
						<h3>
							접근이 거부되었습니다.
						</h3>
					</li>
					<li style="margin-bottom: 18px;">
						<b>입력된 url</b> : "<span id="getUrl" style="width: 270px; display: inline-block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; position: relative; top: 12px; left: 1px;"></span>"
					</li>
					<li>
						현재 페이지에 접근 가능한 권한이 없습니다.
					</li>
					<li>
						관리자에게 문의해 주시기 바랍니다.
					</li>
				</ul>
				<div class="form_area" style="top: 270px;">
					<button onclick="history.back();"><i class="fas fa-backward mr5"></i>이전 페이지</button>
					<button onclick="window.location='index';" style="margin-left: 5px;"><i class="fas fa-home mr5"></i>첫 페이지</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>