<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="<%=request.getContextPath()%>"></c:set>
<script>
/* 삭제 기능 */
$(document).ready(function() {
	// 체크 되어 있는 값 추출

	$("#bno").click(function() {

		var chked_val = "";
		$(":checkbox[name='nn']:checked").each(function(pi, po) {
			chked_val += "," + po.value;
		});
		if (chked_val != ""){
			chked_val = chked_val.substring(1);
		}
		
		if (chked_val == null || chked_val ==""){
			
			alert("1개이상 선택하셔야 합니다.");
			return true;
		}

		$('.chnno').val(chked_val);
		$('#listFrm').attr('action', '/board/delete').submit();
		alert(chked_val + "번이 삭제 되었습니다.")
		return true;
	});
	
	/* 검색기능 */
	$("#search").click(function() {
		$('#listFrm').attr('action', '/board/list').submit();
		return true;
	});
	$("#searchAll").click(function() {
		
		$("#searchText").val("");
		$('#listFrm').attr('action', '/board/list').submit();
		return true;
	});

	/* 글쓰기  */
	$('#board_jsp_write').on('click',function(){
		 $('#form_boardWrite')
		 	.attr('action','/board/register')
			.attr('method','GET')
			.submit();
	})
});
</script>

<!--container -->
<div id="container">
	<!--snb -->
	<div class="snb">서브메뉴 하나</div>
	<!--//snb -->
	<!--content -->
	<div id="content">
	<form id='listFrm'>
	<input type="hidden" name="bno" class="chnno">
	
	 <select name="searchCondition" style="height:30px">
			<option value="t" <c:out value="${searchCondition == 't'?'selected':''}"/>>제목</option>
			<option value="u" <c:out value="${searchCondition == 'u'?'selected':''}"/>>작성자</option>
		</select> 
		<input type="text" name="searchText" value=""> 
		<button class="middle color blue button" id="search">검색</button> 
			
		<table class="type03">
			<caption>* 리스트 게시판</caption>
			<colgroup>
				<col width="140px">
				<col width="140px">
				<col width="/">
				<col width="200px">
				<col width="200px">
			</colgroup>
			<tr>
				<th class='TableCenter'>
				<!-- <form id='delFrm'> -->
				<button class="midium color blue button" id="bno">삭제</button></th>
				<th class='TableCenter'>번호</th>
				<th class='TableCenter'>제목</th>
				<th class='TableCenter'>작성자</th>
				<th class='TableCenter'>등록일</th>
			</tr>
			<c:forEach items="${list}" var="lee">
				<tr>
					<td class='TableCenter'><input type="checkbox" name="nn" value="${lee.bno }" /></td>
					<td class='TableCenter'>${lee.bno}</td>
					<td class="TableLeft"><a href="/board/view?bno=${lee.bno }">${lee.title}</a></td>
					<td class='TableCenter'>${lee.userId}</td>
					<td class='TableCenter'>${lee.rgsde}</td>
					
				</tr>
			</c:forEach>
		</table>
</form>	
		<br> <a>
			<form id="form_boardWrite" name="form_boardWrite">
			<button id="board_jsp_write" type="submit"class="large color blue button">글쓰기</button>
			</form>
			</a> 
		<br>
		<br><br>
	</div>
	<!--//content -->
</div>
<!--//container -->

