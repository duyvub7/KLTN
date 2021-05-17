package Vu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Follow;
import Vu.repository.FollowRepository;

@Service
public class FollowService {

	@Autowired
	private FollowRepository followRepository;
	
	public List<Follow> findAllReceive ( int id ) {
		return followRepository.findAllReceive(id);
	}
	
	public List<Follow> findAllFollow ( int id ) {
		return followRepository.findAllFollow(id);
	}
	
	public void save ( Follow follow ) {
		followRepository.save(follow);
	}
	
	public void delete ( int id ) {
		followRepository.delete(id);
	}
	
}
