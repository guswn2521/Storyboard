package com.bigdata.dto;

public class MembersDto {
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String mail;
	public MembersDto() {
		// TODO Auto-generated constructor stub
	}
	public MembersDto(String id, String pw, String name, String nickname, String mail) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.mail = mail;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	@Override
	public String toString() {
		return "memberInfoDto [id=" + id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname + ", mail=" + mail
				+ "]";
	}
}
