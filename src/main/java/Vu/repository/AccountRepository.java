package Vu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Vu.model.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Integer> {

	@Query(value="select * from Account where account_status LIKE 1", nativeQuery = true)
	List<Account> findAllAvailable();
	
	@Query(value="select * from Account where role like 2", nativeQuery = true)
	List<Account> findAllUser();
	
	@Query(value="select phone from Account a where a.phone LIKE :phone", nativeQuery = true)
	String checkExistAccountByPhone( @Param("phone") String phone );
	
	@Query(value="select * from Account a where a.phone LIKE :phone and a.password LIKE :password and account_status LIKE 1", nativeQuery = true)
	List<Account> findOneByPhoneAndPassword( @Param("phone") String phone, @Param("password") String password);
	
	@Query(value="select password from Account a where a.account_id like :id and a.password LIKE :pass", nativeQuery = true)
	String getPasswordById( @Param("id") int id, @Param("pass") String pass );
	
}
