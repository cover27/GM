<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function board_go(num) {
	// alert("게시판번호 : "+num);
	$.ajax({
		type : "POST",
		data : "num=" + num,
		url : "${pageContext.request.contextPath}/pages/D_boardListSetting",
		success : function(result) {
			// alert("성공");
			$("#result").html(result);
		},
		error : function() {
			alert("게시판 로딩이 실패하였습니다.");
		}
	});
}

$(function() {
	$(".createboard_btn").click(function() {
		// alert("좀 나와라");
		$("#create_board_result").css("display", "block");
		
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/admin/D_createBoards",
			success : function(result) {
				// alert("성공");
				$("#create_board_result").html(result);
			},
			error : function() {
				alert("게시판 등록이 실패하였습니다.");
			}
		});
	});
});

function create_board() {
	// alert("확인");
	/* 
	
	 */
}

function modify_board(num, b_name, anon) {
	var selector = '.boards_tree';
	$(selector).on('click', function(){
	    $(selector).removeClass('boards_tree');
	    $(this).addClass('boards_tree');
	});
	// alert("게시판번호 : "+num);
	$.ajax({
		type : "POST",
		url : "${pageContext.request.contextPath}/admin/D_boardsUpdate",
		data : {
			"num" : num,
			"b_name" : b_name,
			"anon" : anon
		},
		success : function(result) {
			// alert("성공");
			$(".boards_tree").html(result);
		},
		error : function() {
			alert("게시판 변경이 실패하였습니다.");
		}
	});
}
</script>
<section>
    <article>
        <div class="content_header">
            <h2>게시판 관리</h2>
        </div>
        <div class="content">
        	<div class="boards_setting_btnset">
				<div class="notice">
					<ul>
						<li><i class="fa fa-exclamation-circle"></i> 게시판 이름 위에 마우스를 올리면 게시판 정보를 수정하거나 게시판을 삭제할 수 있습니다.</li>
						<li><i class="fa fa-exclamation-circle"></i> "게시판 생성하기" 버튼을 클릭하면 새로운 게시판을 생성할 수 있습니다<div class=""></div></li>
					</ul>
				</div>
				<button class="createboard_btn" onclick="create_board()">게시판 생성하기</button>
        	</div>
        	<div id="create_board_result"></div>
        	<div class="w100p boards_wrap" id="result">
        		<div class="boards_trees">
        			<ul>
        				<c:forEach var="b_dtos" items="${b_dtos}">
        					<li class="boards_tree">
        						<a href="#" onclick="board_go('${b_dtos.num}')">
        							<span>${b_dtos.b_name}</span>
        						</a>
        						<span class="hover_view">
        							<button class="modify_btn" onclick="modify_board('${b_dtos.num}', '${b_dtos.b_name}', '${b_dtos.anon}')">수정</button>
        							<button class="delete_btn" onclick="delete_board()">삭제</button>
        						</span>
        						<span class="anon_status">
        							<c:if test="${b_dtos.anon == 0}">[실명게시판]</c:if>
        							<c:if test="${b_dtos.anon != 0}">[익명게시판]</c:if>
        						</span>
        					</li>
        				</c:forEach>
        			</ul>
        			<div class="paging">
						<c:if test="${cnt > 0}">
						    <c:if test="${startPage > pageBlock}">
						        <a href="<c:url value='/pages/D_boardsSetting'/>">[◀◀]</a>
						        <a href="<c:url value='/pages/D_boardsSetting?pageNum=${startPage - pageBlock}'/>">[◀]</a>
						    </c:if>
						
						    <c:forEach var="i" begin="${startPage}" end="${endPage}">
						        <c:if test="${i == currentPage}">
						            <span><b>[${i}]</b></span>
						        </c:if>
						
						        <c:if test="${i != currentPage}">
						            <a href="<c:url value='/pages/D_boardsSetting?pageNum=${i}'/>">[${i}]</a>
						        </c:if>
						    </c:forEach>
						
						    <c:if test="${pageCount > endPage}">
						        <a href="<c:url value='/pages/D_boardsSetting?pageNum=${startPage + pageBlock}'/>">[▶]</a>
						        <a href="<c:url value='/pages/D_boardsSetting?pageNum=${pageCount}'/>">[▶▶]</a>
						    </c:if>
						</c:if>
		            </div>
        		</div>
        	</div>
        </div>
    </article>
</section>