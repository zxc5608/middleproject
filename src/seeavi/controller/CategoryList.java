package seeavi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.memberVO;
import VO.movieVO;
import seeavi.service.IseeaviService;
import seeavi.service.SeeaviServiceImpl;

@WebServlet("/CategoryList.do")
public class CategoryList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IseeaviService service = SeeaviServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		memberVO vo = (memberVO) session.getAttribute("user");
		
		String pre1 = vo.getPre1();
		String pre2 = vo.getPre2();
		String pre3 = vo.getPre3();
		
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> map1 = new HashMap<String, String>();
		HashMap<String, String> map2 = new HashMap<String, String>();
		HashMap<String, String> map3 = new HashMap<String, String>();
		
		// 회원의 선호 카테고리가 없다면??
		
		
		map1.put("mo_category", pre1);
		map2.put("mo_category", pre2);
		map3.put("mo_category", pre3);
		list.add(map1);
		list.add(map2);
		list.add(map3);
		
		List<movieVO> list1 = service.getCategory(list);
		
		request.setAttribute("list1", list1);
		
		request.getRequestDispatcher("seeavi/categoryList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
