package com.web.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import com.entity.Admin;
import com.entity.Annotation;
import com.entity.PageBean;
import com.service.AnnotationService;
import com.utils.StringUtils;

public class AnnotationAction extends BaseAction{
	private AnnotationService annotationService;
	private int pageIndex;
	private Map<String,Object> jsonMap=new HashMap<String, Object>();
	private String annotationId;
	private String annotationTitle;
	private String annotationDetail;

	public AnnotationService getAnnotationService() {
		return annotationService;
	}

	public void setAnnotationService(AnnotationService annotationService) {
		this.annotationService = annotationService;
	}
	
	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	
	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}
	
	public String getAnnotationId() {
		return annotationId;
	}

	public void setAnnotationId(String annotationId) {
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

	public String listAnnotation(){
		try {
			int pageSize=10;
			Map<String,Object> paraMap=new HashMap<String, Object>();
			PageBean<Annotation> pageBean=annotationService.getPageBeanByCondition(paraMap, pageIndex, pageSize);
			jsonMap.clear();
			jsonMap.put("pageIndex", pageBean.getPageIndex());
			jsonMap.put("pageCount", pageBean.getPageCount());
			jsonMap.put("totalCount", pageBean.getTotalCount());
			jsonMap.put("pageSize", pageBean.getPageSize());
			jsonMap.put("list", pageBean.getList());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	
	public String loadAnnotationById(){
		try {
			Annotation annotation=annotationService.findById(StringUtils.str2Integer(annotationId, 0));
			if(annotation!=null){
				if(session.get("annotation")!=null){
					session.remove("annotation");
				}
				session.put("annotation", annotation);
				jsonMap.clear();
				jsonMap.put("status", 1);
			}else{
				jsonMap.put("status", 0);
				jsonMap.put("msg", "fail");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	
	public String publishAnnotation(){
		Annotation annotation=new Annotation();
		annotation.setAnnotationTitle(annotationTitle);
		annotation.setAnnotationDetail(annotationDetail);
		annotation.setAnnotationDate(new Timestamp(System.currentTimeMillis()));
		try {
			annotationService.saveAnnotation(annotation);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		jsonMap.clear();
		jsonMap.put("msg", "发布公告成功");
		return "jsonMap";
	}
}
