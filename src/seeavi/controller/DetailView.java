package seeavi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.memberVO;
import VO.movieVO;
import seeavi.service.IseeaviService;
import seeavi.service.SeeaviServiceImpl;

@WebServlet("/DetailView.do")
public class DetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
		
		IseeaviService service = SeeaviServiceImpl.getInstance();
		
		movieVO vo = service.getOneMovie(mo_no);
		
		request.setAttribute("vo", vo);
		
		HttpSession session = request.getSession();
		memberVO memVO = (memberVO) session.getAttribute("user");
		int mem_no = memVO.getMem_no();
		
		memberVO memVo = service.payWhat(mem_no);
		request.setAttribute("memVo", memVo);
		
		request.getRequestDispatcher("seeavi/상세보기.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
