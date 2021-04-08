package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.qnaVO;
import qna.service.IqnaService;
import qna.service.QnaServiceImpl;



@WebServlet("/qnaUpdate.do")
public class QnaUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 0. writer, subject, mail, password, content, seq
		// 가져와서 BoardVO에 저장
		 
		String subject = request.getParameter("subject");
		 
		String content = request.getParameter("content");
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		String reply = request.getParameter("reply");
		
		qnaVO vo = new qnaVO();
		
		
		
		vo.setQ_cont(content);
		vo.setQ_title(subject);
		vo.setQ_no(seq);
		vo.setA_cont(reply);
		
/*		vo.setWriter(writer);
		vo.setSubject(subject);
		vo.setPassword(password);
		vo.setMail(mail);
		vo.setContent(content);
		vo.setSeq(seq);
*/		
		
		
		// 1. 
		IqnaService service = QnaServiceImpl.getService();
		
		
		// 2.
		int cnt = service.updateQna(vo);
		
		//int cnt = service.updateBoard(vo);
		
		// 3.
		request.setAttribute("result", cnt); 
				
				
		// 4.
		request.getRequestDispatcher("qna/result.jsp").forward(request, response);

		
		
		
		
		
	}

}
