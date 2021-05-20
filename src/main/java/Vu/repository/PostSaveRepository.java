package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Post_Save;

@Repository
public interface PostSaveRepository extends JpaRepository<Post_Save, Integer> {
	
	@Query(value="select * from Post_Save where account_id = :accountId and post_id = :postId", nativeQuery = true)
	List<Post_Save> findPostSave( @Param("accountId") int accountId, @Param("postId") int postId );
	
	@Query(value="select * from Post_Save where account_id = :accountId", nativeQuery = true)
	List<Post_Save> findListSaved( @Param("accountId") int accountId );
}
