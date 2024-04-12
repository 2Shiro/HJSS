<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="id" value="${ id }" />
<c:set var="startnum" value="${ searchVo.pagination.startPage         }" />
<c:set var="endnum" value="${ searchVo.pagination.endPage }" />
<c:set var="totalpagecount"
	value="${ searchVo.pagination.totalRecordCount  }" />

<div id="paging" style="margin: 20px 0px;">
	<table style="width: 100%; height: 25px; text-align: center;">
			<tr>
			<td style="width: 100%; height: 25px; text-align: center;">
				<!-- 처음/ 이전 --> <c:if test="${nowpage > 1}">
					<a href="/Person/MyResume?id=${ id }&nowpage=1">⏮</a>
					<a href="/Person/MyResume?id=${ id }&nowpage=${ startnum - 1 }">
						⏪ </a>
				</c:if> <!-- 1 2 3 4 5 6 [7] 8 9 10  --> <c:forEach var="pagenum"
					begin="${startnum}" end="${endnum}" step="1">
					<a href="/Person/MyResume?id=${ id }&nowpage=${ pagenum }"> ${ pagenum }
					</a>&nbsp;&nbsp;     
     </c:forEach> <!-- 다음 / 마지막 --> <c:if test="${searchVo.pagination.existNextPage}">
    <a href="/Person/MyResume?id=${ id }&nowpage=${ endnum + 1 }">⏩ </a>
    <a href="/Person/MyResume?id=${ id }&nowpage=${ totalpagecount }">⏭</a>
</c:if>


			</td>
		</tr>
	</table>
</div>








