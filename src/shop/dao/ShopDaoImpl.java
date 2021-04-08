package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.basketVO;
import VO.movieVO;
import ibatis.config.SqlMapClientFactory;

public class ShopDaoImpl implements IshopDao{
	private SqlMapClient smc;
	private static ShopDaoImpl dao;
	private ShopDaoImpl() {
		
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	public static ShopDaoImpl getInstance() {
		if(dao==null) dao = new ShopDaoImpl();
		return dao;
	}
	
	@Override
	public List<movieVO> getDownList(String category) {
		List<movieVO> list= null;
		try {
			list=smc.queryForList("movie.getDownList", category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int insertBasket(basketVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("basket.insertBasket", vo);
			if(obj == null) cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public int deleteBasket(ArrayList<HashMap<String, String>> arr) {
		int cnt = 0;
		try {
			cnt = smc.delete("basket.deleteBasket", arr);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public int getTotalCount(int mem_no) {
		int cnt = 0;
		try {
			cnt = (Integer) smc.queryForObject("basket.getTotalCount", mem_no);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<basketVO> basketList(Map<String, Object> map) {
		List<basketVO> list = null;
		try {
			list = smc.queryForList("basket.basketList", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<movieVO> searchList(String title) {
		List<movieVO> list = null;
		try {
			list = smc.queryForList("movie.searchList", title);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
