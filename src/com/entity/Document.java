package com.entity;

import java.sql.Timestamp;


/**
 * d_document实体映射类
 * @author 淦师兄
 *
 */
public class Document {
	private Integer documentId;
	private String documentType;
	private String documentName;
	private String documentDesc;
	private String documentRsc;
	private Integer downloadTime;
	private Integer downloadStatus;
	private Integer documentStatus;
	private Timestamp uploadTime;
	private Timestamp updateTime;
	
	private User user;

	public Integer getDocumentId() {
		return documentId;
	}

	public void setDocumentId(Integer documentId) {
		this.documentId = documentId;
	}

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public String getDocumentDesc() {
		return documentDesc;
	}

	public void setDocumentDesc(String documentDesc) {
		this.documentDesc = documentDesc;
	}

	public String getDocumentRsc() {
		return documentRsc;
	}

	public void setDocumentRsc(String documentRsc) {
		this.documentRsc = documentRsc;
	}

	public Integer getDownloadTime() {
		return downloadTime;
	}

	public void setDownloadTime(Integer downloadTime) {
		this.downloadTime = downloadTime;
	}

	public Integer getDownloadStatus() {
		return downloadStatus;
	}

	public void setDownloadStatus(Integer downloadStatus) {
		this.downloadStatus = downloadStatus;
	}

	public Integer getDocumentStatus() {
		return documentStatus;
	}

	public void setDocumentStatus(Integer documentStatus) {
		this.documentStatus = documentStatus;
	}

	public Timestamp getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
