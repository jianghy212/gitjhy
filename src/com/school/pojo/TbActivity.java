package com.school.pojo;

public class TbActivity {
    private Integer aid;

    private Integer userId;

    private String acName;

    private String acImage;

    private String acText;

    private String acOrganization;

    private String userQq;

    private String acAddr;

    private String acCity;

    private String acKind;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAcName() {
        return acName;
    }

    public void setAcName(String acName) {
        this.acName = acName == null ? null : acName.trim();
    }

    public String getAcImage() {
        return acImage;
    }

    public void setAcImage(String acImage) {
        this.acImage = acImage == null ? null : acImage.trim();
    }

    public String getAcText() {
        return acText;
    }

    public void setAcText(String acText) {
        this.acText = acText == null ? null : acText.trim();
    }

    public String getAcOrganization() {
        return acOrganization;
    }

    public void setAcOrganization(String acOrganization) {
        this.acOrganization = acOrganization == null ? null : acOrganization.trim();
    }

    public String getUserQq() {
        return userQq;
    }

    public void setUserQq(String userQq) {
        this.userQq = userQq == null ? null : userQq.trim();
    }

    public String getAcAddr() {
        return acAddr;
    }

    public void setAcAddr(String acAddr) {
        this.acAddr = acAddr == null ? null : acAddr.trim();
    }

    public String getAcCity() {
        return acCity;
    }

    public void setAcCity(String acCity) {
        this.acCity = acCity == null ? null : acCity.trim();
    }

    public String getAcKind() {
        return acKind;
    }

    public void setAcKind(String acKind) {
        this.acKind = acKind == null ? null : acKind.trim();
    }
}