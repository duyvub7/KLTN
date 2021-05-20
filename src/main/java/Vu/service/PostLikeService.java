package Vu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Post_Like;
import Vu.repository.PostLikeRepository;

@Service
public class PostLikeService {

	@Autowired
	private PostLikeRepository postLikeRepository;
	
	public boolean checkExistLike(int accId, int postId) {
		if(postLikeRepository.findPostLike(accId, postId) != null)
			return true;
		else 
			return false;
	}
	
	public Post_Like findOne( int postLikeId) {
		return postLikeRepository.findOne(postLikeId);
	}
	
	public Post_Like findOne(int accId, int postId) {
		if(postLikeRepository.findPostLike(accId, postId).size() > 0)
			return postLikeRepository.findPostLike(accId, postId).get(0);
		else 
			return null;
	}
	
	public List<Integer> findListLiked (int accId) {
		List<Integer> list = new ArrayList<>();
		for( Post_Like pl : postLikeRepository.findListLiked(accId) ) {
			list.add(pl.getPost_id());
		}
		return list;
	}
	
	public void save(Post_Like pl) {
		postLikeRepository.save(pl);
	}
	
	public void delete(int id) {
		postLikeRepository.delete(id);
	}
	
}
