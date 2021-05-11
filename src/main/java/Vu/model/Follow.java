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
@Table(name = "Follow")
public class Follow {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "follow_id")
	private int follow_id;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	@Column(name = "time", columnDefinition = "date")
	private Date time;
	
	@Column(name = "from_account_id")
	private int from_account_id;
	
	@Column(name = "to_account_id")
	private int to_account_id;
	
	@ManyToOne
	@JoinColumn(name = "from_account_id", referencedColumnName = "account_id", insertable = false, updatable = false)
	private Account from_account;
	
	@ManyToOne
	@JoinColumn(name = "to_account_id", referencedColumnName = "account_id", insertable = false, updatable = false)
	private Account to_account;

	public Follow() {
		super();
	}

	public int getFollow_id() {
		return follow_id;
	}

	public void setFollow_id(int follow_id) {
		this.follow_id = follow_id;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
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
