package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class memberDAO {
	
	private Connection conn;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	public memberDAO() {
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
	
	public int login(String student_id, String pw) {  //int 함수는 정수를반환하고 종료?
		String query = "select pw from member where student_id = ?";
		try {
			pstm = conn.prepareStatement(query);   //사전에 준비된 쿼리를 넣어준다
			pstm.setString(1, student_id);         //그런데 첫번째 물음표에는 student_id를 넣어줄꺼다
			rs = pstm.executeQuery();              //실제로 쿼리를 실행시켜 결과값을 rs에 담는다.
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {  //입력받은 pw랑 id에 맞는 pw가 일치하다면 
					return 1; //로그인 성공
				}else {
					return 0 ;//비밀번호 불일치 
				}
			}
			return -1;  //아이디가 없다 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //-2는 데이터베이스 오류를 의미한단다
	}
	
	public int join(member member){
		String query = " insert into member "
				+ " (student_id,pw,college,major,student_name,current_student,vote_2019) "
				+ " values(?,?,?,?,?,?,?) ";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, member.getStudent_id());
			pstm.setString(2, member.getPw());
			pstm.setString(3, member.getCollege());
			pstm.setString(4, member.getMajor());                        
			pstm.setString(5, member.getStudent_name());
			pstm.setBoolean(6, member.isCurrent_student());
			pstm.setBoolean(7, false);
			return pstm.executeUpdate();
		}catch(Exception e){
			System.out.println("에러났시유 : " + e);
		}
		return -1; //데이터베이스 오류
	}
	
	public String name(String student_id) {
		String query = "select student_name from member where student_id = ?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, student_id);
			rs = pstm.executeQuery();
			if(rs.next()) {                                   //연습 필요없음 
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "error";  
		
	}
	public member member(String student_id) {
		String query = "select * from member where student_id =?";
		member bean = new member();
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, student_id);
			rs = pstm.executeQuery();
			if(rs.next()){
				bean.setStudent_id(rs.getString(1));
				bean.setPw(rs.getString(2));
				bean.setCollege(rs.getString(3));                        // 학생 정보를 꺼내서 각페이지에 뿌려주는 거
				bean.setMajor(rs.getString(4));
				bean.setStudent_name(rs.getString(5));
				bean.setCurrent_student(rs.getBoolean(6));
				bean.setVote_2019(rs.getBoolean(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	
	
	
}
