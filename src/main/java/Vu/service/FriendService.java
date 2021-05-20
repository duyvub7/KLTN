package Vu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Friend;
import Vu.repository.FriendRepository;

@Service
public class FriendService {

	@Autowired
	private FriendRepository friendRepository;
	
	public Friend findOne( int id ) {
		return friendRepository.findOne(id);
	}
	
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
	
	public Friend findOne(int accId, int postId) {
		if(friendRepository.findFriend(accId, postId).size() > 0)
			return friendRepository.findFriend(accId, postId).get(0);
		else 
			return null;
	}
	
	public List<Integer> findListFriend (int accId) {
		List<Integer> list = new ArrayList<>();
		for( Friend fl : friendRepository.findListFriend(accId) ) {
			if(fl.getFrom_account_id() == accId) {
				list.add(fl.getTo_account_id());
			}
			else
				list.add(fl.getFrom_account_id());
		}
		return list;
	}
	
	public List<Integer> findListSend (int accId) {
		List<Integer> list = new ArrayList<>();
		for( Friend fl : friendRepository.findAllSend(accId) ) {
			list.add(fl.getTo_account_id());
		}
		return list;
	}
	
	public List<Integer> findListReceive (int accId) {
		List<Integer> list = new ArrayList<>();
		for( Friend fl : friendRepository.findAllReceive(accId) ) {
			list.add(fl.getFrom_account_id());
		}
		return list;
	}
	
	public void save ( Friend friend ) {
		friendRepository.save(friend);
	}
	
	public void delete ( int id ) {
		friendRepository.delete(id);
	}
}
