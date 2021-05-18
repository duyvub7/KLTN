package Vu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import Vu.model.Post_Image;

@Repository
public interface PostImageRepository extends JpaRepository<Post_Image, Integer> {
	
}
