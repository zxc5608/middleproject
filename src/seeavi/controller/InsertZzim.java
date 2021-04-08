package seeavi.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.memberVO;
import VO.zzimVO;
import seeavi.service.IseeaviService;
import seeavi.service.SeeaviServiceImpl;

@WebServlet("/InsertZzim.do")
public class InsertZzim extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
		
		HttpSession session = request.getSession();
		memberVO vo = (memberVO) session.getAttribute("user");
		int mem_no = vo.getMem_no();
		
		IseeaviService service = SeeaviServiceImpl.getInstance();
		
		zzimVO zvo = new zzimVO();
		zvo.setMo_no(mo_no);
		zvo.setMem_no(mem_no);
		
		int cnt = service.insertZzim(zvo);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("seeavi/insertzzim.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
