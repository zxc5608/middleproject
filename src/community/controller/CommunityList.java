package community.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.communityVO;
import community.service.CommunityServiceImpl;
import community.service.IcommunityService;

@WebServlet("/communityList.do")
public class CommunityList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지별리스트 가져오기 
		
		
				//0. page번호 가져오기
				int cpage=Integer.parseInt(request.getParameter("page"));//1
				
						//1 service객체
						IcommunityService  service = CommunityServiceImpl.getService();
						
						//전체 글갯수 가져오기
						int totalCount = service.getTotalCount();//17
						
						//한페이지당 출력할 글 갯수
						int perList=5;
						
						int start = (cpage-1)*perList+1;//1 6 11 16
						//cpage =1->1
						//cpage=2 ->4
						//cpage=3->7
						int end=start+perList-1;//5 10 15 20
						
						if(end>totalCount) end=totalCount;
						
						
						//한화면에 출력될 페이지 갯수
						int perPage = 3;
						int totalPage = (int) Math.ceil(totalCount/(double)perList);
						
						int startPage = ((cpage-1)/perPage * perPage)+1;
						int endPage= startPage+perPage-1;
						if(endPage>totalPage)endPage=totalPage;
						
						Map<String, Object> map = new HashMap<>();
						map.put("start", start);
						map.put("end", end);
						//2메서드 호출 
						List<communityVO> list = service.listPage(map);
						
						//3 결과값 저장 
						request.setAttribute("list", list);
						request.setAttribute("sp", startPage);
						request.setAttribute("ep", endPage);
						request.setAttribute("tp", totalPage);
						
						
						//4
						request.getRequestDispatcher("community/listPage.jsp").forward(request, response);
	}

}
