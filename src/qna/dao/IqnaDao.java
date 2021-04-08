package qna.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.qnaVO;

public interface IqnaDao {
	// 페이지별 게시글 가져오기
	public List<qnaVO> listPage(Map<String, Object> map) throws SQLException;

	// 전체 글 갯수 가져오기
	public int getTotalCount() throws SQLException;
	
	// 질문추가
	public int insertqna(qnaVO vo) throws SQLException;
	
	// 삭제
	public int qnaDelete(int seq) throws SQLException;
	
	// 수정하기
	public int updateQna(qnaVO vo) throws SQLException;

	// 관리자 답변달기
	public int updateQnaA(qnaVO vo) throws SQLException;
}
