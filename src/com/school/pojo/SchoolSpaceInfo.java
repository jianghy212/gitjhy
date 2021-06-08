package com.school.pojo;

public class SchoolSpaceInfo {
	private Integer sId;
	private String scName;
	private String scImage;
	
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
	public String getScName() {
		return scName;
	}
	public void setScName(String scName) {
		this.scName = scName;
	}
	public String getScImage() {
		return scImage;
	}
	public void setScImage(String scImage) {
		this.scImage = scImage;
	}
	@Override
	public String toString() {
		return "SchoolSpaceInfo [sId=" + sId + ", scName=" + scName + ", scImage=" + scImage + "]";
	}
	
}
