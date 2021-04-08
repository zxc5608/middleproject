package member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import VO.adminVO;
import VO.memberVO;
import VO.zzimVO;
import ibatis.config.SqlMapClientFactory;

public class MemberDaoImpl implements ImemberDao {
	private SqlMapClient smc;
	private static MemberDaoImpl dao;

	private MemberDaoImpl() {
		
		smc = SqlMapClientFactory.getSqlMapClient();
	}

	public static MemberDaoImpl getInstance() {
		if (dao == null)
			dao = new MemberDaoImpl();
		return dao;
	}

	//사용자 로그인 
	@Override
	public memberVO userloginCheck(memberVO memVo) {
		memberVO vo = null;

		try {
			vo = (memberVO) smc.queryForObject("member.userloginCk", memVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			vo = null;
			e.printStackTrace();
		}
		return vo;
	}

	//관리자 로그인 
	@Override
	public adminVO adminloginCheck(adminVO adVo) {
		adminVO vo = null;

		try {
			vo = (adminVO) smc.queryForObject("member.adminloginCk", adVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			vo = null;
			e.printStackTrace();
		}
		return vo;
	}
	
	
	//회원가입 정보 입력 
	@Override
	public String insertMember(memberVO memVo) throws SQLException {
		return (String) smc.insert("member.insertMember",memVo);
		}

	//id중복체크

	@Override
	public String getId(String mem_Id)throws SQLException{
		return (String) smc.queryForObject("member.getId",mem_Id);
	}

	// 비밀번호 가져오기
	@Override
//	public String getPw(memberVO memVo) throws SQLException {
		public String getPw(String mem_Id) throws SQLException {
		// TODO Auto-generated method stub
		return (String) smc.queryForObject("member.getPass",mem_Id);
	}

	// 회원 정보 수정  - 프로필 수정 
	@Override
	public int updateProfile(memberVO memVo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)smc.update("member.updateProfile", memVo);
	}

	
	// 회원정보 수정 - 비밀번호 수정 
	@Override
	public int updatePw(memberVO memVo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer) smc.update("member.updatePw", memVo);
	}

	// 회원정보 수정 - 전화번호 수정 
	@Override
	public int updateTel(memberVO memVo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)smc.update("member.updateTel", memVo);
	}

	// 회원정보 수정 - 선호도  수정 
	@Override
	public int updateLike(memberVO memVo) throws SQLException {
		// TODO Auto-generated method stub
		return (Integer)smc.update("member.updateLike", memVo);
	}

	//회원 정보 삭제 
	@Override
	public int deletemember(int mem_no) throws SQLException {
		return (Integer)smc.delete("member.deleteMem", mem_no);
	}

	@Override
	public int deleteZzim(int mem_no) throws SQLException {
		return  (Integer)smc.delete("member.deleteZzim", mem_no);
	}

	@Override
	public int deletePay(int mem_no) throws SQLException {
		return (Integer)smc.delete("member.deletePay", mem_no);
	}

	@Override
	public int deleteShop(int mem_no) throws SQLException {
		return (Integer)smc.delete("member.deleteShop", mem_no);
	}

	@Override
	public int deleteReply(int mem_no) throws SQLException {
		return (Integer)smc.delete("member.deleteReply", mem_no);
	}

	@Override
	public int deleteQna(int mem_no) throws SQLException {
		return (Integer)smc.delete("member.deleteqna", mem_no);
	}

	@Override
	public int deleteBasket(int mem_no) throws SQLException {
		return (Integer)smc.delete("member.deletebasket", mem_no);
	}
	
	// zzim목록 List 출력
		@Override
		public List<zzimVO> zzimList(Map<String, Object> map) throws SQLException {
			return smc.queryForList("zzim.zzimList", map);
		}
		
		//전체 zzim목록 개수 가져오기
		@Override
		public int getTotalCount(int mem_no) throws SQLException {
			return (Integer) smc.queryForObject("zzim.getTotalCount", mem_no);
		}

		@Override
		public int deleteZzim(ArrayList<HashMap<String, String>> list) throws SQLException {
			return smc.delete("zzim.deleteZzim", list);
		}

		
		//회원권 결제 
		@Override
		public int updatePay(memberVO memVo) throws SQLException {
			return smc.update("member.updatePay", memVo);
		}

	
	
	

	
	
	
}
