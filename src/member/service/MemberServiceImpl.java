package member.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import VO.adminVO;
import VO.memberVO;
import VO.zzimVO;
import member.dao.ImemberDao;
import member.dao.MemberDaoImpl;

public class MemberServiceImpl implements ImemberService {
	private ImemberDao dao;
	private static MemberServiceImpl service;

	private MemberServiceImpl() {

		dao = MemberDaoImpl.getInstance();
	}

	public static MemberServiceImpl getInstance() {
		if (service == null)
			service = new MemberServiceImpl();
		return service;
	}

	//로그인 
	@Override
	public memberVO userloginCheck(memberVO memVo) {
		memberVO vo = null;

		try {
			vo = dao.userloginCheck(memVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}

	@Override
	public adminVO adminloginCheck(adminVO adVo) {
		adminVO vo = null;

		try {
			vo = dao.adminloginCheck(adVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}

	//회원가입 
	@Override
	public String insertMember(memberVO memVo) {
		String res = null; 
		 try {
			res = dao.insertMember(memVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	//id 중복체크
	@Override
	public String getId(String mem_Id) {
		String resId = null;
		try {
			resId = dao.getId(mem_Id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resId;
	}

	//비밀번호 가져오기 (비밀번호 변경시 확인)
	@Override
	public String getPw(String mem_Id) {
		String res = null;
		try {
			res = dao.getPw(mem_Id);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return res;
	}

	// 회원정보수정 - 프로필
	@Override
	public int updateProfile(memberVO memVo) {
		int cnt = 0;
		try {
			cnt = dao.updateProfile(memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	// 회원정보수정 - 비밀번호

	@Override
	public int updatePw(memberVO memVo) {
		int cnt = 0;
		try {
			cnt = dao.updatePw(memVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	// 회원정보수정 - 전화번호
	@Override
	public int updateTel(memberVO memVo) {
		int cnt = 0;
		try {
			cnt = dao.updateTel(memVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	// 회원정보수정 - 선호도 
	@Override
	public int updateLike(memberVO memVo) {
		int cnt = 0;
		try {
			cnt = dao.updateLike(memVo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	// 회원 정보 삭제 
	@Override
	public int deletemember(int mem_no) {
		int cnt = 0;
		try {
			cnt = dao.deletemember(mem_no);
		} catch (Exception e) {
			cnt =0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteZzim(int mem_no) {
		int cnt = 0;
		try {
			cnt = dao.deleteZzim(mem_no);
		} catch (Exception e) {
			cnt =0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deletePay(int mem_no) {
		int cnt = 0;
		try {
			cnt = dao.deletePay(mem_no);
		} catch (Exception e) {
			cnt =0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteShop(int mem_no) {
		int cnt = 0;
		try {
			cnt = dao.deleteShop(mem_no);
		} catch (Exception e) {
			cnt =0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteReply(int mem_no) {
		int cnt = 0;
		try {
			cnt = dao.deleteReply(mem_no);
		} catch (Exception e) {
			cnt =0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteQna(int mem_no) {
		int cnt = 0;
		try {
			cnt = dao.deleteQna(mem_no);
		} catch (Exception e) {
			cnt =0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteBasket(int mem_no) {
		int cnt = 0;
		try {
			cnt = dao.deleteBasket(mem_no);
		} catch (Exception e) {
			cnt =0;
			e.printStackTrace();
		}
		return cnt;
	}
	
	// zzim목록 List 출력
		@Override
		public List<zzimVO> zzimList(Map<String, Object> map) {
			List<zzimVO> list = null;
			try {
				list = dao.zzimList(map);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}

		@Override
		public int getTotalCount(int mem_no) {
			int cnt = 0;
			try {
				cnt = dao.getTotalCount(mem_no);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;
		}

		@Override
		public int deleteZzim(ArrayList<HashMap<String, String>> list){
			int cnt = 0;
			try {
				cnt = dao.deleteZzim(list);
			} catch (SQLException e) {
				cnt = 0;
				e.printStackTrace();
			}
			return cnt;
		}

		//회원권 결제 
		@Override
		public int updatePay(memberVO memVo) {
			int cnt = 0;
			try {
				cnt = dao.updatePay(memVo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cnt;
		}
		

	
	
}