package shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.basketVO;
import VO.memberVO;
import shop.service.IshopService;
import shop.service.ShopServiceImpl;

@WebServlet("/InsertBasket.do")
public class InsertBasket extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mo_no = Integer.parseInt(request.getParameter("mo_no"));
		
		HttpSession session = request.getSession();
		
		memberVO memvo = (memberVO) session.getAttribute("user");
		int mem_no = memvo.getMem_no();
		
		basketVO vo = new basketVO();
		vo.setMo_no(mo_no);
		vo.setMem_no(mem_no);
		
		IshopService service = ShopServiceImpl.getInstance();
		
		int cnt = service.insertBasket(vo);
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("shop/Insertbasket.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
