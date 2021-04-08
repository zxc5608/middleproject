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

@WebServlet("/join.do")
public class MemberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 0. 클라이언트 요청(전송)시 전송되는 데이터를 받는다
		String id = request.getParameter("mem_id");
		String pass = request.getParameter("mem_pass");
		String name = request.getParameter("mem_name");
		String bir = request.getParameter("mem_bir");
		String tel = request.getParameter("mem_tel");
		String payok = request.getParameter("mem_pay"); // 결제x : 0
		String[] content = request.getParameterValues("content");

		ImemberService service = MemberServiceImpl.getInstance();

		memberVO vo = new memberVO();
		vo.setMem_id(id);
		vo.setPass(pass);
		vo.setMem_nm(name);
		vo.setBir(bir);
		vo.setMem_tel(tel);

		if ("결제 하기".equals(payok)) {
			int cnt = 1;
			vo.setPayok(cnt);
		} else {
			int cnt = 0;
			vo.setPayok(cnt);
		}

		if (content.length == 1) {
			vo.setPre1(content[0]);
		} else if (content.length == 2) {
			vo.setPre1(content[0]);
			vo.setPre2(content[1]);
		} else {
			vo.setPre1(content[0]);
			vo.setPre2(content[1]);
			vo.setPre3(content[2]);

		}
		String res = service.insertMember(vo);
		request.setAttribute("res", res);

		// // 4. 결과로 출력하거나 json데이터 생성 - jsp 응답 페이지에서
		request.getRequestDispatcher("member/SignRes.jsp").forward(request, response);
	}

}
