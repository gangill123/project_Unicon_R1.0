package com.Unicon.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.PetAdoptionVO;

@Repository
public class PetAdoptionDAO {
    @Autowired
    private SqlSession sqlSession;
    
    public List<PetAdoptionVO> findByAnimalTypes(List<String> animalTypes) {
        return sqlSession.selectList("PetAdoption.findByAnimalTypes", animalTypes);
    }

    public PetAdoptionVO getAdoptionByAdptAi(int adpt_ai) {
        return sqlSession.selectOne("PetAdoption.getAdoptionByAdptAi", adpt_ai);
    }
}
