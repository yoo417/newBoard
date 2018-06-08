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

<!--content 시작  -->
<div class="jumbotron text-center">
  <h1>에이앤티(ANT) 타일즈 게시판</h1>
  <p>tiles 를 사용하여 게시판 만들기</p> 
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>공지사항1</h3>
      <p>게시판 예제를 만들어봅시다.</p>
      <p>list / write / view 단 </p>
    </div>
    <div class="col-sm-4">
      <h3>공지사항2</h3>
      <p>회원가입도 만듭시다.</p>
      <p>로그인단을 살펴봅시다.</p>
    </div>
    <div class="col-sm-4">
      <h3>공지사항3</h3>        
      <p>다 만들었으면 꾸며봅시다. </p>
      <p>버튼도 꾸미고 예쁘게 만듭시다.</p>
    </div>
  </div>
</div>
<div style="background:white; margin-top: 0px;" class="jumbotron text-center">
		<form id="form_board" name="form_board">
			<button id="board_jsp_move" type="submit" style="background:gray; color:white; width:120px; height:70px; font-size:30px;">글쓰기</button>
		</form>
</div>

</body>
<script>
	$('#board_jsp_move').on('click',function(){
		 $('#form_board')
		 	.attr('action','/board/main')
			.attr('method','GET')
			.submit();
	})

</script>
</html>
