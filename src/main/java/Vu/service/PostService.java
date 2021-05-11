package Vu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Post;
import Vu.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	public List<Post> findAllReviewPost() {
		return postRepository.findAllReviewPost();
	}
	
	public List<Post> findAllEmptyRoom() {
		return postRepository.findAllEmptyRoom();
	}
	
	public List<Post> findAllShareRoom() {
		return postRepository.findAllShareRoom();
	}
	
	public List<Post> findAllUtensilPost() {
		return postRepository.findAllUtensilPost();
	}
	
	public int getLastPostId() {
		return postRepository.findAll().get(postRepository.findAll().size()-1).getPost_id();
	}
	
	public void save(Post post) {
		postRepository.save(post);
	}
	
	public void delete(int id) {
		postRepository.delete(id);
	}
}
