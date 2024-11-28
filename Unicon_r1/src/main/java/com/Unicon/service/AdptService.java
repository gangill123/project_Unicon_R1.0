package com.Unicon.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.persistence.AdptDAO;

import lombok.extern.log4j.Log4j2;


@Service("AdptService")
@Log4j2
public class AdptService {
	
	@Inject
	private AdptDAO aDAO;
	
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void animalInsert(AnimalVO avo) {
		log.info("( •̀ ω •́ )✧ adptInsert() 실행");
		aDAO.animalInsert(avo);
	}

}
