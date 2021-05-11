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
@Table(name = "Notification")
public class Notification {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "notification_id")
	private int notification_id;
	
	@Column(name = "notification_content", columnDefinition = "nvarchar(200)")
	private String notification_content;
	
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

	public Notification() {
		super();
	}

	public int getNotification_id() {
		return notification_id;
	}

	public void setNotification_id(int notification_id) {
		this.notification_id = notification_id;
	}

	public String getNotification_content() {
		return notification_content;
	}

	public void setNotification_content(String notification_content) {
		this.notification_content = notification_content;
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
