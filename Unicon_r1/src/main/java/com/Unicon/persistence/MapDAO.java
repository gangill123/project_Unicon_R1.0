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
        String sql = "SELECT road_address FROM _member";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                addressList.add(new MapVO(rs.getString("road_address")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return addressList;
    }
}