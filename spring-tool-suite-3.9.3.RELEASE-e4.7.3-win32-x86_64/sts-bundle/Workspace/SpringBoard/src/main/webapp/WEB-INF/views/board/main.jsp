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
<!-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">GOGO</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="a_structure" href="#">HISTORY</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">자유게시판</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
      <li><a href="#">Page 3</a></li>
        <li><a  href="#">회원가입</a></li> 
        <li><a data-toggle="modal" data-target="#myModal" href="#">로그인</a></li>
        <li><a href="#">로그아웃</a></li>        
    </ul>
  </div>
</nav> -->
<!--content 시작  -->
<div class="jumbotron text-center">
  <h1>게 시 판</h1>
  <p>게시판 관련 기능을 체험해보세요.</p> 
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <!-- <h3>목록보기</h3> -->
     	<form id="form_boardList" name="form_boardList">
			<button id="board_jsp_list" type="submit" style="background:gray; color:white; width:120px; height:70px; font-size:30px;">목록</button>
		</form>
	 
    </div>
    <div class="col-sm-4">
      <!-- <h3>글쓰기</h3> -->
          <form id="form_boardWrite" name="form_boardWrite">
			<button id="board_jsp_write" type="submit" style="background:gray; color:white; width:120px; height:70px; font-size:30px;">글쓰기</button>
		</form>

    </div>
    <div class="col-sm-4">
      <h3>Column 3</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>
  </div>
  
  
</div>
<!--footer  -->
<!-- <div style="background:black; margin-top: 100px;" class="jumbotron text-center">
	<h1 style="color:white;">MAC SHOP OPEN</h1>
	<form id="form_home" name="form_home">
	<button id="home_jsp_search" type="submit" style="background:black; color:white; width:100px; height:70px; font-size:30px;">click</button>
	</form>
</div> -->
</body>
<script>
	$('#board_jsp_list').on('click',function(){
		 $('#form_boardList')
		 	.attr('action','${path.context}/board/list')
			.attr('method','GET')
			.submit();
	})
	$('#board_jsp_write').on('click',function(){
		 $('#form_boardWrite')
		 	.attr('action','${path.context}/board/register')
			.attr('method','GET')
			.submit();
	})
	

</script>
</html>
