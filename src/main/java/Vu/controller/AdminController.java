package Vu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import Vu.service.AccountService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private AccountService accountService;
	
	// account normal status: 1
	private static final int STATUS_AVAILBLE = 1;
	// account block status: 1
	private static final int  STATUS_BLOCK = 0;

	@GetMapping(value = "/manager-account")
	public String manager_account_get(Model model) {
		model.addAttribute("listAccount", accountService.findAllUser());
		return "admin/manager-account";
	}
}
