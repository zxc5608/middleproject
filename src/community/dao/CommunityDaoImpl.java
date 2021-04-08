package community.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.communityVO;
import VO.reportVO;
import ibatis.config.SqlMapClientFactory;

public class CommunityDaoImpl implements IcommunityDao{
	private  SqlMapClient  smc;
    private static IcommunityDao  dao;
    
    private CommunityDaoImpl() {
    	smc = SqlMapClientFactory.getSqlMapClient();
    }
	
    public static IcommunityDao getDao() {
    	if(dao == null) dao = new CommunityDaoImpl();
    	return dao;
    }

	@Override
	public List<communityVO> listPage(Map<String, Object> map) throws SQLException {
		return smc.queryForList("community.selectAlllist",map);
	}

	@Override
	public int getTotalCount() throws SQLException {
		return (int) smc.queryForObject("community.Count");
	}

	@Override
	public communityVO listDetail(int no) throws SQLException {
		// TODO Auto-generated method stub
		return (communityVO) smc.queryForObject("community.listDetail",no);
	}

	@Override
	public int updatecount(int no) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("community.updatecount",no);
	}

	@Override
	public int writecommunity(communityVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer) smc.insert("community.writecommunity",vo);
	}

	@Override
	public List<communityVO> searchcom(String search) throws SQLException {
		// TODO Auto-generated method stub
		return smc.queryForList("community.searchcom",search);
	}

	@Override
	public int getreportuser(int no) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer) smc.queryForObject("community.getreportuser",no);
	}

	@Override
	public String getreporteduser(int mem_no) throws SQLException {
		return (String) smc.queryForObject("community.getreporteduser",mem_no);
	}

	@Override
	public int insertreport(reportVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer) smc.insert("community.insertreport",vo);
	}

	@Override
	public int comupdate(communityVO vo) throws SQLException {
		// TODO Auto-generated method stub
		return smc.update("community.comupdate",vo);
	}

	@Override
	public List<communityVO> listAll() throws SQLException {
		return smc.queryForList("community.listAll");
	}



}
