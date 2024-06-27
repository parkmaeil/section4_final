package com.example.controller;

import com.example.entity.BookDTO;
import com.example.repository.BookDAOMyBatis;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//http://localhost:8081/MF01/delete?num=3
@WebServlet("/delete")
public class BookDeleteController extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
                                                           throws ServletException, IOException {
         // Server Context Path 얻기
          String cpath=req.getContextPath();
          int num=Integer.parseInt(req.getParameter("num")); // "3"->3
          BookDAOMyBatis dao=new BookDAOMyBatis();
          int cnt=dao.bookDelete(num);
          if(cnt>0){
               // 다시 리스트페이지로 이동(redirect)
              resp.sendRedirect(cpath+"/list"); // /s4_final/list
          }else{
              System.out.println("삭제실패");
          }
    }
}