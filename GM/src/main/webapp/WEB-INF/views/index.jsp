<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="${path}css/reset.css" /> <!-- CSS reset -->
	<link rel="stylesheet" href="${path}css/index.css" /> <!-- Resource style -->
	<script src="js/modernizr.js"></script> <!-- Modernizr -->
  	
	<title>${title}</title>
	<style>
		#main_logo {
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
	</style>
</head>
<body>
<section class="cd-intro">
	<div class="cd-intro-content mask">
		<img src="${path}images/main_logo.png" id="main_logo" style="position: relative; top: -30px;">
		<h1 data-content="Group Ware Maker"><span>Group Ware Maker</span></h1>
		<div class="action-wrapper">
			<p>
				<a href="login" class="cd-btn main-action">서비스 이용하기</a>
				<!-- <a href="#0" class="cd-btn">Learn More</a> -->
			</p>
		</div>
	</div>
</section>
<script src="${path}js/index.js"></script> <!-- Resource jQuery -->
</body>
</html>