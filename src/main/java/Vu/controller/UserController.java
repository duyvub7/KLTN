package Vu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import Vu.model.Account;
import Vu.repository.NotificationService;
import Vu.service.FriendService;
import Vu.service.MessageService;
import Vu.service.PostService;

@Controller
public class UserController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private NotificationService notificationService;
	
	@GetMapping(value = "/view-post")
	public String view_post_get(Model model, HttpSession session) {
		model.addAttribute("listPost", postService.findAllReviewPost());
		Account acc = (Account)session.getAttribute("recently_account");
		model.addAttribute("listRequest", friendService.findAllByReceiveId(acc.getAccount_id()));
		model.addAttribute("listChat", messageService.getListChat(acc.getAccount_id()));
		model.addAttribute("listNotification", notificationService.findAllByAccountId(acc.getAccount_id()));
		return "view-post";
	}
	
	@GetMapping(value = "/view-emptyroom")
	public String view_emptyroom_get(Model model, HttpSession session) {
		model.addAttribute("listPost", postService.findAllEmptyRoom());
		Account acc = (Account)session.getAttribute("recently_account");
		model.addAttribute("listRequest", friendService.findAllByReceiveId(acc.getAccount_id()));
		model.addAttribute("listChat", messageService.getListChat(acc.getAccount_id()));
		model.addAttribute("listNotification", notificationService.findAllByAccountId(acc.getAccount_id()));
		return "view-emptyroom";
	}
	
}
