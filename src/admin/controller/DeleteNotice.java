package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminServiceImpl;
import admin.service.IadminService;

@WebServlet("/deleteNotice.do")
public class DeleteNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("name");
		String cont = request.getParameter("comments");
		int no= Integer.parseInt(request.getParameter("no"));
		
		IadminService service = AdminServiceImpl.getInstance();
		int res = service.deleteNotice(no);
		request.setAttribute("delete", res);
		request.getRequestDispatcher("admin_Service/deleteNo.jsp").forward(request, response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
