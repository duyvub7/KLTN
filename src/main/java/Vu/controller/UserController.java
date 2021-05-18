package Vu.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Vu.model.Account;
import Vu.model.Message;
import Vu.model.Post;
import Vu.model.Post_Image;
import Vu.service.FollowService;
import Vu.service.FriendService;
import Vu.service.MessageService;
import Vu.service.NotificationService;
import Vu.service.PostImageService;
import Vu.service.PostService;

@Controller
public class UserController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private PostImageService postImageService;
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private FollowService followService;
	
	// current account session
	private static final String CURRENT_ACCOUNT = "current_account";
	// review post id : 1
	private static final int REVIEW = 1;
	// empty room post id : 2
	private static final int EMPTY_ROOM = 2;
	// share room post id : 3
	private static final int  SHARE_ROOM = 3;
	// pass utensil post id : 4
	private static final int UTENSIL = 4;
	
	public void setNavInfo(Model model, HttpSession session) {
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		model.addAttribute("listRequest", friendService.findAllReceive(acc.getAccount_id()));
		model.addAttribute("listChat", messageService.getListChat(acc.getAccount_id()));
		model.addAttribute("listNotification", notificationService.findAllByAccountId(acc.getAccount_id()));
	}
	
	public boolean checkAvailable(HttpSession session) {
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		if(acc == null || acc.getRole() != 2) {
			return false;
		}
		return true;
	}
	
	@GetMapping(value = "/post")
	public String view_post_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(REVIEW));
		model.addAttribute("topPost", postService.findTopPost(REVIEW));
		setNavInfo(model, session);
		return "view-post";
	}
	
	@GetMapping(value = "/emptyroom")
	public String view_emptyroom_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(EMPTY_ROOM));
		model.addAttribute("topPost", postService.findTopPost(EMPTY_ROOM));
		setNavInfo(model, session);
		return "view-emptyroom";
	}
	
	@GetMapping(value = "/shareroom")
	public String view_shareroom_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(SHARE_ROOM));
		model.addAttribute("topPost", postService.findTopPost(SHARE_ROOM));
		setNavInfo(model, session);
		return "view-shareroom";
	}
	
	@GetMapping(value = "/utensil")
	public String view_utensil_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(UTENSIL));
		model.addAttribute("topPost", postService.findTopPost(UTENSIL));
		setNavInfo(model, session);
		return "view-utensil";
	}
	
	@PostMapping(value = "add-post")
	public String add_post(@RequestParam("image") MultipartFile file, @RequestParam("content") String content, HttpSession session) {
		try {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/post/" + fileName);
			System.out.println(path);
			try {
				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException e) {
				e.printStackTrace();
			}
			Post p = new Post();
			Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
			p.setAccount_id(acc.getAccount_id());
			p.setPost_content(content);
			p.setPost_status(true);
			Date d = Date.valueOf(LocalDate.now());
			p.setPost_date(d);
			p.setProvince_id(64);
			p.setPost_type(2);
			postService.save(p);
			if(fileName!=null && fileName!="") {
				String url = "resources/contents/images/image_post/"+fileName;
				Post_Image pi = new Post_Image();
				pi.setUrl(url);
				pi.setPost_id(postService.getLastPostId());
				postImageService.save(pi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/post";
	}
	
	@PostMapping(value = "add-emptyroom")
	public String add_emptyroom(@RequestParam("image") MultipartFile file, @RequestParam("content") String content, 
			@RequestParam("province") int province_id, @RequestParam("price") int price, HttpSession session) {
		try {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/post/" + fileName);
			System.out.println(path);
			try {
				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException e) {
				e.printStackTrace();
			}
			Post p = new Post();
			Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
			p.setAccount_id(acc.getAccount_id());
			p.setPost_content(content);
			p.setProvince_id(province_id);
			p.setPrice(price);
			p.setPost_status(true);
			Date d = Date.valueOf(LocalDate.now());
			p.setPost_date(d);
			p.setPost_type(2);
			postService.save(p);
			if(fileName!=null && fileName!="") {
				String url = "resources/contents/images/image_post/"+fileName;
				Post_Image pi = new Post_Image();
				pi.setUrl(url);
				pi.setPost_id(postService.getLastPostId());
				postImageService.save(pi);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/emptyroom";
	}
	
	@GetMapping(value = "/my-profile")
	public String myprofile_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		setNavInfo(model, session);
		return "myprofile";
	}
	
	@GetMapping(value = "/edit-profile")
	public String editprofile_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		setNavInfo(model, session);
		return "myprofile-edit";
	}
	
	@GetMapping(value = "/profile")
	public String profile_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		setNavInfo(model, session);
		return "profile";
	}
	
	@GetMapping(value = "/my-post")
	public String mypost_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		model.addAttribute("listPost0", postService.findByAccountId(account.getAccount_id()));
		model.addAttribute("listPost1", postService.findByAccountId(account.getAccount_id(), REVIEW));
		model.addAttribute("listPost2", postService.findByAccountId(account.getAccount_id(), EMPTY_ROOM));
		model.addAttribute("listPost3", postService.findByAccountId(account.getAccount_id(), SHARE_ROOM));
		model.addAttribute("listPost4", postService.findByAccountId(account.getAccount_id(), UTENSIL));
		setNavInfo(model, session);
		return "mypost";
	}
	
	@GetMapping(value = "/post-info")
	public String post_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		setNavInfo(model, session);
		return "post-info";
	}
	
	@GetMapping(value = "/save-post")
	public String savepost_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		model.addAttribute("listPost0", postService.findAllSavePost(account.getAccount_id()));
		model.addAttribute("listPost1", postService.findAllSavePost(account.getAccount_id(), REVIEW));
		model.addAttribute("listPost2", postService.findAllSavePost(account.getAccount_id(), EMPTY_ROOM));
		model.addAttribute("listPost3", postService.findAllSavePost(account.getAccount_id(), SHARE_ROOM));
		model.addAttribute("listPost4", postService.findAllSavePost(account.getAccount_id(), UTENSIL));
		setNavInfo(model, session);
		return "savepost";
	}
	
	@GetMapping(value = "/friend")
	public String friend_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		model.addAttribute("listFriend", friendService.findAllFriend(account.getAccount_id()));
		setNavInfo(model, session);
		return "friend";
	}
	
	@GetMapping(value = "/request")
	public String request_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		model.addAttribute("listRequestSend", friendService.findAllSend(account.getAccount_id()));
		model.addAttribute("listRequestReceive", friendService.findAllReceive(account.getAccount_id()));
		setNavInfo(model, session);
		return "request";
	}
	
	@GetMapping(value = "/follow")
	public String follow_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		model.addAttribute("listMyFollow", followService.findAllFollow(account.getAccount_id()));
		model.addAttribute("listFollow", followService.findAllReceive(account.getAccount_id()));
		setNavInfo(model, session);
		return "follow";
	}
	
	@GetMapping(value = "/message")
	public String message_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		List<Message> listChat = messageService.getListChat(account.getAccount_id());
		if(listChat.size() > 0) {
			if(messageService.getListChat(account.getAccount_id()).get(0).getFrom_account_id() == account.getAccount_id()) {
				model.addAttribute("listMessage", 
					messageService.findAllMessageByAccount(account.getAccount_id(), listChat.get(0).getFrom_account_id()));
			}
			else {
				model.addAttribute("listMessage", 
						messageService.findAllMessageByAccount(account.getAccount_id(), listChat.get(0).getTo_account_id()));
			}
		}
		setNavInfo(model, session);
		return "message";
	}
	
	@PostMapping(value = "/like-post")
	public ResponseEntity<?> check_like(@RequestBody Account account) {
//		if (account.getPhone()=="" || account.getPassword()=="") {
//			return new ResponseEntity<String>("Vui long dien day du thong tin", HttpStatus.OK);
//		}
//		if (acc != null) {																		
//			if (acc.isAccount_status() == false) {													
//				return new ResponseEntity<String>("Tai khoan bi khoa", HttpStatus.OK);
//			} else {
//				return ResponseEntity.ok("OK");													
//			}
//		} else {
			return new ResponseEntity<String>("Sai mat khau", HttpStatus.OK);	
//		}
	}
}
