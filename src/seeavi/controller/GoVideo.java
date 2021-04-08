package seeavi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.movieVO;
import seeavi.service.IseeaviService;
import seeavi.service.SeeaviServiceImpl;

@WebServlet("/GoVideo.do")
public class GoVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
		
		IseeaviService service = SeeaviServiceImpl.getInstance();
		
		movieVO vo = service.getOneMovie(mo_no);
		
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("seeavi/playvideo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
