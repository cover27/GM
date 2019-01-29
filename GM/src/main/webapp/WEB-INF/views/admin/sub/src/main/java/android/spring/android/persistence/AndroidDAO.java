package android.spring.android.persistence;

import java.util.Map;

import android.spring.android.vo.Member;

public interface AndroidDAO {

	public int confirmIdPwd(Map<String, String> map);

	public Member getMemberInfo(String id);
}
