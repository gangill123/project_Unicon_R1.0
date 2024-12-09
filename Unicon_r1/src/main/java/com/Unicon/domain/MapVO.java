package com.Unicon.domain;

public class MapVO {
    private String roadAddress; // 도로명 주소
    private String jibunAddress; // 지번 주소

    // 기본 생성자
    public MapVO() {}

    // 매개변수가 있는 생성자
    public MapVO(String roadAddress, String jibunAddress) {
        this.roadAddress = roadAddress;
        this.jibunAddress = jibunAddress;
    }

    // Getter 및 Setter
    public String getRoadAddress() {
        return roadAddress;
    }

    public void setRoadAddress(String roadAddress) {
        this.roadAddress = roadAddress;
    }

    public String getJibunAddress() {
        return jibunAddress;
    }

    public void setJibunAddress(String jibunAddress) {
        this.jibunAddress = jibunAddress;
    }
}