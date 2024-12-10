package com.Unicon.service;

public interface VolEmailService {
	void sendVolunteerStatusEmail(String to, String status, String voTitle, String rejectReason);
}
