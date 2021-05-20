package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Post_Like;

@Repository
public interface PostLikeRepository extends JpaRepository<Post_Like, Integer> {
	
	@Query(value="select * from Post_Like where account_id = :accountId and post_id = :postId", nativeQuery = true)
	List<Post_Like> findPostLike( @Param("accountId") int accountId, @Param("postId") int postId );
	
	@Query(value="select * from Post_Like where account_id = :accountId", nativeQuery = true)
	List<Post_Like> findListLiked( @Param("accountId") int accountId );
	
}
