<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
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
  <script>
     function goDel(num){
         location.href="${cpath}/delete?num="+num; //   /MF01/delete?num=1
     }
     function goRegister(){
        location.href="${cpath}/registerGet";
     }
  </script>
</head>
<body>

    <div class="container mt-3">
      <h2>Web MVC Framework Advanced</h2>
      <div class="card">
        <div class="card-header">Book List
              <!-- 정렬 드롭다운 메뉴 추가 -->
                                <div class="dropdown float-right">
                                    <button class="btn btn-secondary dropdown-toggle btn-sm" type="button" id="sortMenuButton"
                                                                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        정렬
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="sortMenuButton">
                                        <a class="dropdown-item" href="?sort=num">번호</a>
                                        <a class="dropdown-item" href="?sort=title">제목</a>
                                        <a class="dropdown-item" href="?sort=price">가격</a>
                                        <a class="dropdown-item" href="?sort=author">저자</a>
                                        <a class="dropdown-item" href="?sort=page">페이지수</a>
                                    </div>
                                </div>
        </div>
        <div class="card-body">
          <table class="table table-bordered table-hover">
              <thead>
                  <tr>
                     <th>번호</th>
                     <th>제목</th>
                     <th>가격</th>
                     <th>저자</th>
                     <th>페이지수</th>
                     <th>삭제</th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach var="book" items="${list}">
                                  <tr>
                                       <td>${book.num}</td>
                                       <td><a href="${cpath}/view?num=${book.num}">${book.title}</a><span class="badge badge-info"> review:${book.cnt}</span></td>
                                       <td>${book.price}</td>
                                       <td>${book.author}</td>
                                       <td>${book.page}</td>
                                       <td><button class="btn btn-sm btn-warning" onclick="goDel(${book.num})">삭제</button></td>
                                    </tr>
              </c:forEach>
              </tbody>
          </table>
           <!-- 검색 폼을 중앙에 배치 -->
                    <div class="d-flex justify-content-center">
                          <form class="form-inline" action="${cpath}/slist" method="post">
                              <input class="form-control mr-sm-2" type="search" placeholder="제목 또는 저자 검색" aria-label="Search" name="keyword">
                              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
                          </form>
                      </div>
          <button class="btn btn-sm btn-primary"  onclick="goRegister()">등록하기</button>
        </div>
        <div class="card-footer">인프런_마프 1탄_박매일</div>
      </div>
    </div>

</body>
</html>