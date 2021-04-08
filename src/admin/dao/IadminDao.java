package admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.adminVO;
import VO.memberVO;
import VO.movieVO;
import VO.noticeVO;
import VO.reportVO;
import VO.shoppayVO;

public interface IadminDao {

	// 회원 정보 보기
	public List<memberVO> memList() throws SQLException;

	// //회원 정보 페이지
	// public List<memberVO> listPage(Map<String, Integer>map) throws SQLException;
	//
	// // 전체 회원수 조회
	// public int totalMem () throws SQLException;

	// 신고 회원 정보 보기
	public List<reportVO> singoList() throws SQLException;

	// 결제 내역 보기 (회원권)
	public List<memberVO> payList() throws SQLException;

	public List<shoppayVO> downList() throws SQLException;

	// 아이디 가져오기
	// public memberVO getMem(int mem_no) throws SQLException;
	public List<memberVO> downMem(int mem_no) throws SQLException;

	// 영화 정보 가져오기
	public List<movieVO> downMovie(int mo_no) throws SQLException;

	// 정지 하기
	public int updateWar(memberVO memVo) throws SQLException;

	// 전체 공지 글 가져오기
	public List<noticeVO> AllNotice() throws SQLException;

	public noticeVO noticeDetail(int notice_no) throws SQLException;

	public int getTotalCount() throws SQLException;

	// 페이지별 게시글 가져오기
	public List<noticeVO> listPage(Map<String, Object> map) throws SQLException;

	// 공지글 작성
	public String insertNotice(noticeVO noticeVo) throws SQLException;

	// 공지글 수정
	 public int updateNotice(noticeVO noVo) throws SQLException;
	
	//공지글 삭제
	 public int deleteNotice(int notice_no) throws SQLException;

	// ------콘텐츠
	// 카테고리별 상영작 출력
	public List<movieVO> selectcategory(Map<String, Object> map) throws SQLException;

	// 카테고리별 상영작 목록 개수 가져오기
	public int getTotalCount(String category) throws SQLException;

}
