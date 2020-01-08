package com.utils;

public class StringUtils {
	public static Integer str2Integer(String str,Integer defValue){
		if(str!=null&&!str.isEmpty()){
			try {
				return new Integer(str);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return defValue;
	}
}
