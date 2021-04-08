package seeavi.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.memberVO;
import VO.movieVO;
import VO.zzimVO;
import ibatis.config.SqlMapClientFactory;

public class SeeaviDaoImpl implements IseeaviDao{
	private SqlMapClient smc;
	private static IseeaviDao dao;
	
	private SeeaviDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IseeaviDao getInstance() {
		if(dao == null) dao = new SeeaviDaoImpl();
		return dao;
	}
	
	@Override
	public List<movieVO> selectcategoryAll(String category) throws SQLException{
		return smc.queryForList("movie.selectcategoryAll", category);
	}
	@Override
	public List<movieVO> getCategory(ArrayList<HashMap<String, String>> list) throws SQLException {
		return smc.queryForList("movie.getCategory", list);
	}
	@Override
	public List<movieVO> getScoreRank() throws SQLException {
		return smc.queryForList("movie.getScoreRank");
	}
	@Override
	public List<movieVO> getViewsRank() throws SQLException {
		return smc.queryForList("movie.getViewsRank");
	}

	@Override
	public List<movieVO> CategetScoreRank(String category) throws SQLException {
		return smc.queryForList("movie.CategetScoreRank", category);
	}

	@Override
	public List<movieVO> CategetViewsRank(String category) throws SQLException {
		return smc.queryForList("movie.CategetViewsRank", category);
	}

	@Override
	public movieVO getOneMovie(int mo_no) throws SQLException {
		return (movieVO) smc.queryForObject("movie.getOneMovie", mo_no);
	}

	@Override
	public int insertZzim(zzimVO vo) throws SQLException {
		return (int)smc.insert("movie.insertZzim", vo);
	}

	@Override
	public memberVO payWhat(int mem_no) throws SQLException {
		return (memberVO) smc.queryForObject("movie.payWhat", mem_no);
	}
	
}
