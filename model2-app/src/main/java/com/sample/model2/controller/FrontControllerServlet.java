package com.sample.model2.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jhta.controller.HomeController;
import kr.co.jhta.controller.LoginController;
import kr.co.jhta.controller.LoginFormController;
import kr.co.jhta.controller.LogoutController;
import kr.co.jhta.controller.RegisterController;
import kr.co.jhta.controller.RegisterFormController;
import kr.co.jhta.el.controller.ElSampleController1;
import kr.co.jhta.el.controller.ElSampleController2;
import kr.co.jhta.el.controller.ElSampleController3;
import kr.co.jhta.jstl.controller.JstlController1;
import kr.co.jhta.jstl.controller.JstlController2;
import kr.co.jhta.jstl.controller.JstlController3;
import kr.co.jhta.jstl.controller.JstlController4;

@WebServlet("*.hta")
public class FrontControllerServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 웹 애플리케이션의 ContextPath를 조회한다.
		// ContextPath는 웹 애플리케이션을 식별하는 이름이다.
		// 특별히 지정하지않으면 프로젝트이름이 contextPath가 된다.
		// Tomcat에 배포된 여러 웹애플리케이션은 서로 다른 contextPath를 가지며, contextPath가 웹 애플리케이션 프로젝트를 구분하는 식별자가 된다.
		String contextPath = request.getContextPath();
		
		// 클라이언트의 요청URI를 조회한다.
		String requestURI = request.getRequestURI();
		requestURI = requestURI.replace(contextPath, "");
		System.out.println("요청URI [" + requestURI + "]");
		
		// 요청URI에 해당하는 컨트롤러 객체를 생성하고 실행시킨다.
		try {
			if ("/home.hta".equals(requestURI)) {
				new HomeController().execute(request, response);

			} else if ("/registerform.hta".equals(requestURI)) {
				new RegisterFormController().execute(request, response);
				
			} else if ("/register.hta".equals(requestURI)) {
				new RegisterController().execute(request, response);
				
			} else if ("/loginform.hta".equals(requestURI)) {
				new LoginFormController().execute(request, response);
				
			} else if ("/login.hta".equals(requestURI)) {
				new LoginController().execute(request, response);
				
			} else if ("/logout.hta".equals(requestURI)) {
				new LogoutController().execute(request, response);
				
			} else if ("/el1.hta".equals(requestURI)) {
				new ElSampleController1().execute(request, response);
				
			} else if ("/el2.hta".equals(requestURI)) {
				new ElSampleController2().execute(request, response);
				
			} else if ("/el3.hta".equals(requestURI)) {
				new ElSampleController3().execute(request, response);
				
			} else if ("/jstl1.hta".equals(requestURI)) {
				new JstlController1().execute(request, response);
			
			} else if ("/jstl2.hta".equals(requestURI)) {
				new JstlController2().execute(request, response);
				
			} else if ("/jstl3.hta".equals(requestURI)) {
				new JstlController3().execute(request, response);
				
			} else if ("/jstl4.hta".equals(requestURI)) {
				new JstlController4().execute(request, response);
				
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}








