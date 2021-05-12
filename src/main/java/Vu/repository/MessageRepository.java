package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Message;

@Repository
public interface MessageRepository extends JpaRepository<Message, Integer> {

	@Query(value="select distinct from_account_id  from Message\r\n"
			+ "where from_account_id in ( select distinct from_account_id \r\n"
			+ "						from Message where to_account_id = :id\r\n"
			+ "						group by from_account_id, to_account_id )\r\n"
			+ "union\r\n"
			+ "select distinct to_account_id  from Message\r\n"
			+ "where to_account_id in ( select to_account_id \r\n"
			+ "						from Message where from_account_id = :id\r\n"
			+ "						group by from_account_id, to_account_id) ", nativeQuery = true)
	List<Integer> findAllAccountIdChated( @Param("id") int id);
	
	@Query(value="select top 1 * from Message \r\n"
			+ "where (from_account_id = :accId and to_account_id = :friendId) \r\n"
			+ "	or (from_account_id = :friendId and to_account_id = :accId)\r\n"
			+ "order by time desc", nativeQuery = true)
	List<Message> findLastMessageByAccount( @Param("accId") int id, @Param("friendId") int friendId );
	
	@Query(value="select * from Message \r\n"
			+ "where (from_account_id = :accId and to_account_id = :friendId) \r\n"
			+ "	or (from_account_id = :friendId and to_account_id = :accId)", nativeQuery = true)
	List<Message> findAllMessageByAccount( @Param("accId") int id, @Param("friendId") int friendId );
	
	
	
	
}
