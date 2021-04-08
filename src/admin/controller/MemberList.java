package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.memberVO;
import admin.service.AdminServiceImpl;
import admin.service.IadminService;

@WebServlet("/memList.do")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//전체 리스트 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IadminService service = AdminServiceImpl.getInstance();
		List<memberVO> memList = service.memList();
		request.setAttribute("list", memList);
		request.getRequestDispatcher("admin_mem/memList.jsp").forward(request,response);
	}
	
	//페이지별 리스트 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		IadminService service = AdminServiceImpl.getInstance();
		List<memberVO> memList = service.memList();
		request.setAttribute("list", memList);
		request.getRequestDispatcher("admin_mem/memList.jsp").forward(request,response);
		/*int page = Integer.parseInt(request.getParameter("page"));
		IadminService service = AdminServiceImpl.getInstance();
		// 전체 회원수 
		int Allmem = service.totalMem();
		
		// 페이지 기준
		int perList = 5;
		
		int start = (page-1)* perList +1;
		int end = start + perList -1;	
		if(end > Allmem) end = Allmem;
		
		// 한 화면에 출력될 페이지 갯수 
		int perPage = 3;
		int totalPage = (int)(Math.ceil(Allmem/(double)perList));
		int startPage = ((page-1)/perPage * perPage) +1;
		int endPage = startPage + perPage -1;
		if(endPage>totalPage) endPage = totalPage;
		
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		List<memberVO> list = service.listPage(map);
		
		request.setAttribute("list", list);
		request.setAttribute("sp", startPage);
		request.setAttribute("ep", endPage);
		request.setAttribute("tp", totalPage);
		
		request.getRequestDispatcher("admin_mem/listPage.jsp").forward(request, response);*/
//		doGet(request, response);
	}

}
