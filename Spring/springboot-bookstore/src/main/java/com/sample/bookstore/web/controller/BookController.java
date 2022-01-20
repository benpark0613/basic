package com.sample.bookstore.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sample.bookstore.service.BookService;
import com.sample.bookstore.vo.Book;
import com.sample.bookstore.web.form.BookForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@CrossOrigin(origins = "http://localhost:8080")
@RestController
@RequestMapping("/api/book")
public class BookController {

	@Autowired
	private BookService bookService;
	
	@GetMapping
	public List<Book> books() {
		return bookService.getAllBooks();
	}
	
	@PostMapping
	public Book save(@RequestBody BookForm form) {
		log.info("폼 입력값:" + form);
		
		Book book = Book.builder()
				.title(form.getTitle())
				.author(form.getAuthor())
				.publisher(form.getPublisher())
				.pubDate(form.getPubDate())
				.discountPrice(form.getDiscountPrice())
				.stock(form.getStock())
				.build();
		
		Book savedBook = bookService.insertNewBook(book);
		
		return savedBook;
	}
}
