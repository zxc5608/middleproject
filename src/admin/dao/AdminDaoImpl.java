package admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.memberVO;
import VO.movieVO;
import VO.noticeVO;
import VO.reportVO;
import VO.shoppayVO;
import ibatis.config.SqlMapClientFactory;

public class AdminDaoImpl implements IadminDao{

		private SqlMapClient smc;
		private static AdminDaoImpl dao;
		
		private AdminDaoImpl() {
			smc=SqlMapClientFactory.getSqlMapClient();
		}
		
		public static AdminDaoImpl getInstance() {
			if(dao==null) 
				dao = new AdminDaoImpl();
			return dao;
		}
		
		// 회원 정보 보기 
		@Override
		public List<memberVO> memList() throws SQLException{
			return smc.queryForList("admin.memList");
		}

		/*//회원 리스트 페이지
		@Override
		public List<memberVO> listPage(Map<String, Integer> map) throws SQLException {
			return smc.queryForList("admin.listPage",map);
		}

		@Override
		public int totalMem() throws SQLException {
			return (Integer)smc.queryForObject("admin.totalMem");
		}*/

		// 신고회원보기 
		@Override
		public List<reportVO> singoList() throws SQLException{
			return smc.queryForList("admin.singoList");
		}

		// 결제내역 보기 - 회원권
		@Override
		public List<memberVO> payList() throws SQLException {
			return smc.queryForList("admin.payList");
		}

		// 결제내역 보기 - 다운로드
		@Override
		public List<shoppayVO> downList() throws SQLException {
			return smc.queryForList("admin.downList");
		}


		// 영화정보 가져오기 
		@Override
		public List<movieVO> downMovie(int mo_no) throws SQLException {
			return smc.queryForList("admin.getMovie", mo_no);
		}
		
		// 멤버정보 가져오기 
		@Override
		public List<memberVO> downMem(int mem_no) throws SQLException {
			return smc.queryForList("admin.getMem", mem_no);
		}
		//신고회원 정지시키기
		@Override
		public int updateWar(memberVO memVo) throws SQLException {
			return (Integer)smc.update("admin.singo",memVo);
		}

		//전체 공지 글 가져오기 
		@Override
		public List<noticeVO> AllNotice() throws SQLException {
			return smc.queryForList("admin.noticeList");
		}

		@Override
		public noticeVO noticeDetail(int notice_no) throws SQLException {
			return (noticeVO)smc.queryForObject("admin.noticeDetail", notice_no);
		}

		@Override
		public int getTotalCount() throws SQLException {
			return (Integer)smc.queryForObject("admin.getCount");
		}

		@Override
		public List<noticeVO> listPage(Map<String, Object> map) throws SQLException {
			return smc.queryForList("admin.listPage", map);
		}
		
		
		@Override
		public String insertNotice(noticeVO noticeVo) throws SQLException {
			return (String) smc.insert("admin.NewNotice", noticeVo);
		}
		
		//공지글 삭제
		@Override
		public int deleteNotice(int notice_no) throws SQLException {
			return (Integer)smc.delete("admin.deleteNo", notice_no);
		}
		
		//공지글 수정
		@Override
		public int updateNotice(noticeVO noVo) throws SQLException {
			return (Integer)smc.update("admin.updateNo", noVo);
		}
		
		//------콘텐츠
		
		@Override
		public List<movieVO> selectcategory(Map<String, Object> map) throws SQLException {
			return smc.queryForList("admin.selectcategory", map);
		}

		@Override
		public int getTotalCount(String category) throws SQLException {
			return (int) smc.queryForObject("admin.getTotalCount", category);
		}

		

		
		
	
	
}
