package com.Unicon.service;

public interface volEmailService {
	void sendVolunteerStatusEmail(String to, String status, String voTitle, String rejectReason);
}
