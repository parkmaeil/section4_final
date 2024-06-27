package com.example.controller;

import com.example.entity.ReviewDTO;
import com.example.repository.BookDAOMyBatis;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addReview")
public class ReviewAddController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // form,  json
        String cpath=req.getContextPath();
        req.setCharacterEncoding("utf-8");
        int book_num=Integer.parseInt(req.getParameter("bookNum"));
        String review=req.getParameter("review");
        int rating=Integer.parseInt(req.getParameter("rating"));
        // 파라메터 수집(DTO)
        ReviewDTO reviewDTO=new ReviewDTO();
        reviewDTO.setBook_num(book_num);
        reviewDTO.setContent(review);
        reviewDTO.setRating(rating);

        BookDAOMyBatis dao=new BookDAOMyBatis();
        int cnt=dao.reviewAdd(reviewDTO);
        if(cnt>0){
            resp.sendRedirect(cpath+"/view?num="+book_num);
        }else{
            System.out.println("등록실패");
        }
    }
}
