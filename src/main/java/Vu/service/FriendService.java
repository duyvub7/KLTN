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
	
	public List<Friend> findAllByReceiveId(int id) {
		return friendRepository.findAllByReceiveId(id);
	}
	
}
