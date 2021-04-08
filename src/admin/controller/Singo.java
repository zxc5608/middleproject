package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.memberVO;
import VO.reportVO;
import admin.service.AdminServiceImpl;
import admin.service.IadminService;

@WebServlet("/singo.do")
public class Singo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IadminService service = AdminServiceImpl.getInstance();
		String war = request.getParameter("war");
		List<reportVO> singoList = service.singoList();
		String bad = null;
		memberVO vo = new memberVO();

		vo.setWarning(war);
		for(reportVO report : singoList) {
			 bad = report.getBad_id();
			 vo.setMem_id(bad);
		System.out.println(bad);	 
		}

		int res = service.updateWar(vo);
		System.out.println(res);
		request.setAttribute("res", res);
		request.getRequestDispatcher("admin_mem/stop.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
