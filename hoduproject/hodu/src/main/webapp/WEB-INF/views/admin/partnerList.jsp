<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Community Page</title>
</head>
<%@ include file="aheader.jsp" %>

<body style="font-family: 'Pretendard-Regular';">

   <div id="fh5co-menus" data-section="menu">
      <div class="container">
			<div class="row text-center fh5co-heading row-padded">
				<div class="col-md-8 col-md-offset-2">
					<h2 class="heading to-animate"
						style="font-family: 'Pretendard-Regular';">HODU Community</h2>
					<p class="sub-heading to-animate"></p>
					<p style="margin-bottom: 80px"></p>
					
					<div class="search_wrap">
				        <div class="search_area">
				        	<select name="type" style="width: 165px; height: 41px;">
				                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
				                <option value="I" <c:out value="${pageMaker.cri.type eq 'I'?'selected':'' }"/>>아이디</option>
				                <option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>이름</option>
				                <option value="B" <c:out value="${pageMaker.cri.type eq 'b'?'selected':'' }"/>>사업자등록번호</option>
				            </select>    
				            <input type="text" name="keyword" style="width: 440px; height: 41px;">
				            <button>Search</button>
				            
				        </div>
				    </div>    
					<!-- //검색 폼 영역 -->
				</div>
			</div>
			<p style="margin-bottom: 0px"></p>
			<div class="container" style="width: 80%;">
				<table class="table table-hover" id="modalTable" style="text-align: center">
					<tbody style="font-family: 'Pretendard-Regular';">
						<tr>
							<th style="text-align: center">파트너 아이디</th>
							<th style="text-align: center">파트너 이름</th>
							<th style="text-align: center">사업자 등록번호</th>
							<th style="text-align: center">전화번호</th>
							<th style="text-align: center">이메일</th>
							<th style="text-align: center;">파트너 탈퇴</th>
						</tr>
						 <c:forEach var="list" items="${partnerList }" varStatus="status" >
							<tr >
								<td data-th="Supplier Code" width="15%">${list.partnerId }</td>
								<td data-th="Supplier Name" width="15%">${list.partnerName }</td>
								<td data-th="Supplier Name">${list.businessNum }</td>
								<td data-th="Supplier Name">${list.partnerMobile }</td>
								<td data-th="Supplier Name" width="30%">${list.partnerEmail }</td>
								<td id="userDelete">
									<button class="btn btn-primary btn-block" value="${list.partnerId }"
									type="button" style="width: 70px; font-family: 'Pretendard-Regular'; display: inline-block; 
									margin-top: 0px; margin-bottom: 0px" onclick="call_confirm(${list.partnerId });">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				

				<br></br>
				<form id="moveForm" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	        		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">   
	        		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	        		<input type="hidden" name="type" value="${pageMaker.cri.type }">
				</form>
				
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
						<li><a href="${path }/partnerList.do?pageNum=${pageMaker.startPage-1 }&amount=10" style="color:#5e493a">이전</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li><a href="${path }/partnerList.do?pageNum=${num}&amount=10" style="color:#5e493a">${num }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
						<li><a href="${path }/partnerList.do?pageNum=${pageMaker.endPage+1 }&amount=10" style="color:#5e493a">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
</div>



<script type="text/javascript">

	 

	 
	    let moveForm = $("#moveForm");
	 //버튼 클릭
		$(".search_area button").on("click", function(e){
        e.preventDefault();
       
       let type = $(".search_area select").val();
       let keyword = $(".search_area input[name='keyword']").val();
       
       if(!type){
           alert("검색 종류를 선택하세요.");
           return false;
       }
       
       if(!keyword){
           alert("키워드를 입력하세요.");
           return false;
       }        
   
       moveForm.find("input[name='type']").val(type);
       moveForm.find("input[name='keyword']").val(keyword);
       moveForm.find("input[name='pageNum']").val(1);
       
       document.getElementById('moveForm').submit();
       
    });
	 

	function call_confirm(partnerID){
		   if(confirm("삭제하시겠습니까?")){
			location.href = "${path}/partnerDelete.do?partnerId="+partnerID;
			alert("삭제 되었습니다.");
		} else{
			alert("취소 되었습니다.");
		}
		
	}
</script>


</body>

</html>