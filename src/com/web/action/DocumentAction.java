package com.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;

import com.entity.Document;
import com.entity.PageBean;
import com.entity.User;
import com.service.DocumentService;
import com.utils.StringUtils;

public class DocumentAction extends BaseAction {
	private File documentRsc;
	private String documentRscFileName;
	private String documentRscContentType;
	private String savePath;
	private String documentId;
	private String documentName;
	private String documentType;
	private String documentDesc;
	private String downloadStatus;
	private InputStream inputStream;
	private String fileName;
	private String downPath;
	private DocumentService documentService;
	private int pageIndex;
	private Map<String,Object> jsonMap=new HashMap<String, Object>();
	private List<Object> jsonList=new ArrayList<Object>();
	public String addDocument(){
		User user=(User) session.get("loginUser");
		String rootPath=this.getSavePath()+"/"+user.getUserLoginName();
		validatePath(rootPath);
		FileInputStream fis=null;
		FileOutputStream fos=null;
		try {
			fis=new FileInputStream(documentRsc);
			fos=new FileOutputStream(rootPath+"/"+documentRscFileName);
			IOUtils.copy(fis, fos);
			Document document=new Document();
			document.setDocumentName(documentName);
			document.setDocumentType(documentType);
			document.setDocumentDesc(documentDesc);
			document.setDocumentRsc(documentRscFileName);
			document.setDownloadTime(0);
			document.setDownloadStatus(StringUtils.str2Integer(downloadStatus, 0));
			document.setDocumentStatus(1);
			document.setUploadTime(new Timestamp(System.currentTimeMillis()));
			document.setUpdateTime(new Timestamp(System.currentTimeMillis()));
			document.setUser(user);
			documentService.saveDocument(document);
			jsonMap.clear();
			jsonMap.put("msg", "添加文档成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				fos.close();
				fis.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return "jsonMap";
	}
	
	public String ListDocumentByUser(){
		try {
			int pageSize=10;
			User user=(User) session.get("loginUser");
			PageBean<Document> pageBean=documentService.getPageBeanByUser(user.getUserId(), pageIndex, pageSize);
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
	public String ListDocumentByCondition(){
		try {
			int pageSize=10;
			Map<String,Object> paraMap=new HashMap<String, Object>();
			if(documentName!=null&&documentName.trim().length()>0){
				paraMap.put("documentName", "%"+documentName+"%");
			}
			if(documentType!=null&&documentType.trim().length()>0){
				paraMap.put("documentType", documentType);
			}
			PageBean<Document> pageBean=documentService.getPageBeanByCondition(paraMap, pageIndex, pageSize);
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
	public String loadDocumentById(){
		try {
			Document document=documentService.findById(StringUtils.str2Integer(documentId, 0));
			if(document!=null){
				if(session.get("doc")!=null){
					session.remove("doc");
				}
				session.put("doc", document);
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
	
	public void validatePath(String filePath){
		File file=new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
	}
	
	public String updateDocument(){
		FileInputStream fis=null;
		FileOutputStream fos=null;
		try {
			Document document=documentService.findById(StringUtils.str2Integer(documentId, 0));
			String rootPath=this.getSavePath()+"/"+document.getUser().getUserLoginName();
			validatePath(rootPath);
			if(documentRsc!=null){
				fis=new FileInputStream(documentRsc);
				fos=new FileOutputStream(rootPath+"/"+documentRscFileName);
				IOUtils.copy(fis, fos);
				File oldDoc=new File(rootPath+"/"+document.getDocumentRsc());
				if(oldDoc!=null){
					oldDoc.delete();
				}
				document.setDocumentRsc(documentRscFileName);
			}
			document.setDocumentName(documentName);
			document.setDocumentType(documentType);
			document.setDocumentDesc(documentDesc);
			document.setDownloadStatus(StringUtils.str2Integer(downloadStatus, 0));
			document.setUpdateTime(new Timestamp(System.currentTimeMillis()));
			documentService.updateDocument(document);
			jsonMap.clear();
			jsonMap.put("msg", "更新文档成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			try {
				fos.close();
				fis.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return "jsonMap";
	}
	public String deleteDocument(){
		try {
			Document document=documentService.findById(StringUtils.str2Integer(documentId, 0));
			String rootPath=this.getSavePath()+"/"+document.getUser().getUserLoginName();
			validatePath(rootPath);
			File oldDoc=new File(rootPath+"/"+document.getDocumentRsc());
			if(oldDoc!=null){
				oldDoc.delete();
			}
			document.setDocumentStatus(0);
			document.setUpdateTime(new Timestamp(System.currentTimeMillis()));
			documentService.updateDocument(document);
			jsonMap.clear();
			jsonMap.put("msg", "删除文档成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String downloadDocument() throws Exception{
		try {
			Document document=documentService.findById(StringUtils.str2Integer(documentId, 0));
			document.setDownloadTime(document.getDownloadTime()+1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return super.execute();
	}
	public String lockDocument() throws Exception{
		try {
			Document document=documentService.findById(StringUtils.str2Integer(documentId, 0));
			document.setDownloadStatus(0);
			documentService.updateDocument(document);
			session.remove("doc");
			session.put("doc", document);
			jsonMap.clear();
			jsonMap.put("msg", "锁定文档成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String unlockDocument() throws Exception{
		try {
			Document document=documentService.findById(StringUtils.str2Integer(documentId, 0));
			document.setDownloadStatus(01);
			documentService.updateDocument(document);
			session.remove("doc");
			session.put("doc", document);
			jsonMap.clear();
			jsonMap.put("msg", "解锁文档成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public File getDocumentRsc() {
		return documentRsc;
	}
	public void setDocumentRsc(File documentRsc) {
		this.documentRsc = documentRsc;
	}
	public String getDocumentRscFileName() {
		return documentRscFileName;
	}
	public void setDocumentRscFileName(String documentRscFileName) {
		this.documentRscFileName = documentRscFileName;
	}
	public String getDocumentRscContentType() {
		return documentRscContentType;
	}
	public void setDocumentRscContentType(String documentRscContentType) {
		this.documentRscContentType = documentRscContentType;
	}
	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath("/")+savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public String getDocumentType() {
		return documentType;
	}

	public void setDocumentType(String documentType) {
		this.documentType = documentType;
	}

	public String getDocumentDesc() {
		return documentDesc;
	}

	public void setDocumentDesc(String documentDesc) {
		this.documentDesc = documentDesc;
	}

	public String getDownloadStatus() {
		return downloadStatus;
	}

	public void setDownloadStatus(String downloadStatus) {
		this.downloadStatus = downloadStatus;
	}

	
	public InputStream getInputStream() throws FileNotFoundException, UnsupportedEncodingException {
		String filePath=this.getDownPath()+"/"+documentService.findById(StringUtils.str2Integer(documentId, 0)).getUser().getUserLoginName()+"/"+fileName;
		return new FileInputStream(filePath);
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getFileName() throws UnsupportedEncodingException {
		return new String(fileName.getBytes("utf-8"),"ISO-8859-1");
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getDownPath() {
		return ServletActionContext.getServletContext().getRealPath("/")+downPath;
	}

	public void setDownPath(String downPath) {
		this.downPath = downPath;
	}

	public DocumentService getDocumentService() {
		return documentService;
	}

	public void setDocumentService(DocumentService documentService) {
		this.documentService = documentService;
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

	public List<Object> getJsonList() {
		return jsonList;
	}
	
	
}
