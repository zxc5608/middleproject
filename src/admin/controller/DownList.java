package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.movieVO;
import VO.shoppayVO;
import admin.service.AdminServiceImpl;
import admin.service.IadminService;

@WebServlet("/downList.do")
public class DownList extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IadminService service = AdminServiceImpl.getInstance();
		
		
		List<shoppayVO> downList = service.downList();
//		List<memberVO> memList = null;
		List<movieVO> movieList = null;
//		int mem_no = 0;
		int mo_no = 0;
		for(shoppayVO vo : downList) {
//			mem_no = vo.getMem_no();
//			memList = service.downMem(mem_no);
//			request.setAttribute("mem", memList);
			mo_no = vo.getMo_no();
			movieList = service.downMovie(mo_no);
			request.setAttribute("movie", movieList);
//			System.out.println(mem_no);
//			System.out.println(memList);
			System.out.println(movieList);
		}
		request.setAttribute("list", downList);
		request.getRequestDispatcher("admin_mem/downList.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
