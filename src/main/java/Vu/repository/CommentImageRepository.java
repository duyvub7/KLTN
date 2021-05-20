package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Comment_Image;

@Repository
public interface CommentImageRepository extends JpaRepository<Comment_Image, Integer> {

	@Query(value="select * from Comment_Image where comment_id like :comment_id", nativeQuery = true)
	List<Comment_Image> findAllByComment( @Param("comment_id") int comment_id );
}
