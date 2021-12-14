package kr.co.jhta.controller;

import java.util.List;

import com.sample.model2.controller.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jhta.dao.BoardDao;
import kr.co.jhta.vo.Board;

public class HomeController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HomeController.execute(request, response) 실행");
		
		// home.jsp에 환영메세지를 전달해서 출력시키기
		String greeting = "홈페이지 방문을 환영합니다.";
		
		// 요청객체에 속성으로 전달할 값을 저장한다.
		request.setAttribute("message", greeting);
		
		// 최신글 5개 조회하기
		BoardDao boardDao = new BoardDao();
		List<Board> boards = boardDao.findAll();
		boards = boards.subList(0, 5);
		//요청객체에 속성으로 전달할 값을 저장한다.
		request.setAttribute("boardList", boards);
		
		// home.jsp로 이동
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
		requestDispatcher.forward(request, response);
	}
}
