package qna.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.qnaVO;
import ibatis.config.SqlMapClientFactory;

public class QnaDaoImpl implements IqnaDao{

	private SqlMapClient smc;
	private static IqnaDao dao;
	
	private QnaDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IqnaDao getInstance() {
		if(dao == null) dao = new QnaDaoImpl();
		return dao;
	}

	
	
	
	@Override
	public List<qnaVO> listPage(Map<String, Object> map) throws SQLException {
		return smc.queryForList("qna.listPage", map);
	}

	@Override
	public int getTotalCount() throws SQLException {
		return (Integer)smc.queryForObject("qna.getTotalCount");
	}

	@Override
	public int insertqna(qnaVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)smc.insert("qna.insertqna",vo);
	}

	@Override
	public int qnaDelete(int seq) throws SQLException {
		// return client.delete("board.deleteBoard", seq);
		return smc.delete("qna.deleteqna", seq);
	}

	@Override
	public int updateQna(qnaVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("qna.uadateqna", vo);
	}

	@Override
	public int updateQnaA(qnaVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("qna.uadateqnaA", vo);
	}

}
