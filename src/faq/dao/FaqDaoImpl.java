package faq.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.fnqVO;
import ibatis.config.SqlMapClientFactory;

public class FaqDaoImpl implements IfaqDao{
	private SqlMapClient smc;
	private static IfaqDao dao;
	
	private FaqDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IfaqDao getInstance() {
		if(dao == null) dao = new FaqDaoImpl();
		return dao;
	}

	
	
	
	@Override
	public List<fnqVO> listPage(Map<String, Object> map) throws SQLException {
		return smc.queryForList("fnq.listPage", map);
	}

	@Override
	public int getTotalCount() throws SQLException {
		return (Integer)smc.queryForObject("fnq.getTotalCount");
	}

}
