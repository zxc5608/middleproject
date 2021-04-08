package admin.service;

import java.util.List;
import java.util.Map;

import VO.memberVO;
import VO.movieVO;
import VO.noticeVO;
import VO.reportVO;
import VO.shoppayVO;

public interface IadminService {

	// 회원 정보 보기
	public List<memberVO> memList();

	// 회원정보 리스트 페이지
	// public List<memberVO> listPage(Map<String, Integer> map);

	// 전체 회원수 가져오기
	// public int totalMem();

	// 신고 회원 정보 가져오기
	public List<reportVO> singoList();

	// 결제 내역 보기 (회원권)
	public List<memberVO> payList();

	public List<shoppayVO> downList();

	// 회원 정보 가져오기
	// public memberVO getMem(int mem_no);
	public List<memberVO> downMem(int mem_no);

	// 영화 정보 가져오기
	public List<movieVO> downMovie(int mo_no);

	// 회원 신고
	public int updateWar(memberVO memVo);

	// 전체 공지 글 가져오기
	public List<noticeVO> AllNotice();
	
	public noticeVO noticeDetail(int notice_no);
	
	//전체 글 갯수 가져오기
	public int getTotalCount();
	
	//페이지별 게시글 가져오기- search 
	public List<noticeVO> listPage(Map<String, Object> map);
	
	// 공지 글 작성
	public String insertNotice(noticeVO noticeVo);
	
	// 공지 글 삭제
	public int deleteNotice(int notice_no);
	
	// 공지글 수정
	public int updateNotice(noticeVO noVo);

	// 카테고리별 상영작 출력
	public List<movieVO> selectcategory(Map<String, Object> map);

	// 카테고리별 상영작 목록 개수 가져오기
	public int getTotalCount(String category);
	
	

}
