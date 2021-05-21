package Vu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import Vu.model.Account;
import Vu.service.AccountService;
import Vu.service.NotificationService;
import Vu.service.PostImageService;
import Vu.service.PostService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private PostImageService postImageService;
	
	@Autowired
	private NotificationService notificationService;
	
	// account normal status: true
	private static final boolean STATUS_AVAILBLE = true;
	// account block status: false
	private static final boolean STATUS_BLOCK = false;

	@GetMapping(value = "/manager-account")
	public String manager_account_get(Model model) {
		model.addAttribute("listAccount", accountService.findAllUser());
		return "admin/manager-account";
	}
	
	@GetMapping(value = "/manager-blockaccount")
	public String manager_blockaccount_get(Model model) {
		model.addAttribute("listAccount", accountService.findAllUserBlocked());
		return "admin/manager-blockaccount";
	}
	
	@GetMapping(value = "/manager-availableaccount")
	public String manager_availableaccount_get(Model model) {
		model.addAttribute("listAccount", accountService.findAllUserAvailable());
		return "admin/manager-availableaccount";
	}
	
	@GetMapping(value = "/block-account/{accId}")
	public String blockaccount_get(@PathVariable("accId") int accId) {
		Account acc = accountService.findOne(accId);
		acc.setAccount_status(STATUS_BLOCK);
		accountService.save(acc);
		return "redirect:/admin/manager-account";
	}
	
	@GetMapping(value = "/unlock-account/{accId}")
	public String unlockaccount_get(@PathVariable("accId") int accId) {
		Account acc = accountService.findOne(accId);
		acc.setAccount_status(STATUS_AVAILBLE);
		accountService.save(acc);
		return "redirect:/admin/manager-account";
	}
	
	@GetMapping(value = "/delete-account/{accId}")
	public String deleteaccount_get(@PathVariable("accId") int accId) {
		accountService.deleteById(accId);
		return "redirect:/admin/manager-account";
	}
	
	@GetMapping(value = "/manager-post")
	public String manager_post_get(Model model) {
		model.addAttribute("listPost", postService.findAll());
		return "admin/manager-post";
	}
	
	@GetMapping(value = "/delete-post/{postId}")
	public String deletepost_get(@PathVariable("postId") int postId) {
		postImageService.deleteByPost(postId);
		postService.delete(postId);
		return "redirect:/admin/manager-post";
	}
	
	@GetMapping(value = "/manager-notification")
	public String manager_notification_get(Model model) {
		model.addAttribute("listNotification", notificationService.findAll());
		return "admin/manager-notification";
	}
	
}
