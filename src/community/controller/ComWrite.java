package community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.communityVO;
import VO.memberVO;
import community.service.CommunityServiceImpl;
import community.service.IcommunityService;

@WebServlet("/comwrite.do")
public class ComWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		memberVO mvo = (memberVO) session.getAttribute("user");
//		int mem_no = mvo.getMem_no();
		int mem_no = 0;
//		String writer=mvo.getMem_nm();
		String writer="비로그인";
		
		String title=request.getParameter("title");
		String cont= request.getParameter("cont");
		
		communityVO vo =new communityVO();
		vo.setTitle(title);
		vo.setCont(cont);
		vo.setCount(0);
		vo.setChoose(1);
		vo.setMem_no(mem_no);
		vo.setWriter(writer);
		
		IcommunityService service= CommunityServiceImpl.getService();
		
		int res=service.writecommunity(vo);
		
		request.setAttribute("result", res);
		request.getRequestDispatcher("community/result.jsp").forward(request, response);
		
		
	}

}
