package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.memberVO;
import member.service.ImemberService;
import member.service.MemberServiceImpl;

@WebServlet("/pwdCheck.do")
public class PwdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		// 0. 클라이언트 전송사 데이터 받는다
		String inputPw = request.getParameter("pwd");

		memberVO memVo = (memberVO) session.getAttribute("user");
		String id = memVo.getMem_id();
		
		// 1. service 객체 얻기
		ImemberService service = MemberServiceImpl.getInstance();

		String res = service.getPw(id);
		if (res.equals(inputPw)) 
			request.setAttribute("res", res);

		// 4. jsp로 forward
		request.getRequestDispatcher("member/ResPw.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
