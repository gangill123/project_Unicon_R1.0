package com.Unicon.domain;

public class MapVO {
    private String road_address; // 도로명 주소
    // 지번 주소

    // 기본 생성자
    public MapVO() {}

    // 매개변수가 있는 생성자
    public MapVO(String road_address) {
        this.road_address = road_address; // 필드에 올바른 값을 할당
        // 필드에 올바른 값을 할당
    }

    // Getter 및 Setter
    public String getRoad_address() {
        return road_address; // 올바른 필드 반환
    }

    public void setRoad_address(String road_address) {
        this.road_address = road_address; // 올바른 필드에 값 설정
    }

  
}