package shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.movieVO;
import shop.service.IshopService;
import shop.service.ShopServiceImpl;

@WebServlet("/GetDownList.do")
public class GetDownList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cate = request.getParameter("category");
		
		IshopService service = ShopServiceImpl.getInstance();
		
		List<movieVO> list = null;
		if(cate != null) {
			list = service.getDownList(cate);
		}else {
			list = service.getDownList("로맨스");
		}
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("shop/getdownlist.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
