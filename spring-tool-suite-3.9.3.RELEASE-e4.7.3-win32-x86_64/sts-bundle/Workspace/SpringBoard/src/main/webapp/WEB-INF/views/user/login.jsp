<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>로그인 </title>
</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.userLoginInfo}">
        <h2>로그인 성공 </h2>
        이름 : ${sessionScope.userLoginInfo.userName}
 
        이메일 : <c:out value="${sessionScope.userLoginInfo.email}"/> 
        <a href="logout">로그아웃</a>
        <a href="page1">페이지1</a>  <a href="page2">페이지2</a>
    </c:when>
    <c:otherwise>
        <h2>로그인 </h2>
        <form name="form1" method="post" action="loginProcess">
        <table>
            <tr height="40px">
                <td>유저ID</td>
                <td><input type="text" name="userId"></td>
            </tr>
            <tr height="40px">
                <td>패스워드</td>
                <td><input type="password" name="password"></td>
            </tr>
        </table>
        <table>
            <tr>
                <td align="center"><input type="submit" value="로그인"></td>
                <td align="center"><input type="reset" value="리셋"></td>
            </tr>
        </table>
        </form>
    </c:otherwise>
</c:choose>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <c:set var="context" value="<%=request.getContextPath()%>"></c:set>
<form id="form-login" action="/loginProcess" method="post">
	<div style="height: 100px;">
		<div>
		</div>
	</div>
	<div>
		<div>
			<div style="width: 280px;height: 100px;margin: 0 auto;font-size: 40px;font-weight: bold;">로그인</div>
		</div>
	</div><br /><br />
    
	<div style=" width: 500px;height: 135px;margin: 0 auto;	display: grid;grid-gap: 5px;background-color: #7b7b82;padding: 5px;">
		<div style="grid-column: 1 / span 2;grid-row: 1;" >
			<input style="width:100%; height:48%;" id="userId" name="userId" class="int-login" type="text" placeholder="아이디" />				
		</div>
 		<div style="grid-column: 3;grid-row: 1 / span 2;">
 			<button id="btn-login" style="width:  100%;height: 100%;margin: 0 auto;text-align: center;" type="submit">로그인</button>
 		</div>
 		<div style="grid-column: 1 / span 2;grid-row: 2;">
 			<input style="width:100%; height:48%;" id="userPw" name="userPw" class="int-login" type="text" placeholder="비밀번호" />			
 		</div>  	
	</div>
	<div style="height: 100px;">	
	</div>
	
	
</form>	
	<script>
	/* $('#btn-login').on('click',function(){
		 $('#form_login')
		 	.attr('action','/loginProcess')
			.attr('method','POST')
			.submit();
	}) */
		
	</script>		

