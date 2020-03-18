package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class noticeDAO {

	private Connection conn;
	private ResultSet rs;
	
	public noticeDAO() {
		try {
			String url = "jdbc:mysql://localhost/lee5031207?useUnicode=true&characterEncoding=UTF-8";
			String db_user = "lee5031207";
			String db_password = "dltjddnr1207!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, db_user, db_password);
		}catch (Exception e){
			e.printStackTrace();  //오류가 발생시 printStackTrace실행
		}
	}
	
	public String getdate(){
		String query = "SELECT NOW()";
		try {
			PreparedStatement pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			if(rs.next()) {
				rs.getString(1);              //////현재 시간을 sql문으로 얻어오는 함수 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
	
	
	public ArrayList<Notice> list() {
		String query = "select * from notice";
		ArrayList<Notice> list = new ArrayList<Notice>(); 
		try {
			PreparedStatement pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			while(rs.next()) {
				Notice notice = new Notice();
				notice.setNotice_id(rs.getInt(1));
				notice.setSubject(rs.getString(2));
				notice.setUser_id(rs.getString(3));
				notice.setName(rs.getString(4));
				notice.setStory(rs.getString(5));
				notice.setFile01(rs.getString(6));
				notice.setRegdate(rs.getString(7));
				list.add(notice);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
}
