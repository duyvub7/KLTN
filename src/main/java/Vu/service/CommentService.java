package Vu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Comment;
import Vu.repository.CommentRepository;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository commentRepository;

	public int getLastCommentId() {
		return commentRepository.findAll().get(commentRepository.findAll().size()-1).getComment_id();
	}
	
	public void save(Comment comment) {
		commentRepository.save(comment);
	}
	
	public void delete(int id) {
		commentRepository.delete(id);
	}
}
