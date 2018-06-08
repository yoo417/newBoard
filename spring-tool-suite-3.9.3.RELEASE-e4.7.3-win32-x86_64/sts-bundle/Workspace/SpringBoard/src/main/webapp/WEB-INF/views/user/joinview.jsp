<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--container -->
<div id="container">
	<!--snb -->
	<!-- <div class="snb">서브메뉴 하나</div> -->
	<!--//snb -->
	<!--content -->
	<form id="form_join" name="form_join">
		<%-- <input type="hidden" name="userId" value="${userId}" />
		<input type="hidden" name="userPW" value="${userPW}" />
		<input type="hidden" name="userName" value="${userName}" />
		<input type="hidden" name="userEmail" value="${userEmail}" />
		<input type="hidden" name="userPhoneNum" value="${userPhoneNum}" />
		 --%>
	<div id="content">
		<table class="type02">
			<caption>* 가입정보 확인</caption>
			<colgroup>
				<col width="250px">
				<col width="/">
			</colgroup>
			
			<%-- <c:forEach items="${view}" var="view"> --%>
			<tr>
				<th scope="row">ID</th>
				<td>${userview.userId}</td>
				<td>${userId}</td>
			</tr>
			<tr>
				<th scope="row">PASSWORD</th>
				<td>${userview.userPw }</td>
				<td>${userPw }</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>${userview.userName }</td>
				<td>${userName }</td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td>${userview.userEmail }</td>
				<td>${userEmail }</td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td>${userview.userPhoneNum }</td>
				<td>${userPhoneNum }</td>
			</tr>
			<%-- </c:forEach>  --%>
		</table>
		
		<br>
	</div>
	<div style="margin-top: 40px;">
			<%-- <button
				style="width: 150px; height: 50px; background-color: black; color: white;"
				type="button" id="b_check"><a href="/user/joinview?userId=${joinview.userId }">내정보확인</a></button> --%>
			<!-- <button
				style="width: 150px; height: 50px; background-color: black; color: white;"
				type="button" id="b_modi">수정하기</button> -->
			<button
				style="width: 150px; height: 50px; background-color: black; color: white;"
				type="button" id="b_intro">메인으로</button>
			
		</div>
	<!--//content -->
	</form>
</div>
<!--//container -->


<script>
	$('#b_intro').on('click',function() {
				$('#form_join').attr('action', '${path.context}/main')
						.attr('method', 'GET').submit();
			})
	$('#b_modi').on('click',function() {
				$('#form_join').attr('action', '${path.context}/user/modify')
						.attr('method', 'GET').submit();
			})
/* 	 $('#b_check').on('click',function() {
				$('#form_join').attr('action', '${path.context}/user/joinview?userId=${joinview.userId }')
						.attr('method', 'GET').submit();
			})  */
</script>
