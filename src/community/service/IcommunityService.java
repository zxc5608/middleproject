package community.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.communityVO;
import VO.reportVO;

public interface IcommunityService {
		//페이지별 게시글 가져오기- search 
		public List<communityVO> listPage(Map<String, Object> map) ;
		
		//전체 글 갯수 가져오기
		public int getTotalCount() ;
		
		public communityVO listDetail(int no);
		
		public int updatecount(int no);
		
		public int writecommunity(communityVO vo);
		
		public List<communityVO> searchcom(String search);
		
		public int getreportuser(int no);
		
		public String getreporteduser(int mem_no);
		
		public int insertreport(reportVO vo);
		
		public int comupdate(communityVO vo);
		
		public List<communityVO> listAll();
}
