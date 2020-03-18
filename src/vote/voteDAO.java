package vote;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class voteDAO {
	private Connection conn;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	public voteDAO() {
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
	public int update_vote_check(String student_id) {          //투표 완료시 체크
		String query = "UPDATE member set vote_2019 = true where student_id = ?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, student_id);                                             
			pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int vote(String category,String no) {   //투표시 입후보자 정보의 득표수를 1 올리는 함수
		 try { 
			 String query = " update " + category + " set votes=votes+1 where no = ? ";
			 pstm = conn.prepareStatement(query);
			 pstm.setString(1, no);
			 pstm.executeUpdate();
			 return 1;
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		return -1;
	}
	
	public ArrayList<Vote> getvotedata(String table) {        // 입후보자 정보를 가져오는 함수
		String query = " select * from " + table + " order by no "; 
		ArrayList<Vote> list = new ArrayList<Vote>();
		try {
			pstm = conn.prepareStatement(query);
			//pstm.setString(1, no);
			rs = pstm.executeQuery();
			while(rs.next()){
				Vote bean = new Vote();
				bean.setNo(rs.getString(1));
				bean.setCandidate1(rs.getString(2));
				bean.setCandidate2(rs.getString(3));
				bean.setSlogan(rs.getString(4));
				bean.setVotes(rs.getInt(5));
				list.add(bean);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public double current_student() {   //현재 재학생수를 구하는 함수
		String query = "select count(*) as cnt from member where current_student = 1";
		try {
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getDouble(1); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public double vote_student() {     //현재 투표한 인원수를 구하는 함수
		String query = "select count(*) as cnt from member where vote_2019 = 1";
		try {
			pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getDouble(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public double college_student(String college) {           // 단과대 재학생 인원수 구하기
		String query = "select count(*) as cnt from member where college = ? AND current_student = 1";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, college);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getDouble(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public double college_vote_student(String college) {              //단과대 재학생중 투표한 인원수 구하기
		String query = "select count(*) as cnt from member where college = ? AND current_student = 1 AND vote_2019 = 1";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, college);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getDouble(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public double major_student(String major) {                        // 학부 재학생 전체 인원수 구하기
		String query = "select count(*) as cnt from member where major = ? AND current_student = 1";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, major);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getDouble(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public double major_vote_student(String major) {
		String query = "select count(*) as cnt from member where major = ? AND current_student = 1 AND vote_2019 = 1";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, major);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getDouble(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
