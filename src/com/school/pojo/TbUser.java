package com.school.pojo;

public class TbUser {
	 private Integer uid;

	    private String userAccount;

	    private String userName;

	    private String userPwd;

	    private Integer userIdentity;

	    private String userSex;

	    private String userImage;

	    private String userAcademy;

	    private Integer loginin;

	    public Integer getUid() {
	        return uid;
	    }

	    public void setUid(Integer uid) {
	        this.uid = uid;
	    }

	    public String getUserAccount() {
	        return userAccount;
	    }

	    public void setUserAccount(String userAccount) {
	        this.userAccount = userAccount == null ? null : userAccount.trim();
	    }

	    public String getUserName() {
	        return userName;
	    }

	    public void setUserName(String userName) {
	        this.userName = userName == null ? null : userName.trim();
	    }

	    public String getUserPwd() {
	        return userPwd;
	    }

	    public void setUserPwd(String userPwd) {
	        this.userPwd = userPwd == null ? null : userPwd.trim();
	    }

	    public Integer getUserIdentity() {
	        return userIdentity;
	    }

	    public void setUserIdentity(Integer userIdentity) {
	        this.userIdentity = userIdentity;
	    }

	    public String getUserSex() {
	        return userSex;
	    }

	    public void setUserSex(String userSex) {
	        this.userSex = userSex == null ? null : userSex.trim();
	    }

	    public String getUserImage() {
	        return userImage;
	    }

	    public void setUserImage(String userImage) {
	        this.userImage = userImage == null ? null : userImage.trim();
	    }

	    public String getUserAcademy() {
	        return userAcademy;
	    }

	    public void setUserAcademy(String userAcademy) {
	        this.userAcademy = userAcademy == null ? null : userAcademy.trim();
	    }

	    public Integer getLoginin() {
	        return loginin;
	    }

	    public void setLoginin(Integer loginin) {
	        this.loginin = loginin;
	    }
}