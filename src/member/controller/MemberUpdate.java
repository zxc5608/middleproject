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

@WebServlet("/memberUpdate.do")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		memberVO memVo = (memberVO) session.getAttribute("user");
		String id = memVo.getMem_id();
		String img = request.getParameter("file");
		String pw = request.getParameter("repw");
		String tel = request.getParameter("reHp");
		String[] pre = request.getParameterValues("reLike");
		System.out.println(pw);
		System.out.println(img);
		System.out.println(tel);
		System.out.println(pre);
		
		//1. service 객체 얻기
      	ImemberService service = MemberServiceImpl.getInstance();
     

      	memberVO vo = new memberVO();
      	vo.setMem_id(id);

      	//프로필 변경
		if(img !=null) {
	    vo.setProfile("../images1/"+img);
		int res= service.updateProfile(vo);
		memVo.setProfile(img);
		session.setAttribute("user", memVo);
		request.setAttribute("res", res);
		request.getRequestDispatcher("member/ResUpdate.jsp").forward(request, response);
		
		//비밀번호 변경
		}else if(pw!=null) {
			vo.setPass(pw);
		int res = service.updatePw(vo);
//		session.removeAttribute(vo.getPass());
		memVo.setPass(pw);
		session.setAttribute("user",memVo);
		request.setAttribute("res", res);
		request.getRequestDispatcher("member/ResUpdate.jsp").forward(request, response);
		
		//전화번호 변경
		}else if(tel!=null) {
			vo.setMem_tel(tel);
			int res = service.updateTel(vo);
			memVo.setMem_tel(tel);
			session.setAttribute("user",memVo);
			request.setAttribute("res", res);
			request.getRequestDispatcher("member/ResUpdate.jsp").forward(request, response);
		
		//선호도 변경
		}else if(pre!=null) {
			if (pre.length == 1) {
				vo.setPre1(pre[0]);
				vo.setPre2(" ");
				vo.setPre3(" ");
				memVo.setPre1(pre[0]);
				memVo.setPre2(" ");
				memVo.setPre3(" ");
			} else if (pre.length == 2) {
				vo.setPre1(pre[0]);
				vo.setPre2(pre[1]);
				vo.setPre3(" ");
				memVo.setPre1(pre[0]);
				memVo.setPre2(pre[1]);
				memVo.setPre3(" ");
			} else {
				vo.setPre1(pre[0]);
				vo.setPre2(pre[1]);
				vo.setPre3(pre[2]);
				memVo.setPre1(pre[0]);
				memVo.setPre2(pre[1]);
				memVo.setPre3(pre[2]);
				
			}
			int res = service.updateLike(vo);
			request.setAttribute("res", res);
			session.setAttribute("user",memVo);
			request.getRequestDispatcher("member/ResUpdate.jsp").forward(request, response);
		}
	}

}
