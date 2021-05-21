package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Comment;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {

	@Query(value="select * from Comment where post_id like :postId", nativeQuery = true)
	List<Comment> findAllByPost( @Param("postId") int postId );
	
}
