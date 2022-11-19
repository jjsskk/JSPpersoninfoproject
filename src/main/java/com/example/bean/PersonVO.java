package com.example.bean;

import java.util.Date;

public class PersonVO {
	private int seq;
	private String id;
	private String name;
	private String pwd;
	private String phone_num;
	private String address;
	private String gender;
	private int hobby_movie=0;
	private int hobby_health=0;
	private int hobby_sew=0;
	private String major;
	private String birth;
	private String content;
	private Date regdate;
	private String photo;

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getHobby_movie() {
		return hobby_movie;
	}

	public void setHobby_movie(int hobby_movie) {
		this.hobby_movie = hobby_movie;
	}

	public int getHobby_health() {
		return hobby_health;
	}

	public void setHobby_health(int hobby_health) {
		this.hobby_health = hobby_health;
	}

	public int getHobby_sew() {
		return hobby_sew;
	}

	public void setHobby_sew(int hobby_sew) {
		this.hobby_sew = hobby_sew;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
