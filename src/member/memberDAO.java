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
			e.printStackTrace();  //������ �߻��� printStackTrace����
		}
	}
	
	public int login(String student_id, String pw) {  //int �Լ��� ��������ȯ�ϰ� ����?
		String query = "select pw from member where student_id = ?";
		try {
			pstm = conn.prepareStatement(query);   //������ �غ�� ������ �־��ش�
			pstm.setString(1, student_id);         //�׷��� ù��° ����ǥ���� student_id�� �־��ٲ���
			rs = pstm.executeQuery();              //������ ������ ������� ������� rs�� ��´�.
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {  //�Է¹��� pw�� id�� �´� pw�� ��ġ�ϴٸ� 
					return 1; //�α��� ����
				}else {
					return 0 ;//��й�ȣ ����ġ 
				}
			}
			return -1;  //���̵� ���� 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //-2�� �����ͺ��̽� ������ �ǹ��Ѵܴ�
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
			System.out.println("���������� : " + e);
		}
		return -1; //�����ͺ��̽� ����
	}
	
	public String name(String student_id) {
		String query = "select student_name from member where student_id = ?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, student_id);
			rs = pstm.executeQuery();
			if(rs.next()) {                                   //���� �ʿ���� 
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
				bean.setCollege(rs.getString(3));                        // �л� ������ ������ ���������� �ѷ��ִ� ��
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
