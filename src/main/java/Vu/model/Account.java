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
@Table(name = "Account")
public class Account {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "account_id")
	private int account_id;
	
	@Column(name = "role")
	private int role;
	
	@Column(name = "account_status", columnDefinition = "bit not null")
	private boolean account_status;
	
	@Column(name = "password", columnDefinition = "varchar(20) not null")
	private String password;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	@Column(name = "create_date", columnDefinition = "date")
	private Date create_date;
	
	@Column(name = "name", columnDefinition = "nvarchar(50)")
	private String name;
	
	@Column(name = "gender")
	private int gender;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	@Column(name = "birthday", columnDefinition = "date")
	private Date birthday;
	
	@Column(name = "phone", columnDefinition = "varchar(10) not null")
	private String phone;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "avatar")
	private String avatar;
	
	@Column(name = "wall_image")
	private String wall_image;
	
	@Column(name = "introduction", columnDefinition = "nvarchar(250)")
	private String introduction;
	
	@Column(name = "address", columnDefinition = "nvarchar(150)")
	private String address;
	
	@Column(name = "province_id")
	private int province_id;
	
	@ManyToOne
	@JoinColumn(name = "province_id", referencedColumnName = "province_id", insertable = false, updatable = false)
	private Province province;
	
	public Account() {
		super();
	}

	public Account(int role, boolean account_status, String password, String phone) {
		super();
		this.role = role;
		this.account_status = account_status;
		this.password = password;
		this.phone = phone;
	}

	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public boolean isAccount_status() {
		return account_status;
	}

	public void setAccount_status(boolean account_status) {
		this.account_status = account_status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getWall_image() {
		return wall_image;
	}

	public void setWall_image(String wall_image) {
		this.wall_image = wall_image;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getProvince_id() {
		return province_id;
	}

	public void setProvince_id(int province_id) {
		this.province_id = province_id;
	}

	public Province getProvince() {
		return province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}
	
}
