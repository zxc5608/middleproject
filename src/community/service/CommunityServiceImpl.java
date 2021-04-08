package community.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.communityVO;
import VO.reportVO;
import community.dao.CommunityDaoImpl;
import community.dao.IcommunityDao;

public class CommunityServiceImpl implements IcommunityService {
	private IcommunityDao  dao;
	private static IcommunityService  service;
	
	private CommunityServiceImpl() {
		dao = CommunityDaoImpl.getDao();
	}
	
	public static IcommunityService getService() {
		if(service == null) service = new CommunityServiceImpl();
		
		return service;
	}

	@Override
	public List<communityVO> listPage(Map<String, Object> map)  {
		List<communityVO>  list = null;
		
		try {
			list = dao.listPage(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int getTotalCount()  {
		int cnt=0;
		try {
			cnt=dao.getTotalCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public communityVO listDetail(int no){
		communityVO vo = null;
		
		try {
			vo = dao.listDetail(no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public int updatecount(int no) {
		int count=0;
		
		try {
			count=dao.updatecount(no);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return count;
	}

	@Override
	public int writecommunity(communityVO vo) {
		int count=0;
		try {
			count=dao.writecommunity(vo);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return count;
	}

	@Override
	public List<communityVO> searchcom(String search) {
		List<communityVO>  list = null;
		
		try {
			list = dao.searchcom(search);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int getreportuser(int no) {
		int mem_no=0;
		try {
			mem_no=dao.getreportuser(no);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return mem_no;
	}

	@Override
	public String getreporteduser(int mem_no) {
		String memid=null;
		try {
			memid=dao.getreporteduser(mem_no);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return memid;
	}

	@Override
	public int insertreport(reportVO vo) {
		int res=0;
		try {
			res=dao.insertreport(vo);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return res;
	}

	@Override
	public int comupdate(communityVO vo) {
		int res=0;
		try {
			res=dao.comupdate(vo);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public List<communityVO> listAll() {
		List<communityVO>list = null;
		try {
			list= dao.listAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
