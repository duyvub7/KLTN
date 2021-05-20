package Vu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import Vu.model.Province;

@Repository
public interface ProvinceRepository extends JpaRepository<Province, Integer> {
	
	
}
