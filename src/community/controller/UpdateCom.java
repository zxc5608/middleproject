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

@WebServlet("/updatecom.do")
public class UpdateCom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		String cont = request.getParameter("cont");
		String title = request.getParameter("title");
		
		IcommunityService service= CommunityServiceImpl.getService();
		
		communityVO vo = new communityVO();
		vo.setCom_no(no);
		vo.setCont(cont);
		vo.setTitle(title);
		
		int res=service.comupdate(vo);
		
		request.setAttribute("result", res);
		request.getRequestDispatcher("community/result.jsp").forward(request, response);
		
	}

}
