<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>User Qna Content</title>
</head>



<body style="font-family: 'Pretendard-Regular';">

<%@ include file="header.jsp" %>
   <div id="fh5co-menus" data-section="menu">
      <div class="container">
			<div class="row text-center fh5co-heading row-padded">
				<div class="col-md-8 col-md-offset-2">
					<h2 class="heading to-animate"
						style="font-family: 'Pretendard-Regular';">QnA List</h2>
					<p class="sub-heading to-animate"></p>
					<p style="margin-bottom: 80px"></p>
				</div>
			</div>
			<p style="margin-bottom: -30px"></p>
			<div class="container" style="width: 70%;">
				<form action="QView.do" method="post">
				<table class="table table-bordered">
				
				   <tr>
				      <th style="width: 200px; text-align: center;">아이디</th>
				      <td>${QView.userId }</td>
				   </tr>
				 
				   <tr>
					  <th style="text-align: center;">펜션 이름</th>
				   	  <td>${QView.pensionName }</td>	
				   </tr>   
				   
				   <tr>
					    <th style="text-align: center;">제목</th>
					   <td>${QView.q_title }</td>
				   </tr>   
				   
				   <tr>
					   <th style="height:200px; text-align: center;">내용</th>
					   <td>${QView.q_content }</td>
				   </tr>		   

				   <tr>
					   <th style="height:200px; text-align: center;">답변</th>
				   </tr>	
				 
				</table>
				</form>
				
				<div class="col-sm-3" style="left:340px;">
				<button class="btn btn-primary btn-block" type="button" onclick="location.href='../../QList.do?pageNum=1&amount=10'" style="width: 70px; font-family: 'Pretendard-Regular';">목록</button>
				</div>
				<br></br>
				
			</div>
		</div>
</div>
<%@ include file="footer.jsp" %>


</body>

</html>