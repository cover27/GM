<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.spring.gm.vo.PaymentInfoVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<script type="text/javascript">
	function download(num){
		window.location="<c:url value='/pages/downloadFile?fileNum='/>"+num;
	}
</script>
<style>
	.file_download:hover {
		cursor: pointer;
		font-weight: bold;
	}
</style>
<section>
	<article>
		<div class="content_header">
			<h2>결재상세</h2>
		</div>
		<div class="content">
			<div class="sign fright mr10 mb10">
				<%
					List<PaymentInfoVO> paymentInfo = (List<PaymentInfoVO>)request.getAttribute("paymentInfo");
					//표 만맞추기위해 빈칸의 이름을 empty로 지정
					int countPay = 0;
					int countapp = 0;
					int direction = 0;
					int countEmpty = 0;
					for(int i=0;i<paymentInfo.size();i++) {
						if(paymentInfo.get(i).getRank() == 0) {
							countapp++;
						} else {
							countPay++;
						}
					}
					if(countapp>countPay) {
						direction = 1;
						countEmpty = countapp - countPay;
					} else if(countapp<countPay){
						direction = 2;
						countEmpty = countPay - countapp;
					} else {
						direction = 0;
					}
					
				%>
				<table>
					<tr>
						<c:if test="<%=direction == 1 %>">
							<%
								for(int i=0; i<countEmpty; i++){
							%>
								<th class="empty"></th>
							<%
								}
							%>
						</c:if>
						<c:forEach var="war" items="${groupInfo }">
							<c:if test="${war.rank_mem > 0 }">
								<c:if test="${war.rank_mem == 1 }">
									<th>기안</th>
								</c:if>
								<c:if test="${war.rank_mem > 1 }">
									<th>결재</th>
								</c:if>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<c:if test="<%=direction == 1 %>">
							<%
								for(int i=0; i<countEmpty; i++){
							%>
								<td class="empty"></td>
							<%
								}
							%>
						</c:if>
						<c:forEach var="war" items="${groupInfo }">
							<c:if test="${war.rank_mem > 0 }">
								<td>
									${war.name }&nbsp;${war.r_name }<br>
									<c:forEach var="war2" items="${paymentInfo }">
										<c:if test="${war.id == war2.id }">
											<c:if test="${war2.agree == 1 }">
												${war2.result }<br>${war2.reg_date }
											</c:if>
											<c:if test="${war2.agree == 0 }">
												-
											</c:if>
										</c:if>
									</c:forEach>
								</td>
							</c:if>
						</c:forEach>								
					</tr>
					<tr>
						<c:if test="<%=direction == 2 %>">
							<%
								for(int i=0; i<countEmpty; i++){
							%>
								<th class="empty"></th>
							<%
								}
							%>
						</c:if>
						<c:forEach var="war" items="${groupInfo }">
							<c:if test="${war.rank_mem == 0 }">
								<th>합의</th>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<c:if test="<%=direction == 2 %>">
							<%
								for(int i=0; i<countEmpty; i++){
							%>
								<td class="empty"></td>
							<%
								}
							%>
						</c:if>
						<c:forEach var="war" items="${groupInfo }">
							<c:if test="${war.rank_mem == 0 }">
								<td>
									${war.name }&nbsp;${war.r_name }<br>
									<c:forEach var="war2" items="${paymentInfo }">
										<c:if test="${war.id == war2.id }">
											<c:if test="${war2.agree == 1 }">
												${war2.result }<br>${war2.reg_date }
											</c:if>
											<c:if test="${war2.agree == 0 }">
												-
											</c:if>
										</c:if>
									</c:forEach>
								</td>
							</c:if>
						</c:forEach>
					</tr>
				</table>
			</div>
			<div id="result" class="clear">
				<table>
					<tr>
						<th>제목</th>
						<td style="text-align: left; padding-left: 20px;" colspan="3">${eachPayment.subject }</td>
					</tr>
					<tr>
						<th>기안자</th>
						<td>${eachPayment.name}&nbsp;(${eachPayment.id })</td>
						<th>상태</th>
						<td>${eachPayment.state }</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>${eachPayment.reg_date }</td>
						<th>만료일</th>
						<td>${eachPayment.deadline }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<c:if test="${attachList == null }">
							<td colspan="3">첨부파일이 없습니다.</td>
						</c:if>
						<c:if test="${attachList != null }">
							<td colspan="3" style="text-align: left; padding-left: 20px;">
								<c:forEach var="dto" items="${attachList }">
									<span class="mr10">
										<input type="hidden" value="${dto.num }" id="fileNum">
										<span onclick="download('${dto.num}');" class="file_download">${dto.title }&nbsp;(${Math.round(dto.filesize/1024) }Byte)</span>
									</span>
								</c:forEach>
							</td>
						</c:if>
					</tr>
				</table>
				<div class="border_t1" style="border-top:none !important;">
					<table style="min-height: 200px;">
						<tbody>
							<tr>
								<td style="text-align: left; vertical-align: top; padding:20px;">
									${eachPayment.content }
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_set mt10 mb10 fright">
					<c:if test="${eachPayment.del == 0 }">
						<span><input type="button" value="삭제" onclick="window.location='P_deletePayment?num=${num}'"></span>
					</c:if>
					<c:if test="${eachPayment.del == 1 }">
						<span><input type="button" value="복구" onclick="window.location='P_restoPayment?num=${num}'"></span>
					</c:if>
					<span><input type="button" value="목록으로" onclick="window.history.back();"></span>
				</div>
				<h3 class="clear mb10">상세사유</h3>
				<table style="border-top: 1px #c0c0c0 solid; border-bottom: 1px #c0c0c0 solid; margin-bottom: 50px;">
					<tr>
						<th>구분</th>
						<th>이름</th>
						<th>결과</th>
						<th>상세내용</th>
					</tr>
					<c:forEach var="dto" items="${paymentInfo }">
						<tr>
							<c:if test="${dto.agree == 1 && dto.content != null }">
								<c:if test="${dto.refer == 1 }">
									<th>합의</th>
								</c:if>
								<c:if test="${dto.refer == 0 }">
									<th>결재</th>
								</c:if>
								<c:forEach var="war" items="${groupInfo }">
									<c:if test="${war.id == dto.id }">
										<td>${war.name }&nbsp;${war.r_name }</td>
									</c:if>
								</c:forEach>
								<td>${dto.result }</td>
								<td>${dto.content }</td>
							</c:if>
							<c:if test="${dto.agree == 1 && dto.content == null }">
								<c:if test="${dto.refer == 1 }">
									<th>합의</th>
								</c:if>
								<c:if test="${dto.refer == 0 }">
									<th>결재</th>
								</c:if>
								<c:forEach var="war" items="${groupInfo }">
									<c:if test="${war.id == dto.id }">
										<td>${war.name }&nbsp;${war.r_name }</td>
									</c:if>
								</c:forEach>
								<td>${dto.result }</td>
								<td>-</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</article>
</section>