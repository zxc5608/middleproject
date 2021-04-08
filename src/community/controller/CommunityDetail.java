package community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import VO.communityVO;
import community.service.CommunityServiceImpl;
import community.service.IcommunityService;
@WebServlet("/communityDetail.do")
public class CommunityDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		IcommunityService service = CommunityServiceImpl.getService();
		
		communityVO vo=(communityVO) service.listDetail(no);
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/community/comdetail.jsp").forward(request, response);
	}

}
