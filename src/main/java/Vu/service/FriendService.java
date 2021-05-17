package Vu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Friend;
import Vu.repository.FriendRepository;

@Service
public class FriendService {

	@Autowired
	private FriendRepository friendRepository;
	
	public List<Friend> findAll() {
		return friendRepository.findAll();
	}
	
	public List<Friend> findAllFriend ( int id ) {
		return friendRepository.findAllFriend(id);
	}
	
	public List<Friend> findAllReceive(int id) {
		return friendRepository.findAllReceive(id);
	}
	
	public List<Friend> findAllSend(int id) {
		return friendRepository.findAllSend(id);
	}
	
	public void save ( Friend friend ) {
		friendRepository.save(friend);
	}
	
	public void delete ( int id ) {
		friendRepository.delete(id);
	}
}
