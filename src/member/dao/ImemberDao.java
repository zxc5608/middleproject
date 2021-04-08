package member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import VO.adminVO;
import VO.memberVO;
import VO.zzimVO;

public interface ImemberDao {

	// login
	public memberVO userloginCheck(memberVO memVo) throws SQLException;

	public adminVO adminloginCheck(adminVO adVo) throws SQLException;

	 //회원가입시 정보 넣기
	 public String insertMember(memberVO memVo)throws SQLException;
	 
	 //아이디 중복검사
	 public String getId(String mem_Id)throws SQLException;
	 
	 // 비밀번호 가져오기 
	 public String getPw(String mem_Id) throws SQLException;
	 
	 //회원정보수정 -  프로필 수정
	 public int updateProfile(memberVO memVo) throws SQLException;
	 
	 // 회원정보수정시  비밀번호 수정 
	  public int updatePw(memberVO memVo) throws SQLException;
	  
	  // 회원정보수정시  전화번호 수정 
	  public int updateTel(memberVO memVo) throws SQLException;
	  
	  // 회원정보수정시  선호도  수정 
	  public int updateLike(memberVO memVo) throws SQLException;
	 
	  //이용권 결제 
	  public int updatePay(memberVO memVo) throws SQLException;
	  
	  
	  // 회원탈퇴시 정보 삭제
	  public int deletemember(int mem_no) throws SQLException;
	  public int deleteZzim(int mem_no) throws SQLException;
	  public int deletePay(int mem_no) throws SQLException;
	  public int deleteShop(int mem_no) throws SQLException;
	  public int deleteReply(int mem_no) throws SQLException;
	  public int deleteQna(int mem_no) throws SQLException;
	  public int deleteBasket(int mem_no) throws SQLException;

	  // zzim목록 List 출력
	  public List<zzimVO> zzimList(Map<String, Object> map) throws SQLException;
	  
	  //전체 zzim목록 개수 가져오기
	  public int getTotalCount(int mem_no) throws SQLException;
	  
	  // zzim목록에서 삭제하기
	  public int deleteZzim(ArrayList<HashMap<String, String>> list) throws SQLException;

}
