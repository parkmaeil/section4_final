package com.example.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//Lombok API
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookDTO {
    private Long num;
    private String title;
    private int price;
    private String author;
    private int page;
    private int cnt;
}
