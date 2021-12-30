package com.sample.controller;

import java.util.Set;

import com.sample.service.EmailMessageServiceImpl;
import com.sample.service.MessageService;
import com.sample.service.SmsMessageServiceImpl;

public class SampleCollectionController {

	/*
	 * 스프링 컨테이너가 생성한 객체를 Collection(배열, Set, List)등에 저장된 형태로 주입받도록 멤버변수를 정의함.
	 */
	private Set<MessageService> messageServices;
	
	public void setMessageServices(Set<MessageService> messageServices) {
		this.messageServices = messageServices;
	}
	
	public void execute() {
		for (MessageService service : messageServices) {
			if (service instanceof EmailMessageServiceImpl) {
				service.send("admin@gmail.com", "hong@gmail.com", "이벤트 알림", "연말 할인 이벤트를 실시합니다.");
			} else if (service instanceof SmsMessageServiceImpl) {
				service.send("02-1234-1234", "010-1111-1111", "이벤트 알림", "연말 할인 이벤트를 실시합니다.");
			}
		}
	}
}
