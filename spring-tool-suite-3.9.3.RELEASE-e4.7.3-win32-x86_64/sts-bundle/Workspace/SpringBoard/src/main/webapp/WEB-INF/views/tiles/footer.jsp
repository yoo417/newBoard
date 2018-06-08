<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.center{
text-align: center;
}
</style>
</head>

<div style="background:black; margin-top: 20px;" class="jumbotron text-center">
	<h1 style="color:white;">ANT BOARD OPEN</h1>
	<!-- <form id="form_home" name="form_home">
	<button id="home_jsp_search" type="submit" style="background:black; color:white; width:120px; height:70px; font-size:30px;">로그인</button>
	</form> -->
</div>
</body>
<script>
	$('#home_jsp_search').on('click',function(){
		 $('#form_home')
		 	.attr('action','${path.context}/main/login.tiles')
			.attr('method','GET')
			.submit();
	})
	

</script>
</html>
