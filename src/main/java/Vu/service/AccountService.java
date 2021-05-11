package Vu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Account;
import Vu.repository.AccountRepository;

@Service
public class AccountService {

	@Autowired
	private AccountRepository accountRepository;

	public List<Account> findAll(){
		return accountRepository.findAll();
	}
	
	public List<Account> findAllUser() {
		return accountRepository.findAllUser();
	}
	
	public Account findOne(int id) {
		return accountRepository.findOne(id);
	}
	
	public Account findOneByPhoneAndPassword(String phone, String password) {
		if(!accountRepository.findOneByPhoneAndPassword(phone, password).isEmpty()) {
			return accountRepository.findOneByPhoneAndPassword(phone, password).get(0);
		}
		else return null;
	}
	
	public boolean checkExistAccountByPhone(String username) {
		return accountRepository.checkExistAccountByPhone(username) != null ? true : false;
	}
	
	public boolean checkPassById(int id, String pass) {
		return accountRepository.getPasswordById(id, pass) == null ? false : true;
	}
	
	public void save(Account account) {
		accountRepository.save(account);
	}
	
	public void deleteById(int id) {
		accountRepository.delete(id);
	}
	
}
