package faq.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.fnqVO;
import faq.dao.FaqDaoImpl;
import faq.dao.IfaqDao;

public class FaqServiceImpl implements IfaqService{

	private IfaqDao dao;
	private static IfaqService service;
	
	private FaqServiceImpl() {
		dao=FaqDaoImpl.getInstance();
	}
	
	public static IfaqService getService() {
		if(service == null) service = new FaqServiceImpl();
		
		return service;
	}


	
	@Override
	public List<fnqVO> listPage(Map<String, Object> map) {
		List<fnqVO> list = null;
		
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

}
