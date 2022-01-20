package com.sample.app;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.sample.service.BookService;
import com.sample.vo.Book;

public class BookListApp {

	public static void main(String[] args) {
		
		String resource = "D:\\Develop\\projects\\spring-workspace\\spring-mybatis\\src\\main\\webapp\\WEB-INF\\spring\\context-root.xml";
		
		ApplicationContext ctx = new FileSystemXmlApplicationContext(resource);
		
		BookService service = ctx.getBean(BookService.class);
		List<Book> books = service.getAllBookList();
		System.out.println(books);
	}
}
