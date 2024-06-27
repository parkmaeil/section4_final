package com.example.repository;
// JDBC->MyBatis(MVC)->Spring+MyBatis->Spring Data JPA(Hibernate)
import com.example.entity.BookDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
// JDBC ->  1. 생산성이 떨어진다(시간이 많이 소요된다), 2. Java코드+SQL : 믹서구현(유지보수가 어렵다)->
//  MyBatis : SQL Mapping Framework for Java
public class BookDAO {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public Connection getConnect(){
        String driverClassName="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/books";
        String username="root";
        String password="12345";
        try{
            Class.forName(driverClassName);
            conn=DriverManager.getConnection(url, username, password);
        }catch(Exception e){
            e.printStackTrace();
        }
        return  conn;
    }
    public List<BookDTO> bookList(){
        List<BookDTO> list=new ArrayList<>();
        String SQL="select * from book order by title desc"; // Mapper XML file
        conn=getConnect(); // Connection 생성 -> 오버해드(시간이 걸린다 ,1초), 재활용(Connection POOL)
         try{
             ps=conn.prepareStatement(SQL);
             rs=ps.executeQuery();
             while (rs.next()){
                   Long num=rs.getLong("num");
                   String title=rs.getString("title");
                   int price=rs.getInt("price");
                  String author=rs.getString("author");
                   int page=rs.getInt("page");
                   // 묶고(DTO)->담고(List)
                   BookDTO dto=new BookDTO();
                   dto.setNum(num);
                   dto.setTitle(title);
                   dto.setPrice(price);
                   dto.setAuthor(author);
                   dto.setPage(page);
                   //dto.setNum(num);
                   list.add(dto);
             }
         }catch (Exception e){
             e.printStackTrace();
         } finally{
             try {
                 rs.close();
                 ps.close();
                 conn.close();  // 종류
             }catch(Exception e){
                 e.printStackTrace();
             }
         }
         return list;
    }
}
