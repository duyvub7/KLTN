package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Follow;

@Repository
public interface FollowRepository extends JpaRepository<Follow, Integer> {

	@Query(value="select * from Follow where to_account_id like :id", nativeQuery = true)
	List<Follow> findAllReceive( @Param("id") int id);
	
	@Query(value="select * from Follow where from_account_id like :id", nativeQuery = true)
	List<Follow> findAllFollow( @Param("id") int id);
	
	
}
