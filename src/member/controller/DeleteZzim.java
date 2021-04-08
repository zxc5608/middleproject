package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.ImemberService;
import member.service.MemberServiceImpl;

@WebServlet("/DeleteZzim.do")
public class DeleteZzim extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HashMap<String, String>> alist = new ArrayList<>();
		HashMap<String, String> map = new HashMap<>();
		String[] arr = request.getParameterValues("mo_no[]");
	
		if(arr != null) {
			for(int i=0; i<arr.length; i++) {
				map.put("mo_no", arr[i]);
				alist.add(map);
			}			
		}else {
			System.out.println("삭제할 값이 없음");
		}
		System.out.println(alist);
		
		ImemberService service = MemberServiceImpl.getInstance();
		
		int cnt = service.deleteZzim(alist);
		
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("member/deletezzim.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
