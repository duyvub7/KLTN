package Vu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Post_Image;
import Vu.repository.PostImageRepository;

@Service
public class PostImageService {
	
	@Autowired
	private PostImageRepository postImageRepository;
	
	public void save(Post_Image pi) {
		postImageRepository.save(pi);
	}
	
	public void delete(int id) {
		postImageRepository.delete(id);
	}
	
}
