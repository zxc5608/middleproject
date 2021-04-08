package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import VO.reportVO;
import admin.service.AdminServiceImpl;
import admin.service.IadminService;
@WebServlet("/singoList.do")
public class SingoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IadminService service = AdminServiceImpl.getInstance();
		List<reportVO> singoList = service.singoList();
		request.setAttribute("list", singoList);
		request.getRequestDispatcher("admin_mem/singoList.jsp").forward(request,response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
		}

}
