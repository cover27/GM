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
	<script src="${path}js/modernizr.js"></script> <!-- Modernizr -->
  	
	<title>${title}</title>
	<style>
		 {
		    animation: fadein 2s;
		}
		 #main_logo {
		 	animation-name: fadein;
		 	animation-delay: 1s !important;
			animation-duration: 1s !important;
			animation-fill-mode: both !important;
			animation-timing-function: ease-in-out !important;
		 }
		 
		 @keyframes fadein { /* Safari and Chrome */
			    0% {
			        opacity: 0;
			        transform: scale(0.7);
			    }
			    100% {
			        opacity: 1;
			        transform: scale(1);
			    }
			}
		
		.pulse {
			animation-name: pulse;
			animation-delay: 1.8s !important;
			animation-duration: 3s !important;
			animation-fill-mode: both !important;
			animation-timing-function: ease-in-out !important;
			animation-iteration-count: infinite;
		}
		
		@keyframes pulse {
			0% {
				transform: scale(1);
			}
			50% {
				transform: scale(1.1);
			}
			100% {
				transform: scale(1);
			}
		}
		
		.pop {
			animation-name: pop;
			animation-duration: 1s !important;
			animation-fill-mode: both !important;
			animation-timing-function: ease-in-out !important;
		}
		@keyframes pop {
			0% {
				transform: scale(0.2);
			}
			100% {
				transform: scale(1);
			}
		}
	</style>
</head>
<body>
<section class="cd-intro">
	<div class="cd-intro-content mask">
		<img src="${path}images/main_logo.png" id="main_logo" style="position: relative; top: -30px;">
		<h1 data-content="Design Your Company" class="pulse"><span>Design Your Company</span></h1>
		<div class="action-wrapper">
			<p>
				<a href="login" class="cd-btn main-action pop">서비스 이용하기</a>
				<!-- <a href="#0" class="cd-btn">Learn More</a> -->
			</p>
		</div>
	</div>
</section>
<script src="${path}js/index.js"></script> <!-- Resource jQuery -->
</body>
</html>