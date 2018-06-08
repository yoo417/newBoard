<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--container -->
<div id="container">
	<!--snb -->
	<!-- <div class="snb">서브메뉴 하나</div> -->
	<!--//snb -->
	<!--content -->
	<form id="form_join" name="form_join" action="/joinGo" method="post">
	<div id="content">
	
		<table class="type02">
			<caption>* 회원가입 페이지</caption>
			<colgroup>
				<col width="250px">
				<col width="/">
			</colgroup>
			<tr>
				<th scope="row">ID</th>
				<td><input name="userId" style="width: 200px;height: 50px;" type="text" placeholder="id를 입력하세요" /></td>
			</tr>
			<tr>
				<th scope="row">PASSWORD</th>
				<td><input name="userPw" style="width: 200px;height: 50px;" type="password" placeholder="비밀번호를 입력하세요" /></td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td><input name="userName" style="width: 200px;height: 50px;" type="text" placeholder="이름을 입력하세요" /></td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td><input name="userEmail" style="width: 200px;height: 50px;" type="email" placeholder="Email을 입력하세요" /></td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td><input name="userPhoneNum" style="width: 200px;height: 50px;" type="text" placeholder="*010-1234-1234 예시" /></td>
			</tr>
			
		</table>
		
		<br>
	</div>
	<div style="margin-top: 40px;">
		<button class="large color blue button" id="b_join" type="submit">회원가입</button>
		<button class="large color blue button" type="reset">초기화</button>
		<button class="large color blue button" id="b_main"> 메인으로 </button>
	</div>
	<!--//content -->
	</form>
</div>
<!--//container -->

<script>
	/* $('#b_join').on('click',function(){
		 $('#form_join')
		 	.attr('action','/join')
			.attr('method','POST')
			.submit();
	}) */
	$('#b_main').on('click',function(){
		 $('#form_join')
		 	.attr('action','${path.context}/main')
			.attr('method','GET')
			.submit();
	})
</script>