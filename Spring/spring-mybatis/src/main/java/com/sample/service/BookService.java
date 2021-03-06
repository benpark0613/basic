package com.sample.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.dao.BookDao;
import com.sample.dto.BookDetailDto;
import com.sample.form.Criteria;
import com.sample.vo.Book;
import com.sample.vo.BookPicture;

@Service
@Transactional
public class BookService {
	
	static final Logger logger = LogManager.getLogger(BookService.class);
	
	@Autowired
	private BookDao bookDao;
	
	public List<Book> getAllBookList() {
		return bookDao.getAllBooks();
	}
	
	public int getTotalRows(Criteria criteria) {
		logger.info("검색조건: " + criteria);
		return bookDao.getBooksTotalRows(criteria);
	}
	
	public List<Book> searchBooks(Criteria criteria) {
		logger.info("검색조건: " + criteria);
		return bookDao.searchBooks(criteria);
	}
	
	public void addNewBook(Book book, List<BookPicture> bookPictures) {
		logger.info("Book 정보 insert 실행 전: " + book);
		bookDao.insertBook(book);
		logger.info("Book 정보 insert 실행 후: " + book);
		
		for (BookPicture picture : bookPictures) {
			picture.setBookNo(book.getNo());
			bookDao.insertBookPicture(picture);
		}		
	}
	
	public Book getBookDetail(int bookNo) {
		logger.info("책번호: " + bookNo);
		return bookDao.getBookByNo(bookNo);
	}
	
	public BookDetailDto getBookDetailWithPicture(int bookNo) {
		logger.info("책번호: " + bookNo);
		// 책정보와 책 사진 정보를 담는 BookDetailDto 객체 생성
		BookDetailDto dto = new BookDetailDto();
		
		// 책정보를 조회한다.
		Book book = bookDao.getBookByNo(bookNo);
		// Book객체에 저장되어 있는 책정보를 BookDetailDto객체의 멤버변수로 복사한다.
		BeanUtils.copyProperties(book, dto);
		
		// 책 사진 정보를 조회한다.
		List<BookPicture> pictures = bookDao.getBookPicturesByBookNo(bookNo);
		// BookDetailDto객체에 책 사진 정보를 저장한다.
		dto.setBookPictures(pictures);
		
		return dto;
	}
	
	public void updateBookPrice(int bookNo, int price, int discountPrice) {
		Book book = bookDao.getBookByNo(bookNo);
		book.setPrice(price);
		book.setDiscountPrice(discountPrice);
		
		bookDao.updateBook(book);
	}
	
	public void updateBookStock(int bookNo, int amount) {
		Book book = bookDao.getBookByNo(bookNo);
		book.setStock(book.getStock() + amount);
		
		bookDao.updateBook(book);
	}
}
