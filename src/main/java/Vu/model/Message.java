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
@Table(name = "Message")
public class Message {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "message_id")
	private int message_id;
	
	@Column(name = "from_account_id")
	private int from_account_id;
	
	@Column(name = "to_account_id")
	private int to_account_id;
	
	@Column(name = "message_content", columnDefinition = "nvarchar(2000)")
	private String message_content;
	
	@Column(name = "seen", columnDefinition = "bit")
	private boolean seen;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "time", columnDefinition = "datetime")
	private Date time;
	
	@ManyToOne
	@JoinColumn(name = "from_account_id", referencedColumnName = "account_id", insertable = false, updatable = false)
	private Account from_account;
	
	@ManyToOne
	@JoinColumn(name = "to_account_id", referencedColumnName = "account_id", insertable = false, updatable = false)
	private Account to_account;
	
	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "message_id", referencedColumnName = "message_id", insertable = true, updatable = true)
	private List<Message_Image> image;

	public Message() {
		super();
	}

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public int getFrom_account_id() {
		return from_account_id;
	}

	public void setFrom_account_id(int from_account_id) {
		this.from_account_id = from_account_id;
	}

	public int getTo_account_id() {
		return to_account_id;
	}

	public void setTo_account_id(int to_account_id) {
		this.to_account_id = to_account_id;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public boolean isSeen() {
		return seen;
	}

	public void setSeen(boolean seen) {
		this.seen = seen;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Account getFrom_account() {
		return from_account;
	}

	public void setFrom_account(Account from_account) {
		this.from_account = from_account;
	}

	public Account getTo_account() {
		return to_account;
	}

	public void setTo_account(Account to_account) {
		this.to_account = to_account;
	}

	public List<Message_Image> getImage() {
		return image;
	}

	public void setImage(List<Message_Image> image) {
		this.image = image;
	}
	
}
