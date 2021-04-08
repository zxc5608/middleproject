package community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.communityVO;
import community.service.CommunityServiceImpl;
import community.service.IcommunityService;
@WebServlet("/seeavireview.do")
public class seeavireview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IcommunityService service = CommunityServiceImpl.getService();
		
		List<communityVO> list = service.listAll();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("community/reviewlistAll.jsp").forward(request, response);
	}

}
