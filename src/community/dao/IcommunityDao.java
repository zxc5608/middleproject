package community.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.communityVO;
import VO.reportVO;

public interface IcommunityDao {
	//페이지별 게시글 가져오기- search 
			public List<communityVO> listPage(Map<String, Object> map) throws SQLException;
			
			//전체 글 갯수 가져오기
				public int getTotalCount() throws SQLException;
				public int updatecount(int no) throws SQLException;
				public int writecommunity(communityVO vo) throws SQLException;
				public communityVO listDetail(int no) throws SQLException;
				public List<communityVO> searchcom(String search) throws SQLException;
				public int getreportuser(int no) throws SQLException;
				public String getreporteduser(int mem_no)throws SQLException;
				public int insertreport(reportVO vo)throws SQLException;
				public int comupdate(communityVO vo)throws SQLException;
				public List<communityVO> listAll() throws SQLException;
	}

