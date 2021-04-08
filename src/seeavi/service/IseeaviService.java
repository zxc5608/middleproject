package seeavi.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import VO.memberVO;
import VO.movieVO;
import VO.zzimVO;

public interface IseeaviService {
	public List<movieVO> selectcategoryAll(String category);
	
	// 메인페이지 선호 카테고리별 추천영화 리스트 
	public List<movieVO> getCategory(ArrayList<HashMap<String, String>> list);
	
	//평점별 순위 1~10위 리스트
	public List<movieVO> getScoreRank();
	
	//조회수별 순위 1~10위 리스트
	public List<movieVO> getViewsRank();
	
	// 카테고리별 평점별 순위 1~10위
	public List<movieVO> CategetScoreRank(String category);
	
	// 카테고리별 조회수별 순위 1~10위
	public List<movieVO> CategetViewsRank(String category);
	
	// 하나의 영화정보들 출력하기
	public movieVO getOneMovie(int mo_no);
	
	//상세보기 페이지의 찜하기 클릭시 찜에 인서트하기
	public int insertZzim(zzimVO vo);
	
	//상세보기 페이지 재생 버튼 클릭시 회원의 결제여부 판단
	public memberVO payWhat(int mem_no);
}
