package Vu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Post_Like")
public class Post_Like {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "like_id")
	private int like_id;
	
	@Column(name = "account_id")
	private int account_id;
	
	@Column(name = "post_id")
	private int post_id;
	
	@ManyToOne
	@JoinColumn(name = "account_id", referencedColumnName = "account_id", insertable = false, updatable = false)
	private Account account;
	
	@ManyToOne
	@JoinColumn(name = "post_id", referencedColumnName = "post_id", insertable = false, updatable = false)
	private Post post;

	public Post_Like() {
		super();
	}

	public int getLike_id() {
		return like_id;
	}

	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
	
}
