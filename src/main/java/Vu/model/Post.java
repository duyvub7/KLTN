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
@Table(name = "Post")
public class Post {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "post_id")
	private int post_id;
	
	@Column(name = "post_status", columnDefinition = "bit not null")
	private boolean post_status;
	
	@Column(name = "post_type")
	private int post_type;

	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "post_date", columnDefinition = "datetime")
	private Date post_date;
	
	@Column(name = "post_content", columnDefinition = "nvarchar(4000)")
	private String post_content;
	
	@Column(name = "price")
	private int price;
	
	@Column(name = "account_id")
	private int account_id;
	
	@Column(name = "province_id")
	private int province_id;
	
	@ManyToOne
	@JoinColumn(name = "account_id", referencedColumnName = "account_id", insertable = false, updatable = false)
	private Account account;
	
	@ManyToOne
	@JoinColumn(name = "post_type", referencedColumnName = "type_id", insertable = false, updatable = false)
	private PostType type;
	
	@ManyToOne
	@JoinColumn(name = "province_id", referencedColumnName = "province_id", insertable = false, updatable = false)
	private Province province;
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "post_id", referencedColumnName = "post_id", insertable = true, updatable = true)
	private List<Post_Image> image;
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "post_id", referencedColumnName = "post_id", insertable = true, updatable = true)
	private List<Comment> comment;
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "post_id", referencedColumnName = "post_id", insertable = true, updatable = true)
	private List<Post_Like> like;

	public Post() {
		super();
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public boolean isPost_status() {
		return post_status;
	}

	public void setPost_status(boolean post_status) {
		this.post_status = post_status;
	}

	public int getPost_type() {
		return post_type;
	}

	public void setPost_type(int post_type) {
		this.post_type = post_type;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public int getProvince_id() {
		return province_id;
	}

	public void setProvince_id(int province_id) {
		this.province_id = province_id;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public PostType getType() {
		return type;
	}

	public void setType(PostType type) {
		this.type = type;
	}

	public List<Post_Image> getImage() {
		return image;
	}

	public void setImage(List<Post_Image> image) {
		this.image = image;
	}

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
	
	public List<Post_Like> getLike() {
		return like;
	}

	public void setLike(List<Post_Like> like) {
		this.like = like;
	}

}
