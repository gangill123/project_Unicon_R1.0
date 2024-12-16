package com.Unicon.service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.Unicon.domain.PetAdoptionVO;
import com.Unicon.persistence.PetAdoptionDAO;

@Service
public class PetAdoptionService {
    private static final Logger logger = LoggerFactory.getLogger(PetAdoptionService.class);

    @Autowired
    private PetAdoptionDAO petAdoptionDAO;
    
    public List<PetAdoptionVO> findByAnimalTypes(List<String> animalTypes) {
        logger.info("Finding adoptions for animal types: {}", animalTypes);
        List<PetAdoptionVO> adoptions = petAdoptionDAO.findByAnimalTypes(animalTypes);
        logger.info("Found {} matching adoptions", adoptions.size());
        return adoptions;
    }

    public PetAdoptionVO getAdoptionByAdptAi(int adpt_ai) {
        logger.info("Finding adoption for adpt_ai: {}", adpt_ai);
        PetAdoptionVO adoption = petAdoptionDAO.getAdoptionByAdptAi(adpt_ai);
        if (adoption != null) {
            logger.info("Found adoption with adpt_ai: {}", adpt_ai);
        } else {
            logger.info("No adoption found with adpt_ai: {}", adpt_ai);
        }
        return adoption;
    }
}
