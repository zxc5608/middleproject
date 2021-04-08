package qna.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.qnaVO;

public interface IqnaService {
	// 페이지별 게시글 가져오기
		public List<qnaVO> listPage(Map<String, Object> map);

		// 전체 글 갯수 가져오기
		public int getTotalCount();
		
		// 질문추가
		public int insertqna(qnaVO vo);

		// 삭제하기
		public int qnaDelete(int seq);

		// 수정하기
		public int updateQna(qnaVO vo);

		// 관리자 답변
		public int updateQnaA(qnaVO vo);
}
