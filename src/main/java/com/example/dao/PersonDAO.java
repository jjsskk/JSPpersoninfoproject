package com.example.dao;

import com.example.bean.PersonVO;
import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class PersonDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String PERSON_INSERT = "insert into private_info (id, name, pwd, phone_num, address, gender, hobby_movie, hobby_health,hobby_sew, major, birth, content,photo) " +
            "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
    private final String PERSON_UPDATE = "update private_info set id=? ,name=?, pwd=?, phone_num=?,address=?, gender=?, hobby_movie=?,  hobby_health=?,hobby_sew=?, major=?, birth=?, content=?,photo=? where seq=?";
    private final String PERSON_DELETE = "delete from private_info  where seq=?";
    private final String PERSON_GET = "select * from private_info  where seq=?";
    private final String PERSON_LIST = "select * from private_info order by seq desc";

    public int insertPerson(PersonVO vo) {
        System.out.println("===> JDBC로 insertPerson() 기능 처리");
        int result=0;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(PERSON_INSERT);
            stmt.setString(1, vo.getId());
            stmt.setString(2, vo.getName());
            stmt.setString(3, vo.getPwd());
            stmt.setString(4, vo.getPhone_num());
            stmt.setString(5, vo.getAddress());
            stmt.setString(6, vo.getGender());
            stmt.setInt(7, vo.getHobby_movie());
            stmt.setInt(8, vo.getHobby_health());
            stmt.setInt(9, vo.getHobby_sew());
            stmt.setString(10, vo.getMajor());
            stmt.setString(11, vo.getBirth());
            stmt.setString(12, vo.getContent());
            stmt.setString(13,vo.getPhoto());
           result = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 글 삭제
    public int deletePerson(PersonVO vo) {
        System.out.println("===> JDBC로 deletePerson() 기능 처리");
        int result=0;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(PERSON_DELETE);
            stmt.setInt(1, vo.getSeq());
            result=stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int updatePerson(PersonVO vo) {
        System.out.println("===> JDBC로 updatePerson() 기능 처리");
        int result=0;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(PERSON_UPDATE);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getPwd());
			stmt.setString(4, vo.getPhone_num());
			stmt.setString(5, vo.getAddress());
			stmt.setString(6, vo.getGender());
			stmt.setInt(7, vo.getHobby_movie());
			stmt.setInt(8, vo.getHobby_health());
			stmt.setInt(9, vo.getHobby_sew());
			stmt.setString(10, vo.getMajor());
			stmt.setString(11, vo.getBirth());
			stmt.setString(12, vo.getContent());
            stmt.setString(13,vo.getPhoto());
            stmt.setInt(14, vo.getSeq());


            System.out.println(vo.getId() + "-" + vo.getName() + "-" + vo.getPwd() + "-" + vo.getPhone_num() + "-" +
                    vo.getAddress());
            result=stmt.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public PersonVO getPerson(int seq) {
        PersonVO one = new PersonVO();
        System.out.println("===> JDBC로 getPerson() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(PERSON_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if (rs.next()) {
                one.setSeq(rs.getInt("seq"));
                one.setId(rs.getString("id"));
                one.setName(rs.getString("name"));
                one.setPwd(rs.getString("pwd"));
                one.setPhone_num(rs.getString("phone_num"));
                one.setAddress(rs.getString("address"));
                one.setGender(rs.getString("gender"));
                one.setHobby_movie(rs.getInt("hobby_movie"));
                one.setHobby_health(rs.getInt("hobby_health"));
                one.setHobby_sew(rs.getInt("hobby_sew"));
                one.setMajor(rs.getString("major"));
                one.setBirth(rs.getString("birth"));
                one.setContent(rs.getString("content"));
                one.setPhoto(rs.getString("photo"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<PersonVO> getPersonList() {
        List<PersonVO> list = new ArrayList<PersonVO>();
        System.out.println("===> JDBC로 getPersonList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(PERSON_LIST);
            rs = stmt.executeQuery();
            while (rs.next()) {
                PersonVO one = new PersonVO();
                one.setSeq(rs.getInt("seq"));
                one.setId(rs.getString("id"));
                one.setName(rs.getString("name"));
                one.setPwd(rs.getString("pwd"));
                one.setPhone_num(rs.getString("phone_num"));
                one.setAddress(rs.getString("address"));
                one.setGender(rs.getString("gender"));
                one.setHobby_movie(rs.getInt("hobby_movie"));
                one.setHobby_health(rs.getInt("hobby_health"));
                one.setHobby_sew(rs.getInt("hobby_sew"));
                one.setMajor(rs.getString("major"));
                one.setBirth(rs.getString("birth"));
                one.setContent(rs.getString("content"));
                one.setPhoto(rs.getString("photo"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getPhotoFilename(int seq){
        String filename = null;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(PERSON_GET);
            stmt.setInt(1,seq);
            rs=stmt.executeQuery();
            if(rs.next()){
                filename=rs.getString("photo");
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("==> JDBC로 getphotoFilename() 기능 처리");
        return filename;
    }

}
