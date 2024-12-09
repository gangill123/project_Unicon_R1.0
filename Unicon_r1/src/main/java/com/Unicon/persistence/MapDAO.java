package com.Unicon.persistence;

import com.Unicon.domain.MapVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MapDAO {
    
    // 데이터베이스 연결 정보
    private String dbUrl = "jdbc:mysql://itwillbs.com:3306/teamproject1";
    private String dbUser = "c6d2406t1";
    private String dbPassword = "1234";

    public List<MapVO> getAllAddresses() {
        List<MapVO> addressList = new ArrayList<>();
        
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
             PreparedStatement pstmt = conn.prepareStatement("SELECT road_address, detail_address FROM member");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String roadAddress = rs.getString("road_address");
                String jibunAddress = rs.getString("detail_address"); // 지번 주소가 detail_address라고 가정
                addressList.add(new MapVO(roadAddress, jibunAddress));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return addressList;
    }
}