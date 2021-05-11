package Vu.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Comment")
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "comment_id")
	private int comment_id;
	
	@Column(name = "comment_content", columnDefinition = "nvarchar(2000)")
	private String comment_content;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "time", columnDefinition = "datetime")
	private Date time;
	
	@Column(name = "account_id")
	private int account_id;
	
	@Column(name = "post_id")
	private int post_id;
	
	@ManyToOne
	@JoinColumn(name = "account_id", referencedColumnName = "account_id", insertable = false, updatable = false)
	private Account account;
	
	@OneToMany
	@JoinColumn(name = "comment_id", referencedColumnName = "comment_id", insertable = true, updatable = true)
	private List<Comment_Like> like;
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "comment_id", referencedColumnName = "comment_id", insertable = true, updatable = true)
	private List<Comment_Image> image;

	public Comment() {
		super();
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
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

	public List<Comment_Like> getLike() {
		return like;
	}

	public void setLike(List<Comment_Like> like) {
		this.like = like;
	}

	public List<Comment_Image> getImage() {
		return image;
	}

	public void setImage(List<Comment_Image> image) {
		this.image = image;
	}
	
}
