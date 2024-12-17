package com.Unicon.persistence;

import com.Unicon.domain.MapVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class MapDAO {
    
    @Autowired
    private DataSource dataSource;

    public List<MapVO> getAllAddresses() {
        List<MapVO> addressList = new ArrayList<>();
        String sql = "SELECT id, member_id, road_address, latitude, longitude, member_type FROM _map WHERE member_type = 'inst'";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                MapVO mapVO = new MapVO();
                mapVO.setId(rs.getInt("id"));
                mapVO.setMember_id(rs.getString("member_id"));
                mapVO.setRoad_address(rs.getString("road_address"));
                mapVO.setLatitude(rs.getDouble("latitude"));
                mapVO.setLongitude(rs.getDouble("longitude"));
                mapVO.setMember_type(rs.getString("member_type"));
                addressList.add(mapVO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return addressList;
    }

    // 새로운 주소 추가 메소드
    public void addAddress(MapVO mapVO) {
        String sql = "INSERT INTO _map (member_id, road_address, latitude, longitude, member_type) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, mapVO.getMember_id());
            pstmt.setString(2, mapVO.getRoad_address());
            pstmt.setDouble(3, mapVO.getLatitude());
            pstmt.setDouble(4, mapVO.getLongitude());
            pstmt.setString(5, mapVO.getMember_type());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 주소 정보 업데이트 메소드
    public void updateAddress(MapVO mapVO) {
        String sql = "UPDATE _map SET road_address = ?, latitude = ?, longitude = ? WHERE id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, mapVO.getRoad_address());
            pstmt.setDouble(2, mapVO.getLatitude());
            pstmt.setDouble(3, mapVO.getLongitude());
            pstmt.setInt(4, mapVO.getId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
