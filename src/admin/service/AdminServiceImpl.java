package admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.memberVO;
import VO.movieVO;
import VO.noticeVO;
import VO.reportVO;
import VO.shoppayVO;
import admin.dao.AdminDaoImpl;
import admin.dao.IadminDao;

public class AdminServiceImpl implements IadminService {

	private IadminDao dao;
	public static AdminServiceImpl service;

	private AdminServiceImpl() {
		dao = AdminDaoImpl.getInstance();
	}

	public static AdminServiceImpl getInstance() {
		if (service == null)
			service = new AdminServiceImpl();
		return service;

	}

	// 회원 정보 가져오기
	@Override
	public List<memberVO> memList() {
		List<memberVO> list = null;
		try {
			list = dao.memList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 신고회원정보 가져오기
	@Override
	public List<reportVO> singoList() {
		List<reportVO> list = null;
		try {
			list = dao.singoList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 결제 내역 보기 (회원권)
	@Override
	public List<memberVO> payList() {
		List<memberVO> list = null;
		try {
			list = dao.payList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 결제 내역 보기 (다운로드)
	@Override
	public List<shoppayVO> downList() {
		List<shoppayVO> list = null;
		try {
			list = dao.downList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 회원 정보 가져오기
	@Override
	// public memberVO getMem(int mem_no) {
	public List<memberVO> downMem(int mem_no) {
		List<memberVO> list = null;
		try {
			list = dao.downMem(mem_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 영화 정보 가져오기
	@Override
	public List<movieVO> downMovie(int mo_no) {
		List<movieVO> list = null;
		try {
			list = dao.downMovie(mo_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 회원 신고하기
	@Override
	public int updateWar(memberVO memVo) {
		int cnt = 0;
		try {
			cnt = dao.updateWar(memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// 공지사항 글 가져오기
	@Override
	public List<noticeVO> AllNotice() {
		List<noticeVO> list = null;
		try {
			list = dao.AllNotice();
		} catch (SQLException e) {
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
		int cnt = 0;

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

	// 공지사항 작성
	@Override
	public String insertNotice(noticeVO noticeVo) {
		String res = null;
		try {
			res = dao.insertNotice(noticeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

	// 공지 글 삭제
	@Override
	public int deleteNotice(int notice_no) {
		int cnt = 0;

		try {
			cnt = dao.deleteNotice(notice_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return cnt;
	}

	// 공지 글 수정
	@Override
	public int updateNotice(noticeVO noVo) {
		int cnt = 0;
		try {
			cnt = dao.updateNotice(noVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cnt;
	}

	// -----콘텐츠 관리
	@Override
	public List<movieVO> selectcategory(Map<String, Object> map) {
		List<movieVO> list = null;
		try {
			list = dao.selectcategory(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getTotalCount(String category) {
		int cnt = 0;
		try {
			cnt = dao.getTotalCount(category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
