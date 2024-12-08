package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AddressVO {

	private int address_id;
	private String member_id;
	private String is_default_address;
	private String address_name;
	private String postal_code;
	private String road_address;
	private String detail_address;
	private String extra_address;
	private String recipient;
	private String recipient_phone;
	private Timestamp create_date;
	private Timestamp update_date;
	
}
