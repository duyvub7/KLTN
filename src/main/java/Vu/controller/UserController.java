package Vu.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Vu.model.Account;
import Vu.model.Comment;
import Vu.model.Comment_Image;
import Vu.model.Follow;
import Vu.model.Friend;
import Vu.model.Message;
import Vu.model.Message_Image;
import Vu.model.Post;
import Vu.model.Post_Image;
import Vu.model.Post_Like;
import Vu.model.Post_Save;
import Vu.service.AccountService;
import Vu.service.CommentImageService;
import Vu.service.CommentService;
import Vu.service.FollowService;
import Vu.service.FriendService;
import Vu.service.MessageImageService;
import Vu.service.MessageService;
import Vu.service.NotificationService;
import Vu.service.PostImageService;
import Vu.service.PostLikeService;
import Vu.service.PostSaveService;
import Vu.service.PostService;
import Vu.service.ProvinceService;

@Controller
public class UserController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private PostImageService postImageService;
	
	@Autowired
	private PostLikeService postLikeService;
	
	@Autowired
	private PostSaveService postSaveService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private CommentImageService commentImageService;
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private MessageImageService messageImageService;
	
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private ProvinceService provinceService;
	
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
	
	public void setListPostData(Model model, HttpSession session) {
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		int id = acc.getAccount_id();
		model.addAttribute("listLiked", postLikeService.findListLiked(id));
		model.addAttribute("listSaved", postSaveService.findListSaved(id));
		model.addAttribute("listFollowed", followService.findListFollowed(id));
		model.addAttribute("listFriend", friendService.findListFriend(id));
		model.addAttribute("listSendRequest", friendService.findListSend(id));
		model.addAttribute("listReceiveRequest", friendService.findListReceive(id));
		model.addAttribute("listProvince", provinceService.findAll());
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
		setListPostData(model, session);
		return "view-post";
	}
	
	@GetMapping(value = "/post-hot")
	public String view_hotpost_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll_Top(REVIEW));
		model.addAttribute("topPost", postService.findTopPost(REVIEW));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-post";
	}
	
	@GetMapping(value = "/emptyroom")
	public String view_emptyroom_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(EMPTY_ROOM));
		model.addAttribute("topPost", postService.findTopPost(EMPTY_ROOM));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-emptyroom";
	}
	
	@GetMapping(value = "/emptyroom-hot")
	public String view_emptyroom_hot_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll_Top(EMPTY_ROOM));
		model.addAttribute("topPost", postService.findTopPost(EMPTY_ROOM));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-emptyroom";
	}
	
	@GetMapping(value = "/emptyroom-desc")
	public String view_emptyroom_desc_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAllDescPrice(EMPTY_ROOM));
		model.addAttribute("topPost", postService.findTopPost(EMPTY_ROOM));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-emptyroom";
	}
	
	@GetMapping(value = "/emptyroom-asc")
	public String view_emptyroom_asc_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAllAscPrice(EMPTY_ROOM));
		model.addAttribute("topPost", postService.findTopPost(EMPTY_ROOM));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-emptyroom";
	}
	
	@GetMapping(value = "/emptyroom/{provinceId}")
	public String view_emptyroom_province_get(@PathVariable("provinceId") int provinceId, Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(EMPTY_ROOM, provinceId));
		model.addAttribute("topPost", postService.findTopPost(EMPTY_ROOM));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-emptyroom";
	}
	
	@GetMapping(value = "/shareroom")
	public String view_shareroom_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(SHARE_ROOM));
		model.addAttribute("topPost", postService.findTopPost(SHARE_ROOM));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-shareroom";
	}
	
	@GetMapping(value = "/shareroom-hot")
	public String view_hotshareroom_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll_Top(SHARE_ROOM));
		model.addAttribute("topPost", postService.findTopPost(SHARE_ROOM));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-shareroom";
	}
	
	@GetMapping(value = "/shareroom/{provinceId}")
	public String view_shareroom_province_get(@PathVariable("provinceId") int provinceId, Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(SHARE_ROOM, provinceId));
		model.addAttribute("topPost", postService.findTopPost(SHARE_ROOM));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-shareroom";
	}
	
	@GetMapping(value = "/utensil")
	public String view_utensil_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(UTENSIL));
		model.addAttribute("topPost", postService.findTopPost(UTENSIL));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-utensil";
	}
	
	@GetMapping(value = "/utensil-hot")
	public String view_hotutensil_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll_Top(UTENSIL));
		model.addAttribute("topPost", postService.findTopPost(UTENSIL));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-utensil";
	}
	
	@GetMapping(value = "/utensil/{provinceId}")
	public String view_utensil_province_get(@PathVariable("provinceId") int provinceId, Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		model.addAttribute("listPost", postService.findAll(UTENSIL, provinceId));
		model.addAttribute("topPost", postService.findTopPost(UTENSIL));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "view-utensil";
	}
	
	@PostMapping(value = "add-post")
	public String add_post(@RequestParam("file") MultipartFile file, @RequestParam("content") String content, 
			HttpServletRequest request, HttpSession session) {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		if( (content != null && content.replaceAll(" ", "").length() > 0) || (fileName!=null && fileName!="") ) {
			try {
				Post p = new Post();
				Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
				p.setAccount_id(acc.getAccount_id());
				p.setPost_content(content);
				p.setPost_status(true);
				Timestamp d = Timestamp.valueOf(LocalDateTime.now());
				p.setPost_date(d);
				p.setProvince_id(64);
				p.setPost_type(1);
				postService.save(p);
				if(fileName!=null && fileName!="") {
					String url = "resources/contents/images/post/"+fileName;
					Post_Image pi = new Post_Image();
					pi.setUrl(url);
					pi.setPost_id(postService.getLastPostId());
					postImageService.save(pi);
					Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/post/" + fileName);
					try {
						Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String referrer = request.getHeader("referer").replace("http://localhost:8080/KLTN", "");
		return "redirect:" + referrer;
	}
	
	@PostMapping(value = "add-emptyroom")
	public String add_emptyroom(@RequestParam("file") MultipartFile file, @RequestParam("content") String content, 
			@RequestParam("province") int province_id, @RequestParam("price") int price,
			HttpServletRequest request, HttpSession session) {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		if( ((content != null && content.replaceAll(" ", "").length() > 0 ) || (fileName!=null && fileName!="")) && price >= 0 ) {
			try {
				Post p = new Post();
				Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
				p.setAccount_id(acc.getAccount_id());
				p.setPost_content(content);
				p.setProvince_id(province_id);
				p.setPrice(price);
				p.setPost_status(true);
				Timestamp d = Timestamp.valueOf(LocalDateTime.now());
				p.setPost_date(d);
				p.setPost_type(2);
				postService.save(p);
				if(fileName!=null && fileName!="") {
					String url = "resources/contents/images/post/"+fileName;
					Post_Image pi = new Post_Image();
					pi.setUrl(url);
					pi.setPost_id(postService.getLastPostId());
					postImageService.save(pi);
					Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/post/" + fileName);
					try {
						Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String referrer = request.getHeader("referer").replace("http://localhost:8080/KLTN", "");
		return "redirect:" + referrer;
	}
	
	@PostMapping(value = "add-shareroom")
	public String add_shareroom(@RequestParam("file") MultipartFile file, @RequestParam("content") String content, 
			@RequestParam("province") int province_id, @RequestParam("price") int price,
			HttpServletRequest request, HttpSession session) {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		if( ((content != null && content.replaceAll(" ", "").length() > 0 ) || (fileName!=null && fileName!="")) && price >= 0 ) {
			try {
				Post p = new Post();
				Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
				p.setAccount_id(acc.getAccount_id());
				p.setPost_content(content);
				p.setProvince_id(province_id);
				p.setPrice(price);
				p.setPost_status(true);
				Timestamp d = Timestamp.valueOf(LocalDateTime.now());
				p.setPost_date(d);
				p.setPost_type(3);
				postService.save(p);
				if(fileName!=null && fileName!="") {
					String url = "resources/contents/images/post/"+fileName;
					Post_Image pi = new Post_Image();
					pi.setUrl(url);
					pi.setPost_id(postService.getLastPostId());
					postImageService.save(pi);
					Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/post/" + fileName);
					try {
						Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String referrer = request.getHeader("referer").replace("http://localhost:8080/KLTN", "");
		return "redirect:" + referrer;
	}
	
	@PostMapping(value = "add-utensil")
	public String add_utensil(@RequestParam("file") MultipartFile file, @RequestParam("content") String content, 
			@RequestParam("province") int province_id, @RequestParam("price") int price,
			HttpServletRequest request, HttpSession session) {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		if( ((content != null && content.replaceAll(" ", "").length() > 0 ) || (fileName!=null && fileName!="")) && price >= 0 ) {
			try {
				Post p = new Post();
				Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
				p.setAccount_id(acc.getAccount_id());
				p.setPost_content(content);
				p.setProvince_id(province_id);
				p.setPrice(price);
				p.setPost_status(true);
				Timestamp d = Timestamp.valueOf(LocalDateTime.now());
				p.setPost_date(d);
				p.setPost_type(4);
				postService.save(p);
				if(fileName!=null && fileName!="") {
					String url = "resources/contents/images/post/"+fileName;
					Post_Image pi = new Post_Image();
					pi.setUrl(url);
					pi.setPost_id(postService.getLastPostId());
					postImageService.save(pi);
					Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/post/" + fileName);
					try {
						Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String referrer = request.getHeader("referer").replace("http://localhost:8080/KLTN", "");
		return "redirect:" + referrer;
	}
	
	@GetMapping(value = "/edit-post/{postId}")
	public String edit_post_get(@PathVariable("postId") int postId, Model model, HttpServletRequest request, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		if(!postService.checkByAccountId(acc.getAccount_id(), postId)) {
			return "redirect:/post";
		}
		setNavInfo(model, session);
		model.addAttribute("listProvince", provinceService.findAll());
		model.addAttribute("post", postService.findOne(postId));
		return "post-edit";
	}
	
	@PostMapping(value = "/edit-post/{postId}")
	public String edit_post(@PathVariable("postId") int postId, @RequestParam("file") MultipartFile file, 
			@RequestParam("content") String content, @RequestParam("province") int province_id, @RequestParam("price") int price, 
			@RequestParam("status") int status, HttpServletRequest request, HttpSession session) {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		if( ((content != null && content.replaceAll(" ", "").length() > 0 ) || (fileName!=null && fileName!="")) && price >= 0 ) {
			try {
				Post p = postService.findOne(postId);
				p.setPost_content(content);
				p.setProvince_id(province_id);
				p.setPrice(price);
				if(status == 1) {
					p.setPost_status(true);
				}
				else {
					p.setPost_status(false);
				}
				postService.save(p);
				if(fileName!=null && fileName!="") {
					String url = "resources/contents/images/post/"+fileName;
					Post_Image pi = new Post_Image();
					pi.setUrl(url);
					pi.setPost_id(postId);
					postImageService.save(pi);
					Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/post/" + fileName);
					try {
						Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		String referrer = request.getHeader("referer").replace("http://localhost:8080/KLTN", "");
		return "redirect:" + referrer;
	}
	
	@PostMapping(value = "/delete-post")
	public ResponseEntity<?> delete_comment(@RequestBody int post_id) {
		postImageService.deleteByPost(post_id);
		postLikeService.deleteByPost(post_id);
		List<Comment> lc = commentService.findAllByPost(post_id);
		for( Comment c : lc ) {
			commentImageService.deleteByComment(c.getComment_id());
			commentService.deleteByPost(post_id);
		}
		postService.delete(post_id);
		return ResponseEntity.ok("OK");
	}
	
	@PostMapping(value = "/add-comment/{postId}")
	public String add_comment(@PathVariable("postId") int postId, @RequestParam("file") MultipartFile file, 
			@RequestParam("content") String content, HttpServletRequest request, HttpSession session) {
		try {
			Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
			Comment comment = new Comment();
			comment.setAccount_id(acc.getAccount_id());
			comment.setPost_id(postId);
			comment.setComment_content(content);
			Timestamp d = Timestamp.valueOf(LocalDateTime.now());
			comment.setTime(d);
			commentService.save(comment);
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			if(fileName!=null && fileName!="") {
				String url = "resources/contents/images/comment/"+fileName;
				Comment_Image c_image = new Comment_Image();
				c_image.setUrl(url);
				c_image.setComment_id(commentService.getLastCommentId());
				commentImageService.save(c_image);
				Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/comment/" + fileName);
				try {
					Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String referrer = request.getHeader("referer").replace("http://localhost:8080/KLTN", "");
		return "redirect:" + referrer;
	}
	
	@PostMapping(value = "/delete-comment")
	public ResponseEntity<?> delete_post(@RequestBody int comment_id) {
		commentImageService.deleteByComment(comment_id);
		commentService.delete(comment_id);
		return ResponseEntity.ok("OK");
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
		model.addAttribute("listProvince", provinceService.findAll());
		return "myprofile-edit";
	}
	
	@PostMapping(value = "/edit-profile")
	public String editprofile_post(@RequestParam("introduction") String introduction, @RequestParam("name") String name,
			@RequestParam("gender") int gender, @RequestParam("birthday") String birthday, @RequestParam("phone") String phone,
			@RequestParam("province") int provinceId, @RequestParam("address") String address, HttpSession session) {
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		acc.setIntroduction(introduction);
		acc.setName(name);
		acc.setGender(gender); 
		try {
			Date date=new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
			acc.setBirthday(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		acc.setPhone(phone);
		acc.setProvince_id(provinceId);
		acc.setAddress(address);
		accountService.save(acc);
		return "redirect:/my-profile";
	}
	
	@PostMapping(value = "change-avatar")
	public String change_avatar(@RequestParam("file") MultipartFile file, HttpSession session) {
		try {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			if(fileName!=null && fileName!="") {
				Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/avatar/" + fileName);
				try {
					Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				} catch (IOException e) {
					e.printStackTrace();
				}
				Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
				String url = "resources/contents/images/avatar/"+fileName;
				acc.setAvatar(url);
				accountService.save(acc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/my-profile";
	}
	
	@PostMapping(value = "change-wall")
	public String change_wall(@RequestParam("file") MultipartFile file, HttpSession session) {
		try {
			String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			if(fileName!=null && fileName!="") {
				Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/wall/" + fileName);
				try {
					Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
				} catch (IOException e) {
					e.printStackTrace();
				}
				Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
				String url = "resources/contents/images/wall/"+fileName;
				acc.setWall_image(url);
				accountService.save(acc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/my-profile";
	}
	
	@GetMapping(value = "/profile/{accId}")
	public String profile_get(@PathVariable("accId") int accId, Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		if(accId == acc.getAccount_id()) {
			return "redirect:/my-profile";
		}
		setNavInfo(model, session);
		model.addAttribute("viewAccount", accountService.findOne(accId));
		return "acc-profile";
	}
	
	@GetMapping(value = "/account-post/{accId}")
	public String acc_post_get(@PathVariable("accId") int accId, Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		if(accId == acc.getAccount_id()) {
			return "redirect:/my-post";
		}
		setNavInfo(model, session);
		model.addAttribute("viewAccount", accountService.findOne(accId));
		model.addAttribute("listPostAcc", postService.findByAccountId(accId));
		return "acc-post";
	}
	
	@GetMapping(value = "/account-friend/{accId}")
	public String acc_friend_get(@PathVariable("accId") int accId, Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		if(accId == acc.getAccount_id()) {
			return "redirect:/friend";
		}
		setNavInfo(model, session);
		model.addAttribute("viewAccount", accountService.findOne(accId));
		model.addAttribute("listAccFriend", friendService.findAllFriend(accId));
		return "acc-friend";
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
		setListPostData(model, session);
		return "mypost";
	}
	
	@PostMapping(value = "/search")
	public String seacrh_post(@RequestParam("text") String text, Model model, HttpSession session) {
		setNavInfo(model, session);
		model.addAttribute("listPostSearch", postService.SearchForContent(text));
		model.addAttribute("listAccountSeacrh", accountService.SearchForName(text));
		return "search";
	}
	
	@GetMapping(value = "/post-info")
	public String post_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		setNavInfo(model, session);
		setListPostData(model, session);
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
		setListPostData(model, session);
		return "savepost";
	}
	
	@PostMapping(value = "/save-post")
	public ResponseEntity<?> save_post_post(@RequestBody int postId, HttpSession session) {		
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		Post_Save ps = new Post_Save();
		ps.setAccount_id(account.getAccount_id());
		ps.setPost_id(postId);
		postSaveService.save(ps);
		return ResponseEntity.ok("OK");
	}
	
	@PostMapping(value = "/unsave-post")
	public ResponseEntity<?> unsave_post_post(@RequestBody int postId, HttpSession session) {
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		Post_Save ps = postSaveService.findOne(account.getAccount_id(), postId);
		postSaveService.delete(ps.getSave_id());
		return ResponseEntity.ok("OK");
	}
	
	@GetMapping(value = "/friend")
	public String friend_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		model.addAttribute("listMyFriend", friendService.findAllFriend(account.getAccount_id()));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "friend";
	}
	
	@GetMapping(value = "/delete-friend/{frId}")
	public String delete_friend_get(@PathVariable("frId") int frId, HttpSession session) {
		friendService.delete(frId);
		return "redirect:/friend";
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
	
	@PostMapping(value = "/accept-request")
	public ResponseEntity<?> accept_request(@RequestBody int friendId) {		
		Friend fr = friendService.findOne(friendId);
		fr.setFriend_status(true);
		friendService.save(fr);
		return ResponseEntity.ok("OK");
	}
	
	@PostMapping(value = "/accept-requestAccId")
	public ResponseEntity<?> accept_request_byAccId(@RequestBody int accId, HttpSession session) {	
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		Friend fr = friendService.findOneRequest(accId, account.getAccount_id());
		fr.setFriend_status(true);
		friendService.save(fr);
		return ResponseEntity.ok("OK");
	}
	
	@PostMapping(value = "/deny-request")
	public ResponseEntity<?> deny_request(@RequestBody int friendId) {
		friendService.delete(friendId);
		return ResponseEntity.ok("OK");
	}
	
	@PostMapping(value = "/deny-requestAccId")
	public ResponseEntity<?> deny_request_byAccId(@RequestBody int accId, HttpSession session) {	
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		Friend fr = friendService.findOneRequest(accId, account.getAccount_id());
		friendService.delete(fr.getFriend_id());
		return ResponseEntity.ok("OK");
	}
	
	@GetMapping(value = "/follow")
	public String follow_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		model.addAttribute("listMyFollow", followService.findAllFollow(account.getAccount_id()));
		model.addAttribute("listFollow", followService.findAllReceive(account.getAccount_id()));
		setNavInfo(model, session);
		setListPostData(model, session);
		return "follow";
	}
	
	@PostMapping(value = "/follow")
	public ResponseEntity<?> follow_post(@RequestBody int accId, HttpSession session) {		
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		Follow fl = new Follow();
		fl.setFrom_account_id(account.getAccount_id());
		fl.setTo_account_id(accId);
		java.sql.Date d = java.sql.Date.valueOf(LocalDate.now());
		fl.setTime(d);
		followService.save(fl);
		return ResponseEntity.ok("OK");
	}
	
	@PostMapping(value = "/unfollow")
	public ResponseEntity<?> unfollow(@RequestBody int accId, HttpSession session) {
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		Follow fl = followService.findOne(account.getAccount_id(), accId);
		followService.delete(fl.getFollow_id());
		return ResponseEntity.ok("OK");
	}
	
	@GetMapping(value = "/message")
	public String message_get(Model model, HttpSession session) {
		if(!checkAvailable(session)) 
			return "redirect:/login";
		setNavInfo(model, session);
		Account account = (Account)session.getAttribute(CURRENT_ACCOUNT);
		List<Message> lc = messageService.getListChat(account.getAccount_id());
		if( lc != null ) {
			List<Message> listMess = new ArrayList<Message>();
			listMess = messageService.findAllMessageByAccount(lc.get(0).getTo_account_id(), lc.get(0).getFrom_account_id());
			model.addAttribute("listMessageView", listMess);
		}
		return "message";
	}
	
	@PostMapping(value = "/add-message/{accId}")
	public String add_mess_post(@PathVariable("accId") int accId, @RequestParam("file") MultipartFile file, 
			@RequestParam("content") String content, HttpSession session) {
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		Message mess = new Message();
		mess.setFrom_account_id(acc.getAccount_id());
		mess.setTo_account_id(accId);
		mess.setMessage_content(content);
		Timestamp d = Timestamp.valueOf(LocalDateTime.now());
		mess.setTime(d);
		messageService.save(mess);
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		if(fileName!=null && fileName!="") {
			String url = "resources/contents/images/message/"+fileName;
			Message_Image mi = new Message_Image();
			mi.setUrl(url);
			mi.setMessage_id(messageService.getLastCommentId());
			messageImageService.save(mi);
			Path path = Paths.get("D:/Program Documents/KLTN - Spring/KLTN/src/main/webapp/resources/contents/images/message/" + fileName);
			try {
				Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/message";
	}
	
	@PostMapping(value = "/like-post")
	public ResponseEntity<?> check_like(@RequestBody int post_id, HttpSession session) {					
		Account acc = (Account)session.getAttribute(CURRENT_ACCOUNT);
		Post_Like pl = postLikeService.findOne(acc.getAccount_id(), post_id);
		if (pl == null) {
			pl = new Post_Like();
			pl.setAccount_id(acc.getAccount_id());
			pl.setPost_id(post_id);
			postLikeService.save(pl);
			return new ResponseEntity<String>("ok", HttpStatus.OK);
		} else {
			postLikeService.delete(pl.getLike_id());
			return ResponseEntity.ok("OK");													
		}
	}
}
