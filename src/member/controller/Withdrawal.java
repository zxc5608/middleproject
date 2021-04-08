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

@WebServlet("/withdrawal.do")
public class Withdrawal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ImemberService service = MemberServiceImpl.getInstance();
		memberVO vo = (memberVO) session.getAttribute("user");
		int no = vo.getMem_no();
		String pw = vo.getPass();
		String pass = request.getParameter("pwd");
		System.out.println("pw : " + pw);
		System.out.println("pass : " + pass);
		System.out.println(no);
		
		int res;
		if (pass.equals(pw)) {
			res = service.deleteBasket(no);
			res = service.deletePay(no);
			res = service.deleteQna(no);
			res = service.deleteReply(no);
			res = service.deleteShop(no);
			res = service.deleteZzim(no);
			res = service.deletemember(no);
			request.setAttribute("delete", res);
			session.invalidate();
		}
		request.getRequestDispatcher("member/deleteMember.jsp").forward(request, response);
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
