
package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.ImemberService;
import member.service.MemberServiceImpl;

@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   request.setCharacterEncoding("utf-8");
		
	   //0. 클라이언트 전송사 데이터 받는다
	   String inputId = request.getParameter("id");
      
      	//1. service 객체 얻기
      	ImemberService service = MemberServiceImpl.getInstance();
      
      	//2. service메소드 호출 - 결과값 얻기
		String resId = service.getId(inputId);
      
		//3. 결과값 request에 저장
		request.setAttribute("resId", resId);
	   
		//4. jsp로 forward
		request.getRequestDispatcher("/member/IdCheck.jsp").forward(request, response);

   }

}