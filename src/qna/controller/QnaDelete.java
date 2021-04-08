package qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.service.IqnaService;
import qna.service.QnaServiceImpl;



@WebServlet("/qnaDelete.do")
public class QnaDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QnaDelete() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 0.
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		
		// 1.
		//IBoardService service = BoardServiceImpl.getService();
		IqnaService service = QnaServiceImpl.getService();
		
		// 2.
		int cnt = service.qnaDelete(seq); 
				
		
		// 3.
		request.setAttribute("result", cnt); 
		
		
		// 4.
		request.getRequestDispatcher("qna/result.jsp").forward(request, response);
		
	}

}
