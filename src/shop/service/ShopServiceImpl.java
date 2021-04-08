package shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import VO.basketVO;
import VO.movieVO;
import shop.dao.IshopDao;
import shop.dao.ShopDaoImpl;

public class ShopServiceImpl implements IshopService{
	private IshopDao dao;
	private static ShopServiceImpl service;
	
	private ShopServiceImpl() {
		dao=ShopDaoImpl.getInstance();
	}

	public static ShopServiceImpl getInstance() {
		if(service==null) service = new ShopServiceImpl();
		return service;
	}

	@Override
	public List<movieVO> getDownList(String category) {
		return dao.getDownList(category);
	}

	@Override
	public int insertBasket(basketVO vo) {
		return dao.insertBasket(vo);
	}

	@Override
	public int deleteBasket(ArrayList<HashMap<String, String>> arr) {
		return dao.deleteBasket(arr);
	}

	@Override
	public int getTotalCount(int mem_no) {
		return dao.getTotalCount(mem_no);
	}

	@Override
	public List<basketVO> basketList(Map<String, Object> map) {
		List<basketVO> list = null;
		list = dao.basketList(map);
		return list;
	}

	@Override
	public List<movieVO> searchList(String title) {
		List<movieVO> list = null;
		list = dao.searchList(title);
		return list;
	}
	
}
