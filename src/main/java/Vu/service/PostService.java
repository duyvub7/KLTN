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
	
	public List<Post> findAll( int type) {
		return postRepository.findAll(type);
	}
	
	public List<Post> findTopPost( int type) {
		return postRepository.findAll(type);
	}
	
	public List<Post> findByAccountId( int id ) {
		return postRepository.findByAccountId(id);
	}

	public List<Post> findByAccountId( int id, int type) {
		return postRepository.findByAccountId(id, type);
	}
	
	public List<Post> findAllSavePost ( int id ) {
		return postRepository.findAllSavePost(id);
	}
	
	public List<Post> findAllSavePost ( int id, int type ) {
		return postRepository.findAllSavePost(id, type);
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
