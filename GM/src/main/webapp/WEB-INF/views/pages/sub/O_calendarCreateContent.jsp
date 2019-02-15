<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
table, tr, th, td{
	border:1px solid;
}
</style>

<section>
	<article>
		<div class="content_header">
			<h2>일정 등록</h2>
		</div>
		
		<!-- 일정등록 내용 -->
		<div class="content_body" style="margin-top:10px;">
			<form action="">
				<div class="content-write">
					<div class="form-block">
						<table>
							<tbody>
								<tr>
									<th scope="row"><span>*</span>기간</th>
									<td>
										<input type="text" title="날짜" name="startDate" class="startDate" placeholder="yyyy.MM.dd">
										<input type="button" value="조회">
										<select>
											<option>1:00</option><option>2:00</option><option>3:00</option><option>4:00</option>
											<option>5:00</option><option>6:00</option><option>7:00</option><option>8:00</option>
											<option>9:00</option><option>10:00</option><option>11:00</option><option>12:00</option>
											<option>13:00</option><option>14:00</option><option>15:00</option><option>16:00</option>
											<option>17:00</option><option>18:00</option><option>19:00</option><option>20:00</option>
											<option>21:00</option><option>22:00</option><option>23:00</option><option>24:00</option>
										</select>
											<span>~</span>
										<input type="text" title="날짜" name="endDate" class="endDate" placeholder="yyyy.MM.dd">
										<input type="button" value="조회">
										<select>
											<option>1:00</option><option>2:00</option><option>3:00</option><option>4:00</option>
											<option>5:00</option><option>6:00</option><option>7:00</option><option>8:00</option>
											<option>9:00</option><option>10:00</option><option>11:00</option><option>12:00</option>
											<option>13:00</option><option>14:00</option><option>15:00</option><option>16:00</option>
											<option>17:00</option><option>18:00</option><option>19:00</option><option>20:00</option>
											<option>21:00</option><option>22:00</option><option>23:00</option><option>24:00</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				
					
				</div>
				
				<!-- 일정등록 저장 footer -->
				<div class="content-footer">
					
				</div>
			</form>
		</div>
		
		
	</article>
</section>