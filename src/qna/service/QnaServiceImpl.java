package qna.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.qnaVO;
import qna.dao.IqnaDao;
import qna.dao.QnaDaoImpl;

public class QnaServiceImpl implements IqnaService {

	
	private IqnaDao dao;
	private static IqnaService service;
	
	
	private QnaServiceImpl() {
		dao=QnaDaoImpl.getInstance();
	}
	
	public static IqnaService getService() {
		if(service == null) service = new QnaServiceImpl();
		
		return service;
	}
	
	
	
	@Override
	public List<qnaVO> listPage(Map<String, Object> map) {
		List<qnaVO> list = null;
		
		try {
			list = dao.listPage(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public int getTotalCount() {
		int cnt = 0;
		
		try {
			cnt = dao.getTotalCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int insertqna(qnaVO vo) {
		int rnum = 0;
		
		try {
			rnum = dao.insertqna(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rnum;
	}

	@Override
	public int qnaDelete(int seq) {
		int cnt = 0;
		try {
			cnt = dao.qnaDelete(seq);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int updateQna(qnaVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateQna(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateQnaA(qnaVO vo) {
		int cnt = 0;
		
		try {
			cnt = dao.updateQnaA(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	
	
	}
	
	


