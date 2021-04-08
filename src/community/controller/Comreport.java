package community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.memberVO;
import VO.reportVO;
import community.service.CommunityServiceImpl;
import community.service.IcommunityService;

@WebServlet("/comreport.do")
public class Comreport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		memberVO mvo = (memberVO) session.getAttribute("user");
//		String goodid=mvo.getMem_id();
		String goodid="비로그인";
		
		
		int no=Integer.parseInt(request.getParameter("no"));
		String cont = request.getParameter("cont");
		String reason=request.getParameter("reason");
		
		IcommunityService service = CommunityServiceImpl.getService();
		
		int mem_no=service.getreportuser(no);
		
		String badid=service.getreporteduser(mem_no);
		
		reportVO vo= new reportVO();
		vo.setBad_id(badid);
		vo.setGood_id(goodid);
		vo.setReason(reason);
		vo.setCont(cont);
		
		int res=service.insertreport(vo);
		
		request.setAttribute("result", res);
		request.getRequestDispatcher("community/result.jsp").forward(request, response);
	}

}
