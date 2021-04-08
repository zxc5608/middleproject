package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.memberVO;
import VO.qnaVO;
import qna.service.IqnaService;
import qna.service.QnaServiceImpl;

 
@WebServlet("/qnaInsert.do")
public class QnaInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		memberVO mvo = (memberVO) session.getAttribute("user");
		int mem_no = mvo.getMem_no();
	//	int mem_no = 0;
		
		String writer=mvo.getMem_nm();
		//String writer="비로그인";
		String title = request.getParameter("title");
		String cont = request.getParameter("cont");
		String  acont=" ";
		String adate=" ";
		String admin=" ";
	
		qnaVO vo = new qnaVO();
		vo.setQ_cont(cont);
		vo.setQ_title(title);
		vo.setWriter(writer);
		vo.setMem_no(mem_no);
		vo.setA_cont(acont);
		vo.setA_date(adate);
		vo.setAdmin(admin);
		IqnaService service = QnaServiceImpl.getService();
		
		int seq = service.insertqna(vo);
		
		request.setAttribute("result", seq);
		
		// 4.
		request.getRequestDispatcher("qna/result.jsp").forward(request, response);
		
	}

}
