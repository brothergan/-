package com.entity;

import java.sql.Timestamp;


/**
 * d_annotation实体映射类
 * @author 淦师兄
 *
 */
public class Annotation {
	private Integer annotationId;
	private String annotationTitle;
	private String annotationDetail;
	private Timestamp annotationDate;
	
	public Integer getAnnotationId() {
		return annotationId;
	}
	public void setAnnotationId(Integer annotationId) {
		this.annotationId = annotationId;
	}
	
	public String getAnnotationTitle() {
		return annotationTitle;
	}
	public void setAnnotationTitle(String annotationTitle) {
		this.annotationTitle = annotationTitle;
	}
	
	public String getAnnotationDetail() {
		return annotationDetail;
	}
	public void setAnnotationDetail(String annotationDetail) {
		this.annotationDetail = annotationDetail;
	}
	
	public Timestamp getAnnotationDate() {
		return annotationDate;
	}
	public void setAnnotationDate(Timestamp annotationDate) {
		this.annotationDate = annotationDate;
	}
	
	
}
