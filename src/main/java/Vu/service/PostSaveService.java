package Vu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Post_Save;
import Vu.repository.PostSaveRepository;

@Service
public class PostSaveService {

	@Autowired
	private PostSaveRepository postSaveRepository;
	
	public boolean checkExistSave(int accId, int postId) {
		if(postSaveRepository.findPostSave(accId, postId) != null)
			return true;
		else 
			return false;
	}
	
	public Post_Save findOne( int postLikeId) {
		return postSaveRepository.findOne(postLikeId);
	}
	
	public Post_Save findOne(int accId, int postId) {
		if(postSaveRepository.findPostSave(accId, postId).size() > 0)
			return postSaveRepository.findPostSave(accId, postId).get(0);
		else 
			return null;
	}
	
	public List<Integer> findListSaved (int accId) {
		List<Integer> list = new ArrayList<>();
		for( Post_Save ps : postSaveRepository.findListSaved(accId) ) {
			list.add(ps.getPost_id());
		}
		return list;
	}
	
	public void save ( Post_Save ps ) {
		postSaveRepository.save(ps);
	}
	
	public void delete( int id ) {
		postSaveRepository.delete(id);
	}
	
}
