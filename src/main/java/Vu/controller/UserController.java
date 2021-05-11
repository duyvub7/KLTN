package Vu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import Vu.model.Account;
import Vu.service.FriendService;
import Vu.service.PostService;

@Controller
public class UserController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private FriendService friendService;
	
	@GetMapping(value = "/view-post")
	public String view_post_get(Model model, HttpSession session) {
		model.addAttribute("listPost", postService.findAllReviewPost());
		Account acc = (Account)session.getAttribute("recently_account");
		model.addAttribute("listRequest", friendService.findAllByReceiveId(acc.getAccount_id()));
		return "view-post";
	}
	
}
