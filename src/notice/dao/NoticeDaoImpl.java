package notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.noticeVO;
import ibatis.config.SqlMapClientFactory;

public class NoticeDaoImpl implements InoticeDao{
	private SqlMapClient smc;
	private static InoticeDao dao;
	
	private NoticeDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static InoticeDao geInstance() {
		if(dao == null) dao = new NoticeDaoImpl();
		return dao;
	}

	@Override
	public List<noticeVO> noticeList() throws SQLException {
		
		return smc.queryForList("notice.noticeList");
	}

	@Override
	public noticeVO noticeDetail(int notice_no) throws SQLException {
		return (noticeVO)smc.queryForObject("notice.noticeDetail", notice_no);
	}

	@Override
	public int getTotalCount() throws SQLException {
		return (Integer)smc.queryForObject("notice.getTotalCount");
	}

	@Override
	public List<noticeVO> listPage(Map<String, Object> map) throws SQLException {
		return smc.queryForList("notice.listPage", map);
	}

}
