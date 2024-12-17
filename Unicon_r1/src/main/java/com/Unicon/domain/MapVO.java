package com.Unicon.domain;

import lombok.Data;

@Data
public class MapVO {
    private int id;
    private String member_id;
    private String road_address;
    private double latitude;
    private double longitude;
    private String member_type;

    // 기본 생성자
    public MapVO() {}

    // 모든 필드를 포함하는 생성자
    public MapVO(int id, String member_id, String road_address, double latitude, double longitude, String member_type) {
        this.id = id;
        this.member_id = member_id;
        this.road_address = road_address;
        this.latitude = latitude;
        this.longitude = longitude;
        this.member_type = member_type;
    }
}
