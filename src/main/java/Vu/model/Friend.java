package Vu.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Friend")
public class Friend {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "frend_id")
	private int frend_id;
	
	@Column(name = "friend_status", columnDefinition = "bit not null")
	private boolean friend_status;
	
	@Column(name = "from_account_id")
	private int from_account_id;
	
	@Column(name = "to_account_id")
	private int to_account_id;
	
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

	public Friend() {
		super();
	}

	public int getFrend_id() {
		return frend_id;
	}

	public void setFrend_id(int frend_id) {
		this.frend_id = frend_id;
	}

	public boolean isFriend_status() {
		return friend_status;
	}

	public void setFriend_status(boolean friend_status) {
		this.friend_status = friend_status;
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
	
}
