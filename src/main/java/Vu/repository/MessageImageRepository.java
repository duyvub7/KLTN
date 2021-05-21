package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Message_Image;

@Repository
public interface MessageImageRepository extends JpaRepository<Message_Image, Integer> {

	@Query(value="select * from Message_Image where message_id like :message_id", nativeQuery = true)
	List<Message_Image> findAllByMessage( @Param("message_id") int message_id );
	
}
