package shop.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import VO.basketVO;
import VO.movieVO;

public interface IshopDao {
	// 다운로드 페이지의 영화 목록 출력
	public List<movieVO> getDownList(String category);
	
	//장바구니에 등록 - 가져오는 값 : 회원번호와 영화번호를 vo에 담아서 가져오기
	public int insertBasket(basketVO vo);
	
	//장바구니에서 삭제 - 가져오는 값 : 영화번호
	public int deleteBasket(ArrayList<HashMap<String, String>> arr);

	//전체 basket목록 개수 가져오기
	public int getTotalCount(int mem_no);
	
	//basket목록 List 출력
	public List<basketVO> basketList(Map<String, Object> map);
	
	//검색 버튼 클릭시 조회되는 영화 목록 출력
	public List<movieVO> searchList(String title);
}
