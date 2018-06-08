<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
aa();
function aa (){

	$.ajax({
			url : 'http://localhost/board/listAjax.do',
			dataType : 'json',
			type : 'GET',
			success : function(data) {
				var listBoard = ""
				var list = data.list
				
				for (var i = 0; i < list.length; i++) {

					listBoard += 
					    "<table class='type03' style='border-top:none'><tr style='cursor: pointer;' class='viewnotice'  data-toggle='modal' data-target='.bd-example-modal-lg' data-aNo='"+list[i].aNo+"' data-title='"+list[i].aTitle+"'  data-content='"+list[i].aContent+"'  data-userId='"+list[i].aWriter+"'  data-rgsde='"+list[i].rgsde+"' ><td class='TableCenter' style='width:140px; height:30px; font-size:14px'>" 
				      + list[i].aNo + "</td><td class='TableLeft' style='width:*;' >"
				      + list[i].aTitle + "</td><td class='TableCenter' style='width:200px'>"
				      + list[i].aWriter + "</td><td class='TableCenter' style='width:200px;'>"
				      + list[i].rgsde 
				      + "</td></tr></table>"
				}
				$("#listBoard").html(listBoard);
			}
		});
	}

	$(document).ready(function() {
		$(".viewnotice").click(function() {
			
			var aNo = $(this).attr("data-aNo");
			var aTitle = $(this).attr("data-title");
			var aWriter = $(this).attr("data-userid");
			var aContent = $(this).attr("data-content");
			var rgsde = $(this).attr("data-rgsde");
			var viewpoint = $(this).attr("data-viewpoint");
			
			$(".aNo").text(aNo);
			$(".aTitle").text(aTitle);
			$(".aContent").text(aContent);
			$(".aWriter").text(aWriter);
			$(".rgsde").text(rgsde);

		});
		
		
		$("#register").on("click", function() {
			
			var obj = [];

			obj = {
				aTitle : $("#aTitle").val(),
				aWriter :$("#aWriter").val(),
				aContent : $("#aContent2").val()
			};

				$.ajax({
					url : 'http://localhost/board/register.do',
					type : 'POST',
					data: obj,
					success : function() {
					alert("글이 등록 되었습니다");
					aa();
					$("#aTitle").val("");
					$("#aWriter").val("");
					$("#aContent2").val("");
					
					}
				});
				
		});
	});
</script>
<!--container -->
<div id="container">
	<!--snb -->
	<div class="snb">서브메뉴 하나</div>
	<!--//snb -->
	<!--content -->
	<div id="content">

	<table class="type03">
	    <caption>
	    * AJAX게시판
	    </caption>
	    <colgroup>
	    <col width='140px'>
	    <col width='/'>
	    <col width='200px'>
	    <col width='200px'>
	    </colgroup>
	    <tr class='TableCenter'>
	      <th class='TableCenter'>번호</th>
	      <th class='TableCenter'>제목</th>
	      <th class='TableCenter'>작성자</th>
	      <th class='TableCenter'>작성일</th>
	    </tr>
    </table>
     
<div id="listBoard">
    
    </div>
			<br> 
				<a href="" style="float: right"  data-toggle='modal' data-target='.bd-example-modal-lg2'> 
					<button class="large color blue button" type="submit" >등록하기</button>
				</a> 
			<br>
			<br>
			<br>
</div>
	<!--//content -->
</div>
<!--//container -->
<!-- Modal -->

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="padding: 20px">
				<table class="type03">
					<caption>* AJAX게시판 뷰페이지</caption>
					<colgroup>
						<col width='140px'>
						<col width='/'>
					</colgroup>
					<tr>
						<th class='TableCenter'>번호</th>
						<td class="bno TableLeft"></td>
					</tr>
					<tr>
						<th class='TableCenter'>제목</th>
						<td class='title TableLeft'></td>
					</tr>
					<tr>
						<th class='TableCenter'>작성자</th>
						<td class='userid TableLeft'></td>
					</tr>
					<tr>
						<th class='TableCenter'>작성일</th>
						<td class='rgsde TableLeft'></td>
					</tr>
					<tr>
						<th class='TableCenter'>내용</th>
						<td class='content TableLeft'></td>
					</tr>
				</table>
				
				
			</div>
  </div>
</div>

<div class="modal fade bd-example-modal-lg2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="padding: 20px">
				<table class="type03">
					<caption>* AJAX게시판 뷰페이지</caption>
					<colgroup>
						<col width='140px'>
						<col width='/'>
					</colgroup>
					<tr>
						<th class='TableLeft'>제목</th>
						<td class='TableLeft' ><input name="title" style="width: 600px; height: 38px;" id="title"></td>
					</tr>
					<tr>
						<th class='TableLeft'>내용</th>
						<td class=' TableLeft'><textarea rows="10" cols="50" name="content"	style="width: 100%;" id="content2"> </textarea></td>
					</tr>
				</table>
				
				<div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="register" data-dismiss="modal">글등록</button>
      </div>
      
      
				
			</div>
  </div>
</div>