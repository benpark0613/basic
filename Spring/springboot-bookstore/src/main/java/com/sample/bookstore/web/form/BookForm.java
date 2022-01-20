package com.sample.bookstore.web.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class BookForm {

		private String title;
		private String author;
		private String publisher;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date pubDate;
		private int price;
		private int discountPrice;
		private int stock;
}
