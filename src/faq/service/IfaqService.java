package faq.service;

import java.util.List;
import java.util.Map;

import VO.fnqVO;

public interface IfaqService {

	
			//페이지별 게시글 가져오기 
			public List<fnqVO> listPage(Map<String, Object> map);
			
			//전체 글 갯수 가져오기 
			public int getTotalCount();
	
}
