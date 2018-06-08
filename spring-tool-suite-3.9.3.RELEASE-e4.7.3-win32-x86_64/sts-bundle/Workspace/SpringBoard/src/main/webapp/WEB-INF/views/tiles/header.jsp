<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="/resources/css/etc.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.center{
text-align: center;
}
</style>
</head>
<form id="form_nav" name="form_nav">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">GOGO</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="a_structure" href="#">A N T</a></li>
      <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${path.context}/board/main">자유게시판</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul> --%>
      </li>
	      <!-- <li><a href="#">Page 2</a></li>
	      <li><a href="#">Page 3</a></li> -->
	      <li><a id="a_board"  href="#">게시판</a></li> 
	      <li><a id="a_join"  href="#">회원가입</a></li> 
	      <li><a id="a_login"  href="#">로그인</a></li> 
        <!-- <li><a data-toggle="modal" data-target="#myModal" href="#">로그인</a></li> -->
        <!-- <li><a id="a_logout" href="#">로그아웃</a></li>   -->      
    </ul>
  </div>
</nav>
</form>

</body>
<script>
	$('#a_join').on('click',function(){
		 $('#form_nav')
		 	.attr('action','${path.context}/join')
			.attr('method','GET')
			.submit();
	})
	$('#a_login').on('click',function(){
		 $('#form_nav')
		 	.attr('action','${path.context}/login')
			.attr('method','GET')
			.submit();
	})
	$('#a_board').on('click',function(){
		 $('#form_nav')
		 	.attr('action','${path.context}/board/main')
			.attr('method','GET')
			.submit();
	})
</script>
</html>
