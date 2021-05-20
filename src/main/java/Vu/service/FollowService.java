package Vu.service;

import java.util.ArrayList;
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
	
	public Follow findOne(int fromId, int toId) {
		if(followRepository.findFollow(fromId, toId).size() > 0)
			return followRepository.findFollow(fromId, toId).get(0);
		else 
			return null;
	}
	
	public List<Integer> findListFollowed (int accId) {
		List<Integer> list = new ArrayList<>();
		for( Follow fl : followRepository.findListFollowed(accId) ) {
			list.add(fl.getTo_account_id());
		}
		return list;
	}
	
	public void save ( Follow follow ) {
		followRepository.save(follow);
	}
	
	public void delete ( int id ) {
		followRepository.delete(id);
	}
	
}
