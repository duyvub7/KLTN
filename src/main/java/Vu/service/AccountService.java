package Vu.service;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Vu.model.Account;
import Vu.repository.AccountRepository;

@Service
public class AccountService {

	@Autowired
	private AccountRepository accountRepository;
	
	public Account findOne( int id ){
		return accountRepository.findOne( id );
	}
	
	public List<Account> findAll(){
		return accountRepository.findAll();
	}
	
	public List<Account> findAllUser() {
		return accountRepository.findAllUser();
	}
	
	public List<Account> findAllUserAvailable() {
		return accountRepository.findAllUserAvailable();
	}
	
	public List<Account> findAllUserBlocked() {
		return accountRepository.findAllUserBlocked();
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
	
	public String FixString(String s) {
		  String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
		  Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		  return pattern.matcher(temp).replaceAll("").replace("đ", "d");
	}
	
	public List<Account> SearchForName(String content){
		List<Account> la = new ArrayList<Account>();
		for(Account acc: accountRepository.findAll())
			if( FixString(acc.getName().toLowerCase() ).contains( FixString(content.toLowerCase()) ))
				la.add(acc);
		return la;
	}
	
	public void save(Account account) {
		accountRepository.save(account);
	}
	
	public void deleteById(int id) {
		accountRepository.delete(id);
	}
	
}
