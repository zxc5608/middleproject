package shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IshopService;
import shop.service.ShopServiceImpl;

@WebServlet("/DeleteBasket.do")
public class DeleteBasket extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HashMap<String, String>> alist = new ArrayList<>();
		String[] arr = request.getParameterValues("mo_no[]");
	
		if(arr != null) {
			for(int i=0; i<arr.length; i++) {
				HashMap<String, String> map = new HashMap<>();
				map.put("mo_no", arr[i]);
				alist.add(map);
			}			
		}else {
			System.out.println("삭제할 값이 없음");
		}
		System.out.println(alist);
		
		IshopService service = ShopServiceImpl.getInstance();
		
		int cnt = service.deleteBasket(alist);
		
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("shop/deletebasket.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
