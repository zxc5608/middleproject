package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.adminVO;
import VO.memberVO;
import member.service.ImemberService;
import member.service.MemberServiceImpl;


@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	HttpSession session = request.getSession();
	
	String viewPage = null;
	
	String userId = (String) session.getAttribute("id");
	String adminId = (String) session.getAttribute("id");
	System.out.println("id");
	if(userId == null && adminId==null) {
		session.invalidate();
		viewPage = "/member/Login.jsp";
	}else {
		viewPage = "/seeavi/netmain2.jsp";
	}
	response.sendRedirect(request.getContextPath() + viewPage);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String inputId = request.getParameter("id");
		String inputPw = request.getParameter("pw");
		
		String type = request.getParameter("chk");
		System.out.println(type);
		
		ImemberService service = MemberServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		
		String viewPage = null;
		if("admin".equals(type)) {	
	
			adminVO avo = new adminVO();
			avo.setAd_id(inputId);
			avo.setAd_pass(inputPw);
			
			adminVO advo = null;
			advo = service.adminloginCheck(avo);
			if(advo!=null) {
				session.setAttribute("admin", advo);
			}
			viewPage = "/admin/main.jsp";
			
		}else if("user".equals(type)){ 
			memberVO vo = new memberVO();
			vo.setMem_id(inputId);
			vo.setPass(inputPw);
			memberVO memvo = null;
			memvo = service.userloginCheck(vo);
			if(memvo!=null) {
				session.setAttribute("user",memvo);
				viewPage = "/seeavi/netmain2.jsp";
			}else{
				viewPage = "/seeavi/netmain.jsp";
			}
			
//				viewPage = "/member/Login.jsp";
		}
		response.sendRedirect(request.getContextPath() + viewPage);
	
	}

}
