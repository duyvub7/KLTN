package Vu.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import Vu.model.Account;
import Vu.service.AccountService;

@Controller
public class LoginController {

	@Autowired
	private AccountService accountService;
	
	@GetMapping(value = {"/", "/login"})
	public String getLogin() {
		return "login";
	}

	@PostMapping(value= "/checklogin")
	public ResponseEntity<?> checkLogin(@RequestBody Account account) {
		if (account.getPhone()=="" || account.getPassword()=="") {
			return new ResponseEntity<String>("Vui long dien day du thong tin", HttpStatus.OK);
		}
		if ( !accountService.checkExistAccountByPhone( account.getPhone() )) {
			return new ResponseEntity<String>("Khong tim thay so dien thoai", HttpStatus.OK);
		}
		Account acc = accountService.findOneByPhoneAndPassword(account.getPhone(), account.getPassword());
		if (acc != null) {																		
			if (acc.isAccount_status() == false) {													
				return new ResponseEntity<String>("Tai khoan bi khoa", HttpStatus.OK);
			} else {
				return ResponseEntity.ok("OK");													
			}
		} else {
			return new ResponseEntity<String>("Sai mat khau", HttpStatus.OK);	
		}
	}

	@PostMapping(value = "/login")
	public String login(Model model, HttpServletRequest request, HttpSession session) {
		String phone = request.getParameter("phone-log");
		String password = request.getParameter("password-log");
		Account acc = accountService.findOneByPhoneAndPassword(phone, password);
		if(acc!=null) {
			if(session.getAttribute("current_account")==null) {
				session.setAttribute("current_account", acc);
			}
			if (acc.getRole() == 1) {
				return "redirect:admin/manager-account";
			}
		}
		session.setAttribute("current_account", acc);
		return "redirect:post";
	}
	
	@PostMapping(value = "/checkregister")
	public ResponseEntity<?> checkregister(@RequestBody Account account) {
		if (account.getName()=="" || account.getPhone()=="" || account.getPassword()=="" || account.getIntroduction()=="") {
			return new ResponseEntity<String>("Vui long dien day du thong tin", HttpStatus.OK);
		}
		if ( account.getPhone().length() != 10 ) {   
			return new ResponseEntity<String>("So dien thoai khong dung", HttpStatus.OK);
		}
		if ( accountService.checkExistAccountByPhone( account.getPhone() )) {   
			return new ResponseEntity<String>("So dien thoai da duoc dung", HttpStatus.OK);
		}
		if ( !account.getEmail().contains("@") ) {   
			return new ResponseEntity<String>("Email khong dung dinh dang", HttpStatus.OK);
		}
		else if(account.getPassword().length()<8 || account.getPassword().length()>20) {
			return new ResponseEntity<String>("Mat khau phai dai 8-20 ky tu", HttpStatus.OK);
		}
		else if(!account.getPassword().equals(account.getIntroduction())) {
			return new ResponseEntity<String>("Mat khau xac nhan khong dung", HttpStatus.OK);
		}
		else {
			return ResponseEntity.ok("OK");
		}
	}

	@PostMapping(value = "/register")
	public String registerpost(Model model, HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("utf-8");
			String name = request.getParameter("name");
			int gender = Integer.parseInt(request.getParameter("gender"));
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			Account acc = new Account();
			acc.setName(name);
			acc.setGender(gender);
			acc.setPhone(phone);
			if(email!=null && email!="" ) {
				acc.setEmail(email);
			}
			acc.setPassword(pass);
			acc.setAvatar("resources/contents/images/default-avatar.png");
			acc.setWall_image("resources/contents/blank.png");
			java.sql.Date d = java.sql.Date.valueOf(LocalDate.now());
			acc.setCreate_date(d);
			acc.setAccount_status(true);
			acc.setRole(2);
			acc.setProvince_id(64);
			accountService.save(acc);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login";
	}
	
	@GetMapping("/forget-pass")
	public String forgetpass_phone(HttpSession session) {
		return "forgetpass-phone";
	}
	
	@GetMapping("/getpass-otp")
	public String forgetpass_otp(HttpSession session) {
		return "forgetpass-otp";
	}
	
	@GetMapping("/getpass-newpass")
	public String forgetpass_newpass(HttpSession session) {
		return "forgetpass-newpass";
	}
	
	@GetMapping("/logout")
	public String registerget(HttpSession session) {
		session.removeAttribute("recently_account");
		return "login";
	}
}
