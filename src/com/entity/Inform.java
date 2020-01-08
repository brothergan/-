package com.entity;

import java.sql.Timestamp;

/**
 * d_inform的实体映射类
 * @author 淦师兄
 *
 */
public class Inform {
	private Integer informId;
	private String informType;
	private Integer targetId;
	private String informReason;
	private Timestamp informDate;
	
	public Integer getInformId() {
		return informId;
	}
	public void setInformId(Integer informId) {
		this.informId = informId;
	}
	
	public String getInformType() {
		return informType;
	}
	public void setInformType(String informType) {
		this.informType = informType;
	}
	
	public Integer getTargetId() {
		return targetId;
	}
	public void setTargetId(Integer targetId) {
		this.targetId = targetId;
	}
	
	public String getInformReason() {
		return informReason;
	}
	public void setInformReason(String informReason) {
		this.informReason = informReason;
	}
	
	public Timestamp getInformDate() {
		return informDate;
	}
	public void setInformDate(Timestamp informDate) {
		this.informDate = informDate;
	}
	
	
}
