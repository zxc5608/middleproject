package ibatis.config;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientFactory {

	// 1. iBatis의 환경 설정 파일(sqlMapConfig.xml)을 읽어와서 실행한다.
	static Reader  rd = null;
	static SqlMapClient smc;
	
 static {	
	
	try {
		// 1-1. 문자 인코딩 케릭터셋 설정하기
		Charset charset = Charset.forName("UTF-8");
		Resources.setCharset(charset);
		
		// 1-2. 환경 설정 파일을 읽어온다.
		rd = Resources.getResourceAsReader("ibatis/config/sqlMapConfig.xml");
		
		// 1-3. 위에서 읽어온 Reader객체를 이용하여 실제 환경설정을 완성한 후
		//		SQL문을 호출해서 실행할 수 있는 객체를 생성한다.
		smc = SqlMapClientBuilder.buildSqlMapClient(rd);
		
		// 환경 설정 끝...
	} catch (IOException e) {
		e.printStackTrace();
	} 
 }	
 
 	public static SqlMapClient getSqlMapClient() {
 		return smc;
 	}
 
	
}
