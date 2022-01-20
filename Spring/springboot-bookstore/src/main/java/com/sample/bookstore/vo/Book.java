package com.sample.bookstore.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class Book {

	private int no;
	private String title;
	private String author;
	private String publisher;
	private Date pubDate;
	private int price;
	private int discountPrice;
	private int stock;
	private Date updateDate;
	private Date CreatedDate;
	
	
	
}
