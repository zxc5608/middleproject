package notice.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.noticeVO;

public interface InoticeService {
	public List<noticeVO> noticeList();
	
	public noticeVO noticeDetail(int notice_no);
	
	//전체 글 갯수 가져오기
	public int getTotalCount();
	
	//페이지별 게시글 가져오기- search 
	public List<noticeVO> listPage(Map<String, Object> map);
}
