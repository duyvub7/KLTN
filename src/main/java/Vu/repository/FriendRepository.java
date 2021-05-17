package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Friend;

@Repository
public interface FriendRepository extends JpaRepository<Friend, Integer> {
	
	@Query(value="select * from Friend "
			+ "where ( from_account_id like :id or to_account_id like :id ) and friend_status like 1", nativeQuery = true)
	List<Friend> findAllFriend( @Param("id") int id);
	
	@Query(value="select * from Friend where to_account_id like :id and friend_status like 0", nativeQuery = true)
	List<Friend> findAllReceive( @Param("id") int id);
	
	@Query(value="select * from Friend where from_account_id like :id and friend_status like 0", nativeQuery = true)
	List<Friend> findAllSend( @Param("id") int id);
	
}
