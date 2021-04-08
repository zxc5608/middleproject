package seeavi.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import VO.memberVO;
import VO.movieVO;
import VO.zzimVO;
import seeavi.dao.IseeaviDao;
import seeavi.dao.SeeaviDaoImpl;

public class SeeaviServiceImpl implements IseeaviService{
	private IseeaviDao dao;
	private static IseeaviService service;
	
	private SeeaviServiceImpl() {
		dao = SeeaviDaoImpl.getInstance();
	}
	
	public static IseeaviService getInstance() {
		if(service == null) service = new SeeaviServiceImpl();
		return service;
	}

	@Override
	public List<movieVO> selectcategoryAll(String category) {
		List<movieVO> list = null;
		try {
			list = dao.selectcategoryAll(category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<movieVO> getCategory(ArrayList<HashMap<String, String>> list) {
		List<movieVO> lit = null;
		try {
			lit = dao.getCategory(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lit;
	}
	@Override
	public List<movieVO> getScoreRank() {
		List<movieVO> list = null;
		try {
			list = dao.getScoreRank();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<movieVO> getViewsRank() {
		List<movieVO> list = null;
		try {
			list = dao.getViewsRank();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<movieVO> CategetScoreRank(String category) {
		List<movieVO> list = null;
		try {
			list = dao.CategetScoreRank(category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<movieVO> CategetViewsRank(String category) {
		List<movieVO> list = null;
		try {
			list = dao.CategetViewsRank(category);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public movieVO getOneMovie(int mo_no) {
		movieVO vo = null;
		try {
			vo = dao.getOneMovie(mo_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int insertZzim(zzimVO vo) {
		int cnt = 0;
		try {
			cnt = dao.insertZzim(vo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public memberVO payWhat(int mem_no){
		memberVO vo = null;
		try {
			vo = dao.payWhat(mem_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

}
