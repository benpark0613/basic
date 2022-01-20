package com.sample.bookstore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.bookstore.mapper.BookMapper;
import com.sample.bookstore.vo.Book;

@Service
public class BookService {

   @Autowired
   private BookMapper bookMapper;
   
   public Book insertNewBook(Book book) {
      bookMapper.insertBook(book);
      return bookMapper.getBookByNo(book.getNo());
   }
   
   public Book updateBook(Book book) {
      Book savedBook = bookMapper.getBookByNo(book.getNo());
      savedBook.setPrice(book.getPrice());
      savedBook.setDiscountPrice(book.getDiscountPrice());
      savedBook.setStock(savedBook.getStock() + book.getStock());
      bookMapper.updateBook(book);
      
      return savedBook;
   }
   
   public Book deleteBook(int no) {
      Book savedBook = bookMapper.getBookByNo(no);
      bookMapper.deleteBook(no);
      return savedBook;
   }
   
   public Book getBookDetail(int no) {
      return bookMapper.getBookByNo(no);
   }
   
   public List<Book> getAllBooks() {
      return bookMapper.getAllBooks();
   }
   
   
   
}