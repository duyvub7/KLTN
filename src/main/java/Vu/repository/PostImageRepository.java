package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Post_Image;

@Repository
public interface PostImageRepository extends JpaRepository<Post_Image, Integer> {
	
	@Query(value="select * from Post_Image where post_id like :postId", nativeQuery = true)
	List<Post_Image> findAllByPost( @Param("postId") int postId );
}
