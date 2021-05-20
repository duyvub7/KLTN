package Vu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Comment_Image;
import Vu.repository.CommentImageRepository;

@Service
public class CommentImageService {

	@Autowired
	private CommentImageRepository commentImageRepository;
	
	public void save(Comment_Image ci) {
		commentImageRepository.save(ci);
	}
	
	public void delete(int id) {
		commentImageRepository.delete(id);
	}
	
	public void deleteByComment(int commentId) {
		for(Comment_Image pi : commentImageRepository.findAllByComment(commentId)) {
			commentImageRepository.delete(pi.getImage_id());
		}
	}
}
