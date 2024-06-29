package com.example.controller;

import com.example.entity.ReviewDTO;
import com.example.repository.BookDAOMyBatis;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reviewRemove")
public class ReviewRemoveController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           int review_id=Integer.parseInt(req.getParameter("review_id"));
           int num=Integer.parseInt(req.getParameter("num"));
           String cpath=req.getContextPath();
        /*   ReviewDTO dto=new ReviewDTO() ;
           dto.setReview_id(review_id);
           dto.setBook_num(num);*/
        BookDAOMyBatis dao=new BookDAOMyBatis();
        int cnt=dao.reviewRemove(review_id);
        if(cnt>0){
            resp.sendRedirect(cpath+"/view?num="+num);
        }else{
            System.out.println("삭제실패");
        }
    }
}
