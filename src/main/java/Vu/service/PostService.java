package Vu.service;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Post;
import Vu.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	public Post findOne( int id ) {
		return postRepository.findOne(id);
	}
	
	public List<Post> findAll(){
		return postRepository.findAll();
	}
	
	public List<Post> findAll( int type) {
		return postRepository.findAll(type);
	}
	
	public List<Post> findAll( int type, int provinceId) {
		return postRepository.findAll(type, provinceId);
	}
	
	public List<Post> findAll_Top( int type) {
		return postRepository.findAll_Top(type);
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
	
	public String FixString(String s) {
		  String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		  Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		  return pattern.matcher(temp).replaceAll("").replace("đ", "d");
	}
	
	public List<Post> SearchForContent(String content){
		List<Post> lp = new ArrayList<Post>();
		for(Post p: postRepository.findAll())
			if( FixString(p.getPost_content().toLowerCase() ).contains( FixString(content.toLowerCase()) ))
				lp.add(p);
		return lp;
	}
	
	public void save(Post post) {
		postRepository.save(post);
	}
	
	public void delete(int id) {
		postRepository.delete(id);
	}
}
