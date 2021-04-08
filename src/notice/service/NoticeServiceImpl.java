package notice.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.noticeVO;
import notice.dao.InoticeDao;
import notice.dao.NoticeDaoImpl;

public class NoticeServiceImpl implements InoticeService{
	
	private InoticeDao dao;
	private static InoticeService service;
	
	private NoticeServiceImpl() {
		dao=NoticeDaoImpl.geInstance();
	}
	
	public static InoticeService getService() {
		if(service == null) service = new NoticeServiceImpl();
		
		return service;
	}

	@Override
	public List<noticeVO> noticeList() {
		List<noticeVO> list = null;
		
		try {
			list = dao.noticeList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
		
	}

	@Override
	public noticeVO noticeDetail(int notice_no) {
		noticeVO vo = null;
		
		try {
			vo = dao.noticeDetail(notice_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return vo;
	}

	@Override
	public int getTotalCount() {
		int cnt=0;
		
		try {
			cnt = dao.getTotalCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public List<noticeVO> listPage(Map<String, Object> map) {
		List<noticeVO> list = null;
		
		try {
			list = dao.listPage(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
