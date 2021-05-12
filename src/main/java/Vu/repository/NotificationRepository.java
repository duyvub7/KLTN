package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Notification;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Integer> {
	
	@Query(value="select *\r\n"
			+ "from Notification n\r\n"
			+ "	inner join Post p on n.post_id = p.post_id\r\n"
			+ "where p.account_id = :id", nativeQuery = true)
	List<Notification> findAllByAccountId( @Param("id") int id);
	
}
