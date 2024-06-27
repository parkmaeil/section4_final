<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
      .review-toggle {
        cursor: pointer;
        color: #17a2b8; /* Or any other color that suits your design */
        font-weight: bold;
        text-decoration: underline;
      }

      .review-toggle:hover {
        color: #1391a0; /* Slightly darker for hover effect */
      }
    </style>
   </head>
<body>

<div class="container mt-3">
      <h2>Web MVC Framework Basic</h2>
      <div class="card">
        <div class="card-header">Book View</div>
        <div class="card-body">
            <table class="table table-bordered">
               <tr>
                  <td>번호</td>
                  <td>${book.num}</td>
               </tr>
             <tr>
                  <td>제목</td>
                  <td>${book.title}</td>
               </tr>
             <tr>
                  <td>가격</td>
                  <td>${book.price}</td>
               </tr>
             <tr>
                  <td>저자</td>
                  <td>${book.author}</td>
               </tr>
             <tr>
                  <td>페이지수</td>
                  <td>${book.page}</td>
               </tr>
            </table>
            <button class="btn btn-sm btn-primary action">목록</button>
            <button class="btn btn-sm btn-success action">수정</button>
            <button class="btn btn-sm btn-warning action">삭제</button>
        </div>
  <!-- Section for existing reviews -->
     <div id="reviews-list" class="mt-4">
         <h5>리뷰리스트(<span class="badge badge-warning">평균평점 : ${ratingAvg}</span>)</h5>
         <!-- 리뷰 리스트가 비어있지 않은 경우 출력 -->
         <c:if test="${not empty reviews}">
             <div class="list-group">
                 <c:forEach var="review" items="${reviews}">
                     <div class="list-group-item list-group-item-action flex-column align-items-start">
                         <div class="d-flex w-100 justify-content-between">
                             <small class="text-muted">작성일: <fmt:formatDate value="${review.created_at}" pattern="yyyy-MM-dd" /></small>
                             <hr/>
                         </div>
                         <p class="mb-1">${fn:replace(review.content,replaceChar,"<br/>")}</p>
                         <small class="text-muted">평점: ${review.rating}</small>
                     </div>
                 </c:forEach>
             </div>
         </c:if>
         <!-- 리뷰 리스트가 비어있는 경우 메시지 출력 -->
         <c:if test="${empty reviews}">
             <p>등록된 리뷰가 없습니다.</p>
         </c:if>
     </div>
         <!-- 리뷰 및 평점 섹션 -->
         <!-- Button to toggle the review form -->
         <div class="text-center mt-4">
                  <span class="review-toggle" onclick="$('#review-form').toggle();">리뷰 및 평점 쓰기</span>
         </div>
                  <!-- Hidden review and rating submission section -->
                  <div id="review-form" class="mt-4 mb-3" style="display: none;">
                    <h3>리뷰 및 평점</h3>
                    <form action="${cpath}/addReview" method="post">
                      <input type="hidden" name="bookNum" value="${book.num}">
                      <div class="form-group">
                        <label for="review">리뷰 작성:</label>
                        <textarea class="form-control" id="review" name="review" rows="5" placeholder="책에 대한 리뷰를 남겨주세요"></textarea>
                      </div>
                       <div class="form-group">
                                     <label for="rating">평점:</label>
                                     <select class="form-control" id="rating" name="rating">
                                                     <option value="1">1점 - 매우 나쁨</option>
                                                     <option value="2">2점 - 나쁨</option>
                                                     <option value="3">3점 - 보통</option>
                                                     <option value="4">4점 - 좋음</option>
                                                     <option value="5" selected>5점 - 매우 좋음</option>
                                     </select>
                                   </div>
                                   <button type="submit" class="btn btn-primary">리뷰등록</button>
                                 </form>
                  </div>
       <div class="card-footer">인프런_마프 1탄_박매일</div>
   </div>
   </div>
    <form id="myForm" method="post" action="">
         <input type="hidden" name="num" id="num" value="${book.num}"/>
    </form>
 <script>
       document.querySelector(".card-body").addEventListener("click", function(e){
         if(e.target.classList.contains("action")){
              let form=document.getElementById("myForm");
              let inputNum=document.getElementById("num");
              switch(e.target.classList[2]){
                  case "btn-primary" :
                       console.log("목록버튼클릭");
                       form.action="${cpath}/list"
                       if(inputNum){
                           inputNum.remove();
                       }
                       form.method="GET";
                       break;
                  case "btn-success" :
                      console.log("수정버튼클릭");
                      form.action="${cpath}/updateGet"
                      form.method="POST";
                      break;
                  case "btn-warning" :
                       console.log("삭제버튼클릭");
                       form.action="${cpath}/delete"
                       form.method="POST";
                       break;
              }
              form.submit();
         }
       });
   </script>
</body>
</html>