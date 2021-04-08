package notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import VO.noticeVO;

public interface InoticeDao {
	public List<noticeVO> noticeList() throws SQLException;
	
	public noticeVO noticeDetail(int notice_no) throws SQLException;
	
	public int getTotalCount() throws SQLException;
	
	//페이지별 게시글 가져오기- search 
	public List<noticeVO> listPage(Map<String, Object> map) throws SQLException;
}
