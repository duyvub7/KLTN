package Vu.service;

import java.util.List;

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
	
	public List<Comment> findAllByPost ( int postId ) {
		return commentRepository.findAllByPost(postId);
	}
	
	public void deleteByPost(int postId) {
		for(Comment cmt : commentRepository.findAllByPost(postId) ) {
			commentRepository.delete(cmt.getComment_id());
		}
	}
	
	public void save(Comment comment) {
		commentRepository.save(comment);
	}
	
	public void delete(int id) {
		commentRepository.delete(id);
	}
}
