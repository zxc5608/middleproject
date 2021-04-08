package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.noticeVO;
import admin.service.AdminServiceImpl;
import admin.service.IadminService;

@WebServlet("/updateNotice.do")
public class UpdateNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IadminService service = AdminServiceImpl.getInstance();
		String title = request.getParameter("title");
		String cont = request.getParameter("cont");
		int no= Integer.parseInt(request.getParameter("no"));
		
		

		noticeVO vo = new noticeVO();
		vo.setTitle(title);
		vo.setCont(cont);
		vo.setNotice_no(no);
		
		int res = service.updateNotice(vo);
		request.setAttribute("res", res);
		request.getRequestDispatcher("admin_mem/updateNotice.jsp").forward(request,response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
