<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${path}css/layout.css">
<link rel="stylesheet" href="${path}css/aside.css">
<link rel="stylesheet" href="${path}css/content.css">
<link rel="stylesheet" href="${path}css/D_style.css" />

<script type="text/javascript">
    var url = window.location.href.split('gm');
    var url_split = url[1].split('/');
    var category = url_split[2].split('?');
    // alert(category[0]);
    
    if(url[1] == "/pages/D_boardsSetting"){
		// alert("됨");
		$(function(){
			$("#D_boardsSetting").children().css("color", "#d3292c");
			$("#D_boardsSetting").css("font-weight", "bold");
		});
	} else if(url[1] == "/pages/D_allBoardList"){
		// alert("됨");
		$(function(){
			$("#D_allBoardList").children().css("color", "#d3292c");
			$("#D_allBoardList").css("font-weight", "bold");
		});
	}
</script>
<aside>
	<!-- 사용 안하는 사이드바
    <div class="sidebar"></div>
     -->
    <div class="nav">
        <div class="nav_title">
            <h2>게시판</h2>
            <div class="category">
                <ul>
                    <li>
                        <span id="D_allBoardList"><a href="<c:url value='/pages/D_allBoardList' />">모든 게시물</a></span>
                        <ul>
                        	<c:forEach var="b_dtos" items="${b_dtos}">
                        		<c:if test="${b_dtos.del == 0}">
                        			<li id="${b_dtos.num}">
	                        			<script type="text/javascript">
	                        				/* 선택된 메뉴 강조 */
	                        				if(url[1]=="/pages/D_boardList?num=${b_dtos.num}") {
	                        					$(function(){
	                        						$("#${b_dtos.num}").children().css("color", "#d3292c");
	                        						$("#${b_dtos.num}").css("font-weight", "bold");
	                        					});

	                        				}
	                        			</script>
                        				<a href="<c:url value='/pages/D_boardList?num=${b_dtos.num}'/>">${b_dtos.b_name}</a>
                        			</li>  
                        		</c:if>                      	
                        	</c:forEach>
                        </ul>
                    </li>
                    <li>
                        <span>관리자 메뉴</span>
                        <ul>
                            <li id="D_boardsSetting"><a href="<c:url value='/pages/D_boardsSetting' />">게시판 관리</a></li>
                            <li><a href="#">게시물 관리</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</aside>