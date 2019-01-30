package android.spring.android.persistence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import android.spring.android.vo.Member;

@Repository
public class AndroidDAOImpl implements AndroidDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int confirmIdPwd(Map<String, String> map) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		int cnt = mapper.confirmIdPwd(map);
		return cnt;
	}

	@Override
	public Member getMemberInfo(String id) {
		AndroidDAO mapper = sqlSession.getMapper(AndroidDAO.class);
		Member m = mapper.getMemberInfo(id);
		return m;
	}

}
