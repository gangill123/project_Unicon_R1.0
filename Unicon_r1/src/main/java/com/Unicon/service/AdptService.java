package com.Unicon.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.persistence.AdptDAO;

import lombok.extern.log4j.Log4j2;


@Service("AdptService")
public class AdptService {
	
	@Inject
	private AdptDAO aDAO;
	private static final Logger logger = LoggerFactory.getLogger(AdptService.class);

	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void animalInsert(AnimalVO avo) {
		logger.info("( •̀ ω •́ )✧ adptInsert() 실행");
		aDAO.animalInsert(avo);
	}

}
