package faq.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.fnqVO;
import faq.service.FaqServiceImpl;
import faq.service.IfaqService;

/**
 * Servlet implementation class FaqList
 */
@WebServlet("/FaqList.do")
public class FaqList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//0.page 번호 가져오기 
		int cpage = Integer.parseInt(request.getParameter("page"));
		
		// 1. service 객체
		IfaqService service = FaqServiceImpl.getService();
		
		// 전체 글 개수 가져오기
		int totalCount = service.getTotalCount();
		
		// 한 페이지당 출력할 글 개수
		int perList = 5;
		
		int start = (cpage-1) * perList + 1;
		
		int end = start + perList - 1;
		
		if(end > totalCount) end = totalCount;
		
		//한화면에 출력될 페이지 갯수 
		int perPage = 2;
		int totalPage =  (int)(Math.ceil(totalCount /  (double)perList));
		
		int startPage = ( (cpage -1) /perPage * perPage  ) +1;
		//cpage=1 -> 1  cpage=2 -> 1  cpage=3 -> 3  cpage = 4 -> 3
		int endPage = startPage + perPage - 1 ; 
		if(endPage > totalPage) endPage = totalPage;
			
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		//2메서드 호출 
		List<fnqVO> list = service.listPage(map);
		
		//3 결과값 저장 
		request.setAttribute("list", list);
		request.setAttribute("sp", startPage);
		request.setAttribute("ep", endPage);
		request.setAttribute("tp", totalPage);
		
		request.getRequestDispatcher("faq/listpage.jsp").forward(request, response);
	
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
