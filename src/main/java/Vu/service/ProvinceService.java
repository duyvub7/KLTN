package Vu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Province;
import Vu.repository.ProvinceRepository;

@Service
public class ProvinceService {

	@Autowired
	private ProvinceRepository provinceRepository;
	
	public Province findOne( int id ) {
		return provinceRepository.findOne(id);
	}
	
	public List<Province> findAll() {
		return provinceRepository.findAll();
	}
	
}
