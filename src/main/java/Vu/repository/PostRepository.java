package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {

	@Query(value="select * from Post where post_type like :type order by post_date desc", nativeQuery = true)
	List<Post> findAll( @Param("type") int type );
	
	@Query(value="select p.*\r\n"
			+ "from Post p inner join (select top 5 p.post_id, COUNT(pl.like_id) as 'like_count'\r\n"
			+ "					from Post p\r\n"
			+ "						inner join Post_Like pl on p.post_id = pl.post_id\r\n"
			+ "					where p.post_type = :type\r\n"
			+ "					group by p.post_id\r\n"
			+ "					order by like_count desc ) pt on p.post_id = pt.post_id", nativeQuery = true)
	List<Post> findTopPost( @Param("type") int type);
	
	@Query(value="select * from Post where account_id like :id order by post_date desc", nativeQuery = true)
	List<Post> findByAccountId( @Param("id") int id );
	
	@Query(value="select * from Post where account_id like :id and post_type like :type order by post_date desc", nativeQuery = true)
	List<Post> findByAccountId( @Param("id") int id, @Param("type") int type );
	
	@Query(value="select p.* from Post p\r\n"
			+ "	inner join Post_Save ps on p.post_id = ps.post_id\r\n"
			+ "where ps.account_id = :id", nativeQuery = true)
	List<Post> findAllSavePost( @Param("id") int id );
	
	@Query(value="select p.* from Post p\r\n"
			+ "	inner join Post_Save ps on p.post_id = ps.post_id\r\n"
			+ "where ps.account_id = :id and p.post_type = :type", nativeQuery = true)
	List<Post> findAllSavePost( @Param("id") int id, @Param("type") int type );
}
