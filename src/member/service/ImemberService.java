package member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import VO.adminVO;
import VO.memberVO;
import VO.zzimVO;

public interface ImemberService {
	
	//로그인 
	public memberVO userloginCheck(memberVO memVo);

	public adminVO adminloginCheck(adminVO adVo);
	
	//회원가입
	 public String insertMember(memberVO memVo);
	 
	// id중복체크
	public String getId(String mem_Id);

	 // 비밀번호 가져오기 
	 public String getPw(String mem_Id);
	 
	 // 회원정보수정 - 프로필
	 public int updateProfile(memberVO memVo);
	 
	 // 회원정보 수정 - 비밀번호
	 public int updatePw(memberVO memVo);
	 
	 // 회원정보 수정 - 전화번호 
	 public int updateTel(memberVO memVo);
	 
	 // 회원정보 수정 - 선호도
	 public int updateLike(memberVO memVo);
	 
	 //회원권 결제 
	 public int updatePay(memberVO memVo);
	 
	 // 회원 정보 삭제 
	  public int deletemember(int mem_no);
	  public int deleteZzim(int mem_no);
	  public int deletePay(int mem_no);
	  public int deleteShop(int mem_no);
	  public int deleteReply(int mem_no);
	  public int deleteQna(int mem_no);
	  public int deleteBasket(int mem_no);

	  // zzim목록 List 출력
	  public List<zzimVO> zzimList(Map<String, Object> map);
	  
	  //전체 zzim목록 개수 가져오기
	  public int getTotalCount(int mem_no);
	  
	  // zzim목록에서 삭제하기
	  public int deleteZzim(ArrayList<HashMap<String, String>> list);
		
}
