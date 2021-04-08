package member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.memberVO;
import VO.zzimVO;
import member.service.ImemberService;
import member.service.MemberServiceImpl;

@WebServlet("/ZzimList.do")
public class ZzimList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 현재 로그인된 회원 번호
		HttpSession session = request.getSession(true);
		memberVO vo = (memberVO) session.getAttribute("user");
		int mem_no = vo.getMem_no();

		// 0. page 번호 가져오기
		int cpage = Integer.parseInt(request.getParameter("page"));

		// 1. service 객체 얻어오기
		ImemberService service = MemberServiceImpl.getInstance();
		
		// 전체 글 개수 가져오기
		int totalCount = service.getTotalCount(mem_no);

		// 한 페이지당 출력 할 글 개수
		int perList = 2;

		int start = (cpage - 1) * perList + 1;

		// cpage = 1 -> 1 //cpage = 2 -> 4//cpage = 3 -> 7
		int end = start + perList - 1;

		// start= 19 ~21 start= 20
		if (end > totalCount)
			end = totalCount;

		// 한 화면에 출력될 페이지 개수
		int perPage = 3;
		int totalPage = (int) (Math.ceil(totalCount / (double) perList));

		// cpage = 1 =>1 // cpage = 2 =>1 // cpage= 3 =>3 // cpage = 4 =>4
		int startPage = ((cpage - 1) / perPage * perPage) + 1;

		int endPage = startPage + perPage - 1;
		if (endPage > totalPage) endPage = totalPage;
		
		//List가져오는 메소드 호출
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_no", mem_no);
		map.put("start", start);
		map.put("end", end);
		
		List<zzimVO> list = service.zzimList(map);
		
		//결과값 저장
		request.setAttribute("list", list);
		request.setAttribute("sp", startPage);
		request.setAttribute("ep", endPage);
		request.setAttribute("tp", totalPage);	
		
		request.getRequestDispatcher("member/zzimPageList.jsp").forward(request, response);
	}

}
