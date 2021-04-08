package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.memberVO;
import member.service.ImemberService;
import member.service.MemberServiceImpl;

@WebServlet("/complete.do")
public class Complete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		int pay = Integer.parseInt(request.getParameter("pay"));
		ImemberService service = MemberServiceImpl.getInstance();
		memberVO memVo = new memberVO();
		memVo.setMem_id(id);
		System.out.println(pay);
		if (pay > 0) {
				memVo.setPayok(1);
		} else {
			memVo.setPayok(0);
		}
		int res = service.updatePay(memVo);
		request.setAttribute("res", res);
		System.out.println(res);
		request.getRequestDispatcher("member/payok.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
