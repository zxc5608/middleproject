package community.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.communityVO;
import community.service.CommunityServiceImpl;
import community.service.IcommunityService;

@WebServlet("/searchcom.do")
public class searchcom extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search= request.getParameter("cont");
		
		IcommunityService service= CommunityServiceImpl.getService();
	
		
		
		//2메서드 호출 
		List<communityVO> list = service.searchcom(search);
		
		//3 결과값 저장 
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("community/search.jsp").forward(request, response);
	}

}
