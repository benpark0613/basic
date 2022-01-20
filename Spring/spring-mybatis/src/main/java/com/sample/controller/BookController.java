package com.sample.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.dto.BookDetailDto;
import com.sample.form.BookInsertForm;
import com.sample.form.Criteria;
import com.sample.pagination.Pagination;
import com.sample.service.BookService;
import com.sample.vo.Book;
import com.sample.vo.BookPicture;

@Controller
@RequestMapping("/book")
public class BookController {
	
	static final Logger logger = LogManager.getLogger(BookController.class);

	@Autowired
	BookService bookService;
	
	@GetMapping("/insert.do")
	public String form() {
		
		return "book/form.jsp";
	}
	
	@PostMapping("/insert.do")
	public String save(BookInsertForm form) throws IOException {
		String saveDirectory = "D:\\Develop\\projects\\spring-workspace\\spring-mybatis\\src\\main\\webapp\\resources\\images";
		
		logger.debug("입력폼 정보: " + form);
		
		List<BookPicture> bookPictures = new ArrayList<BookPicture>();
		
		// 업로드된 첨부파일을 지정된 폴더에 저장하고, BookPicture객체를 생성해서 파일명을 저장하고, 생성된 BookPicture객체를 List객체에 저장한다.
		/*
		 * MultipartFile
		 * 		- 첨부파일 업로드를 지원하는 객체다.
		 * 		- 첨부파일 선택 필드 하나 당 MutipartFile객체가 하나씩 생성된다.
		 * 		- 폼의 첨부파일 선택 필드에서 첨부파일을 선택하지 않아도 해당 필드에 대한 MultipartFile객체는 생성된다.
		 * 		- MultipartFile의 주용 API
		 * 			+ boolean 		isEmpty()
		 * 								MultipartFile객체에 첨부파일이 포함되어 있지 않으면 true를 반환한다.
		 * 			+ String 		getOriginalFilename()
		 * 								업로드된 첨부파일의 파일명을 반환한다.
		 * 			+ String		getContentType()
		 * 								업로드된 첨부파일의 컨텐츠 타입을 반환한다.(text/plain, text/html, img/png 등)
		 * 			+ long 			getSize()
		 * 								업로드된 첨부파일의 파일사이즈를 반환한다.
		 * 			+ InputStream	getInputStream()
		 * 								업로드된 첨부파일은 temp 폴더에 임시파일로 저장되는데, 그 임시파일의 내용을 읽어오는 스트림을 반환한다.
		 * 			+ byte[]		getBytes()
		 * 								업로드된 첨부파일의 실제 데이터를 byte 배열에 담아서 반환한다.
		 */
		List<MultipartFile> upfiles = form.getUpfiles();
		for (MultipartFile multipartFile : upfiles) {
			// MultipartFile의 isEmpty() 메소드는 해당 객체에 첨부파일 정보가 없으면 true를 반환한다.
			if (!multipartFile.isEmpty()) {		
				// MultipartFile객체에서 업로드된 첨부파일의 이름을 조회한다.
				String filename = System.currentTimeMillis() + System.currentTimeMillis() + multipartFile.getOriginalFilename();
				
				// 책의 사진정보를 저장하는 BookPicture객체를 생성하고, 첨부파일 이름을 저장한다.
				BookPicture bookPicture = new BookPicture();
				bookPicture.setPicture(filename);
				// 생상된 BookPicture객체를 List객체에 저장한다.
				bookPictures.add(bookPicture);
				
				// 업로드된 첨부파일을 프로젝트내의 images 폴더에 저장하기
				// MultipartFile객체는 임시디렉토리에 임시파일상태로 저장된 첨부파일을 읽어오는 스트림을 제공한다.
				InputStream in = multipartFile.getInputStream();
				// 지정된 폴더에 첨부파일명으로 파일을 출력하는 스트림 생성하기
				FileOutputStream out = new FileOutputStream(new File(saveDirectory, filename));
				// Spring에서 제공하는 FileCopyUtils.copy(InputStream in, OutputStream out)를 메소드를 사용해서
				// temp폴더에 임시파일로 저장되어 있는 첨부파일을 읽어서 sr/main/resources/images 폴더로 복사한다.
				FileCopyUtils.copy(in, out);
			}
		}
		
		Book book = new Book();
		// BookInsertForm객체의 멤버변수에 저장된 값을 Book객체의 멤버변수에 복사한다.
		// 멤버변수의 타입과 멤버변수의 이름이 일치하는 값이 복사되며, 이름은 같은데 타입이 서로 다르면 예외가 발생한다.
		BeanUtils.copyProperties(form, book);
		
		// 책정보와 책사진정보를 서비스메소드에 전달해서 저장시킨다.
		bookService.addNewBook(book, bookPictures);		
		
		return "redirect:list.do";
	}
	
	
	/*
	 * 요청방식 : GET
	 * 요청URL : /book/list.do
	 * 요청파라미터 : page, opt, value
	 * 이동할 뷰페이지 : /WEB-INF/jsp/book/list.jsp
	 * 뷰페이지에 전달되는 데이터 : List<Book>
	 * 
	 * @RequestParam(name = "요청파라미터이름", required = 필수요청파라미터 여부, defaultValue = "기본값")
	 * 		name : 요청파라미터의 이름이다.
	 * 		required : 필수요청파라미터인지 여부, true/false 값만 가능, 기본값은 true다.
	 *                 * @RequestParam설정없이 사용한 요청파라미터용 매개변수는 전부 required가 true인 상태다.
	 *      defaultValue : required가 false로 설정되어 있고, name에서 지정한 이름의 요청파라미터가 존재하지 않을 때 변수에 대입할 기본값이다.
	 */
	
	@GetMapping("/list.do")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page,
			Criteria criteria, Model model) {
		logger.info("요청 페이지번호 : " + page);
		logger.info("검색조건 및 값 :" + criteria);
		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		int totalRecords = bookService.getTotalRows(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page, totalRecords);
		
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		logger.info("검색조건 및 값 :" + criteria);

		// 검색조건(opt, value)과 조회범위(beginIndex, endIndex)가 포함된 Criteria를 서비스에 전달해서 데이터 조회
		List<Book> books = bookService.searchBooks(criteria);
		
		model.addAttribute("books", books);		
		model.addAttribute("pagination", pagination);
		
		return "book/list.jsp";
	}
	
	/*
	 * 요청방식 : GET
	 * 요청URL : /book/detail.do
	 * 요청파라미터 : no
	 * 이동할 뷰페이지 : /WEB-INF/jsp/book/detail.jsp
	 * 뷰페이지에 전달되는 데이터 : Book
	 */
	@GetMapping("/detail.do")
	public String detail(int no, Model model) {
		BookDetailDto dto = bookService.getBookDetailWithPicture(no);
		model.addAttribute("book", dto);
		
		return "book/detail.jsp";
	}
	
	/*
	 * 요청방식 : GET
	 * 요청URL : /book/modify.do
	 * 요청파라미터 : no
	 * 이동할 뷰페이지 : /WEB-INF/jsp/book/modifyform.jsp
	 * 뷰페이지에 전달되는 데이터 : Book
	 */
	@GetMapping("/modify.do")
	public String modifyform(int no, Model model) {
		Book book = bookService.getBookDetail(no);
		model.addAttribute("book", book);
		
		return "book/modifyform.jsp";
	}
	
	/*
	 * 요청방식 : POST
	 * 요청URL : /book/updatePrice.do
	 * 요청파라미터 : no, price, discountPrice
	 * 재요청URL : detail.do
	 */
	@PostMapping("/updatePrice.do")
	public String updatePrice(int no, int price, int discountPrice) {
		bookService.updateBookPrice(no, price, discountPrice);
		
		return "redirect:detail.do?no=" + no;
	}
	
	/*
	 * 요청방식 : POST
	 * 요청URL : /book/updateStock.do
	 * 요청파라미터 : no, amount
	 * 재요청URL : detail.do
	 */
	@PostMapping("/updateStock.do") 
	public String updateStock(int no, int amount, RedirectAttributes redirectAttributes){
		Book book = bookService.getBookDetail(no);
		redirectAttributes.addFlashAttribute("boook", book);
		
		bookService.updateBookStock(no, amount);
		
		return "redirect:detail.do?no=" + no;
	}
}








