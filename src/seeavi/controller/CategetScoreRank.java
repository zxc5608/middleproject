package seeavi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.movieVO;
import seeavi.service.IseeaviService;
import seeavi.service.SeeaviServiceImpl;

@WebServlet("/CategetScoreRank.do")
public class CategetScoreRank extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cat="";
		if(request.getParameter("a").equals("선택")) {
			cat = "로맨스";
		}else {
			cat = request.getParameter("a");
		}
		IseeaviService service = SeeaviServiceImpl.getInstance();
		
		List<movieVO> list =service.CategetScoreRank(cat);
		
		request.setAttribute("list1", list);
		
		request.getRequestDispatcher("seeavi/categoryList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
