package com.example.entity;

import lombok.Data;

import java.util.Date;

@Data
public class ReviewDTO {  //  review table
    private int review_id;
    private int book_num;
    private double rating;
    private String content;
    private Date created_at;
// Constructors, getters, and setters...
}

