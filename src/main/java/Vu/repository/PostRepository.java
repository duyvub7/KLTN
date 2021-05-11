package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import Vu.model.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {

	@Query(value="select * from Post where post_type like 1 order by post_date desc", nativeQuery = true)
	List<Post> findAllReviewPost();
	
	@Query(value="select * from Post where post_type like 2 order by post_date desc", nativeQuery = true)
	List<Post> findAllEmptyRoom();
	
	@Query(value="select * from Post where post_type like 3 order by post_date desc", nativeQuery = true)
	List<Post> findAllShareRoom();
	
	@Query(value="select * from Post where post_type like 4 order by post_date desc", nativeQuery = true)
	List<Post> findAllUtensilPost();
	
}
