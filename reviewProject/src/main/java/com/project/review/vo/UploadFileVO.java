package com.project.review.vo;

public class UploadFileVO {
	
	private int file_num;
	private String file_name;
	private byte[] fileData;
	//--------------------------
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	@Override
	public String toString() {
		return "UploadFileVO [file_num=" + file_num + ", file_name=" + file_name + "]";
	}
	
	
	
	
}
