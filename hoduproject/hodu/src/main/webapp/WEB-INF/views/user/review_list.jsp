<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Pension List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body style="font-family: 'Pretendard-Regular';">
   <%@ include file="header.jsp"%>
   <div id="fh5co-menus" data-section="menu">
      <div class="container">
         <div class="row text-center fh5co-heading row-padded">
            <div class="col-md-8 col-md-offset-2">
               <h2 class="heading to-animate" style="font-family: 'Pretendard-Regular';">Pension List</h2>
               <p class="sub-heading to-animate"></p>
               </div>
               </div>

         <!-- 드롭다운 추가 -->
         <div class="container" style="margin-bottom: 50px">
            <div class="dropdown" style="float: right;">
               <button class="btn btn-default dropdown-toggle" type="button"
                  data-toggle="dropdown">
                  HODU LIST <span class="caret"></span>
               </button>
               <ul class="dropdown-menu">
                  <li><a href="${path }/likeList.do?region=${param.region}" onclick="like();">추천순</a></li>
                  <li><a href="${path }/moneyList.do?region=${param.region}" onclick="money();">가격순</a></li>
               </ul>
            </div>
         </div>

         <!-- 드롭다운 끝 -->

	<a  href="${path }/user/review"class="btn btn-default pull-right" style="font-family: 'Pretendard-Regular'; font-size: 15px;">후기작성</a>

         <div class="row row-padded">
         
            <div class="col-md" id="like">
               <div class="fh5co-food-menu to-animate-2">
                  <h2 class="fh5co-drinks" style="font-family: 'Pretendard-Regular';">추천순</h2>
                  <ul>
                  <c:forEach var="pension_like" items="${likeList }" >
                     <li>
                        <div class="fh5co-food-desc">
                           <figure>
                              <img src="/resources/list_images/${pension_like.img_pension }" class="img-responsive"
                                 alt="Free HTML5 Templates by FREEHTML5.co">
                           </figure>
                           <div>
                              <h3 style="font-family: 'Pretendard-Regular';"><a href="user/list_pension">${pension_like.pensionName }</a></h3>
                              <p>${pension_like.like_mean } 좋아요</p>
                              <p>${pension_like.address }</p>
                           </div>
                        </div>
                        <div class="fh5co-food-pricing"><fmt:formatNumber value="${pension_like.price_mean}" pattern="###,###"/> 원</div>
                     </li>
                  </c:forEach>
                  </ul>
               </div>
            </div>
       
            
            
            
            <div class="col-md" id="money">
               <div class="fh5co-food-menu to-animate-2">
                  <h2 class="fh5co-dishes" style="font-family: 'Pretendard-Regular';">가격순</h2>
                  <ul>
                    <c:forEach var="pension_money" items="${moneyList }" >
                     <li>
                        <div class="fh5co-food-desc">
                           <figure>
                              <img src="/resources/list_images/${pension_money.img_pension }" class="img-responsive"
                                 alt="Free HTML5 Templates by FREEHTML5.co">
                           </figure>
                           <div>
                              <h3 style="font-family: 'Pretendard-Regular';"><a href="user/list_pension">${pension_money.pensionName }</a></h3>
                              <p>${pension_money.like_mean } 좋아요</p>
                              <p>${pension_money.address }</p>
                           </div>
                        </div>
                        <div class="fh5co-food-pricing"><fmt:formatNumber value="${pension_money.price_mean}" pattern="###,###"/> 원</div>
                     </li>
                  </c:forEach>
                  </ul>
               </div>
            </div>
            
            
         </div>
        

      </div>
   </div>
   <%@ include file="footer.jsp"%>
   <script>
   $(function () {
      const str = $(location).attr('href');     
      if(str.includes('likeList')){
        like();
      } else {
         money();
      }
      
    });
   
    function like(){
       $("#money").hide();
       $("#like").show();
 
    }
    function money(){
       $("#like").hide();
       $("#money").show();
    }
   </script>

</body>
</html>