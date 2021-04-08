package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.noticeVO;
import notice.service.InoticeService;
import notice.service.NoticeServiceImpl;

/**
 * Servlet implementation class NoticeDetail
 */
@WebServlet("/NoticeDetail.do")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// id를 조건으로 해서 조회하기
		
					// 0. 클라이언트 요청(전송)시 전송되는 데이터를 받는다 - id
					int no = Integer.parseInt(request.getParameter("no"));
				
					// 1.service 객체 얻어오기
					//	IBuyerService service = BuyerServiceImpl.getService();
						InoticeService service = NoticeServiceImpl.getService();
					
					// 2.service 메서드 호출 - 결과를 받는다
					//	BuyerVO vo = service.getDetail(buyerId);
						noticeVO vo = (noticeVO) service.noticeDetail(no);
						
					// 3. request객체에 결과를 저장한다
						request.setAttribute("vo", vo);
					
					
					// 4. 결과로 출력하거나 json데이터 생성 - jsp 응답페이지
					// jsp페이지로 forward 
						request.getRequestDispatcher("/notice/listAll.jsp").forward(request, response);
	}

}
