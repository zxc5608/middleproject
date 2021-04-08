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

@WebServlet("/newNotice.do")
public class NewNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 0. 클라이언트 요청(전송)시 전송되는 데이터를 받는다
		String title = request.getParameter("name");
		String cont = request.getParameter("comments");
		

		IadminService service = AdminServiceImpl.getInstance();

		noticeVO vo = new noticeVO();
		vo.setTitle(title);
		vo.setCont(cont);

		String res = service.insertNotice(vo);
		request.setAttribute("res", res);
		request.getRequestDispatcher("admin_Service/noticeWrite.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
