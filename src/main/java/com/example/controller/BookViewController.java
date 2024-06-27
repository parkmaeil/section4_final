package com.example.controller;

import com.example.entity.BookDTO;
import com.example.entity.ReviewDTO;
import com.example.repository.BookDAOMyBatis;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/view")
public class BookViewController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
                                                                                                throws ServletException, IOException {

        int num=Integer.parseInt(req.getParameter("num"));

        BookDAOMyBatis dao = new BookDAOMyBatis();
        BookDTO book = dao.bookView(num);
        req.setAttribute("book", book);
        // 리뷰정보가져오기
        List<ReviewDTO> reviews=dao.getByNumReviews(num);
        req.setAttribute("reviews", reviews);
        // 평균평점
        Double ratingAvg=dao.getAvgRating(num);
        if(ratingAvg!=null){
           req.setAttribute("ratingAvg", ratingAvg);
        }else{
            req.setAttribute("ratingAvg", 0.0);
        }

        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/view.jsp");
        rd.forward(req, resp);

    }
}
