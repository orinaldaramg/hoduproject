<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

  <head>

    <style>
   
      textarea {
        width: 100%;
        height: 100px;
      } 
      .area select {
   		width: 100%;
   	    height: 55px;
   	  }
   	  .find-btn{
		text-align: center;
	   }
    </style>
    
   </head>
   
   <body>
    <%@ include file ="pheader.jsp" %>

      <div id="fh5co-contact" data-section="reservation">
         <div class="container">
            <div class="row text-center fh5co-heading row-padded" >
            
               <div class="col-md-8 col-md-offset-2">
                  <h2 class="heading to-animate"  style="font-family: 'Pretendard-Regular';">객실 등록</h2>
               </div>
            </div>
          

          <form id="roomInfo" method="post" action="${path }/roomInfo.do?partnerId=${partnerId }">
                <div class="container" style="text-align:center;padding-left: 4px">
                
                <div class="col-md-6 col-md-offset-3">
                  <h3 style="font-family: 'Pretendard-Regular';">Hodu Pension Room Register form</h3>
                 
                  <div class="form-group">
                     <label for="roomName" class="sr-only">pensionName</label>
                     <input id="roomName" name="roomName" class="form-control" placeholder="객실명" type="text">
                  </div>
                 
                  <div class="form-group">
                     <label for="peopleNum" class="sr-only">peopleNumber</label>
                     <input id="peopleNum" name="peopleNum" class="form-control" placeholder="객실 가격" type="number">
                  </div>
                             
                  <div class="form-group">
                     <label for="dogNum" class="sr-only">dogNumber</label>
                     <input id="dogNum" name="dogNum" class="form-control" placeholder="수용 가능한 반려견 수" type="number">
                  </div>
                   
                 <div class="form-group">
               <p style="text-align : left; margin-bottom: 0px">수용 가능한 반려견 사이즈</p>
               </div>
               <div class="form-control" style="margin-bottom: 15px">
               		
               		<p style="font-size: 16px"> 
		                <input type='checkbox' name='check' value='소형견' /> 소형견 (10Kg 미만)&nbsp;&nbsp;&nbsp;
		                <input type='checkbox' name='check' value='중형견' /> 중형견 (10kg~25Kg 미만)&nbsp;&nbsp;&nbsp;
		                <input type='checkbox' name='check' value='대형견' /> 대형견 (25Kg 이상)
		            </p>
		        
                </div>
                   
                   <div class="form-group ">
                     <label for="peopleNum" class="sr-only">peopleNumber</label>
                     <input id="peopleNum" name="peopleNum" class="form-control" placeholder="수용 가능한 인원 수" type="number">
                  </div>
                  
                 <div class="message">
                     <textarea class="message_area form-control" rows="8" cols="50" placeholder="객실 세부사항을 입력해주세요"></textarea>
                </div>
                  
            </div>
         </div>
         </form>
         <p style="margin-bottom: 14px"></p>
         <div class="col-md-6 col-md-offset-3">
	         <div class="form-group ">  
	         <form id="roomImg" method="post" enctype="multipart/form-data" action="${path }/roomImg.do?partnerId=${partnerId }">
				 <p style="text-align: left; margin-bottom: 10px"> 객실 사진 업로드</p>
			     <p style="width: 102%">
			     <input type="file" name="multiFile" multiple class="form-control"></p>
	             
	             <div class="find-btn" >
	             <input id="nextButton" class="btn btn-primary" onclick="next();" value="다음" type="button" style="font-family: 'Pretendard-Regular';"/>
	             <input class="btn btn-primary" value="제출" onclick="" type="button" style="font-family: 'Pretendard-Regular';"/>
			 </div>
			 </form> 
			 </div> 
		 </div>
      </div>
   
  
<%@ include file = "../footer.jsp" %>

</div>
	<script>
	// 1) 폼 두개 아이디로 제출 제출 후 다시 이 페이지 뜨게
	
		function next() {
		document.getElementById('roomImg').submit();
		document.getElementById('roomInfo').submit();

	}
		
	
	
	// 2) 폼 두개 아이디로 제출 제출 후 빠져나가게
	
	
	
	
	</script>
   </body>
</html>